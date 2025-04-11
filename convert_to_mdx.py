import os
import json
import re
import glob
from pathlib import Path
import unicodedata
import difflib

# Function to read the done.txt file
def read_done_file():
    done_files = set()
    if os.path.exists('done.txt'):
        with open('done.txt', 'r', encoding='utf-8') as f:
            for line in f:
                line = line.strip()
                if line:
                    done_files.add(line)
    return done_files

# Function to add file to done.txt
def add_to_done(file_path):
    with open('done.txt', 'a', encoding='utf-8') as f:
        f.write(f"{file_path}\n")

# Function to extract all file paths from docs.json
def extract_paths_from_docs_json():
    with open('docs.json', 'r', encoding='utf-8') as f:
        docs_data = json.load(f)
    
    paths = []
    
    def extract_page_paths(obj):
        if isinstance(obj, dict):
            for key, value in obj.items():
                if key == 'pages' and isinstance(value, list):
                    for page in value:
                        if isinstance(page, str) and page.startswith('docs/'):
                            paths.append(page)
                else:
                    extract_page_paths(value)
        elif isinstance(obj, list):
            for item in obj:
                extract_page_paths(item)
    
    extract_page_paths(docs_data)
    return paths

# Function to normalize a string for better matching
def normalize_string(s):
    # Remove dashes, spaces, underscores
    s = s.lower()
    s = re.sub(r'[-_ ]', '', s)
    # Remove emojis and other special characters
    s = ''.join(c for c in s if not unicodedata.category(c).startswith('So'))
    # Remove other non-alphanumeric characters
    s = re.sub(r'[^\w]', '', s)
    return s

# Function to find the best matching file
def find_best_matching_file(directory, filename):
    if not os.path.exists(directory):
        return None
    
    # Get all files in the directory
    all_files = []
    for f in os.listdir(directory):
        if os.path.isfile(os.path.join(directory, f)):
            all_files.append(f)
    
    if not all_files:
        return None
    
    # Normalize the filename for matching
    normalized_filename = normalize_string(filename)
    
    # Calculate similarity scores
    scores = []
    for f in all_files:
        f_name, f_ext = os.path.splitext(f)
        normalized_f = normalize_string(f_name)
        if normalized_filename in normalized_f or normalized_f in normalized_filename:
            # Higher score for substring matches
            sim_score = difflib.SequenceMatcher(None, normalized_filename, normalized_f).ratio()
            scores.append((f, sim_score))
    
    # Sort by similarity score (highest first)
    scores.sort(key=lambda x: x[1], reverse=True)
    
    # Return the most similar file if score is above threshold
    if scores and scores[0][1] > 0.6:  # Adjust threshold as needed
        return os.path.join(directory, scores[0][0])
    
    return None

# Function to convert a file to MDX format
def convert_to_mdx(file_path):
    # Determine the directory and filename
    directory = os.path.dirname(file_path)
    filename = os.path.basename(file_path)
    mdx_path = f"{file_path}.mdx"
    
    # If mdx already exists, skip
    if os.path.exists(mdx_path):
        print(f"MDX file already exists: {mdx_path}")
        return mdx_path, False
    
    # First try exact path with .md extension
    md_path = f"{file_path}.md"
    if not os.path.exists(md_path):
        # Try to find best matching file
        best_match = find_best_matching_file(directory, filename)
        if best_match:
            md_path = best_match
            print(f"Found similar file: {md_path}")
        else:
            print(f"No source file found for: {file_path}")
            return None, False
    
    # Read the content of the matched file
    with open(md_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Check if the file already has front matter
    has_frontmatter = re.match(r'^---\s*\n', content)
    
    # Extract title from content if not in front matter
    title = ""
    if not has_frontmatter:
        # Try to extract title from the first h1 heading
        h1_match = re.search(r'^# (.+)$', content, re.MULTILINE)
        if h1_match:
            title = h1_match.group(1).strip()
        else:
            # Use the filename as title
            title = os.path.basename(file_path).replace('-', ' ').replace('_', ' ')
    
    # Format the content as MDX
    if not has_frontmatter:
        # Add front matter with title
        formatted_content = f"---\ntitle: \"{title}\"\n---\n\n{content}"
    else:
        formatted_content = content
    
    # Convert deprecated syntax to MDX components
    # Replace warning/info/success blocks with MDX components
    formatted_content = re.sub(r':::warning\s*(.*?):::', r'<Warning>\n\1\n</Warning>', formatted_content, flags=re.DOTALL)
    formatted_content = re.sub(r':::info\s*(.*?):::', r'<Note>\n\1\n</Note>', formatted_content, flags=re.DOTALL)
    formatted_content = re.sub(r':::success\s*(.*?):::', r'<Note>\n\1\n</Note>', formatted_content, flags=re.DOTALL)
    
    # Remove HTML font tags, which aren't recommended in MDX
    formatted_content = re.sub(r'<font[^>]*>(.*?)<\/font>', r'\1', formatted_content)
    
    # Ensure directory exists for output
    os.makedirs(os.path.dirname(mdx_path), exist_ok=True)
    
    # Write the MDX file
    with open(mdx_path, 'w', encoding='utf-8') as f:
        f.write(formatted_content)
    
    print(f"Converted: {mdx_path}")
    return mdx_path, True

# Function to update docs.json to match actual filenames
def update_docs_json_paths():
    print("Updating docs.json paths to match actual filenames...")
    with open('docs.json', 'r', encoding='utf-8') as f:
        docs_data = json.load(f)
    
    # Helper function to recursively search and update paths in docs.json
    def update_paths(obj):
        if isinstance(obj, dict):
            for key, value in obj.items():
                if key == 'pages' and isinstance(value, list):
                    for i, page in enumerate(value):
                        if isinstance(page, str) and page.startswith('docs/'):
                            # Check if page exists with .mdx extension
                            mdx_path = f"{page}.mdx"
                            if os.path.exists(mdx_path):
                                value[i] = page  # Already correct format
                            else:
                                # Try to find best matching file
                                directory = os.path.dirname(page)
                                filename = os.path.basename(page)
                                best_match = find_best_matching_file(directory, filename)
                                if best_match:
                                    # Strip .mdx extension for docs.json
                                    best_match = best_match[:-4] if best_match.endswith('.mdx') else best_match
                                    value[i] = best_match
                else:
                    update_paths(value)
        elif isinstance(obj, list):
            for item in obj:
                update_paths(item)
    
    update_paths(docs_data)
    
    # Write updated docs.json
    with open('docs.json.updated', 'w', encoding='utf-8') as f:
        json.dump(docs_data, f, indent=2, ensure_ascii=False)
    
    print("Updated docs.json saved as docs.json.updated")

def main():
    # Read the list of files already done
    done_files = read_done_file()
    
    # Extract paths from docs.json
    paths = extract_paths_from_docs_json()
    
    print(f"Found {len(paths)} paths in docs.json")
    
    # Process each path
    for path in paths:
        # Skip if already in done.txt
        if path + '.mdx' in done_files or path in done_files:
            print(f"Skipping {path} (already processed)")
            continue
        
        # Convert the file
        mdx_path, converted = convert_to_mdx(path)
        
        # Add to done.txt if converted successfully
        if mdx_path and converted:
            add_to_done(mdx_path)
    
    # Update docs.json paths to match actual filenames
    update_docs_json_paths()

if __name__ == "__main__":
    main() 