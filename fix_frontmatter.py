import os
import re
import glob

def fix_frontmatter():
    # Find all MDX files
    mdx_files = glob.glob('docs/**/*.mdx', recursive=True)
    print(f"Found {len(mdx_files)} MDX files")
    
    fixed_count = 0
    
    for file_path in mdx_files:
        # Read file content
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Check if file has frontmatter
        has_frontmatter = re.match(r'^---\s*\n', content)
        if not has_frontmatter:
            # Extract title
            title = ""
            
            # Try to extract title from the first h1 heading
            h1_match = re.search(r'^# (.+)$', content, re.MULTILINE)
            if h1_match:
                title = h1_match.group(1).strip()
            else:
                # Use the filename as title
                title = os.path.basename(file_path).replace('.mdx', '').replace('-', ' ').replace('_', ' ')
            
            # Add frontmatter
            formatted_content = f"---\ntitle: \"{title}\"\n---\n\n{content}"
            
            # Write updated content
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(formatted_content)
            
            print(f"Fixed frontmatter in: {file_path}")
            fixed_count += 1
    
    print(f"\nFixed frontmatter in {fixed_count} files")

if __name__ == "__main__":
    fix_frontmatter() 