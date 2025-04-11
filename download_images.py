import os
import re
import requests
from pathlib import Path
from urllib.parse import urlparse
import concurrent.futures

def find_markdown_files(directory):
    markdown_files = []
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith(('.md', '.mdx')):
                markdown_files.append(os.path.join(root, file))
    return markdown_files

def extract_image_urls(content):
    # Match both markdown image syntax and HTML img tags
    markdown_pattern = r'!\[.*?\]\((https://cdn\.nlark\.com/.*?)\)'
    html_pattern = r'<img.*?src="(https://cdn\.nlark\.com/.*?)".*?>'
    
    markdown_matches = re.findall(markdown_pattern, content)
    html_matches = re.findall(html_pattern, content)
    
    return list(set(markdown_matches + html_matches))

def download_image(url, output_dir):
    try:
        response = requests.get(url, stream=True)
        response.raise_for_status()
        
        # Get filename from URL
        parsed_url = urlparse(url)
        filename = os.path.basename(parsed_url.path)
        
        # Save image
        output_path = os.path.join(output_dir, filename)
        with open(output_path, 'wb') as f:
            for chunk in response.iter_content(chunk_size=8192):
                f.write(chunk)
        
        return url, filename
    except Exception as e:
        print(f"Error downloading {url}: {str(e)}")
        return url, None

def update_markdown_content(content, image_mapping):
    # Update markdown image syntax
    for old_url, new_filename in image_mapping.items():
        if new_filename:
            new_path = f"/images/{new_filename}"
            content = content.replace(old_url, new_path)
    
    return content

def process_file(file_path, output_dir):
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        image_urls = extract_image_urls(content)
        if not image_urls:
            return
        
        # Download images
        image_mapping = {}
        with concurrent.futures.ThreadPoolExecutor() as executor:
            future_to_url = {executor.submit(download_image, url, output_dir): url for url in image_urls}
            for future in concurrent.futures.as_completed(future_to_url):
                url, filename = future.result()
                if filename:
                    image_mapping[url] = filename
        
        # Update content
        updated_content = update_markdown_content(content, image_mapping)
        
        # Write back to file
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(updated_content)
            
        print(f"Processed {file_path}: Downloaded {len(image_mapping)} images")
        
    except Exception as e:
        print(f"Error processing {file_path}: {str(e)}")

def main():
    # Create images directory if it doesn't exist
    images_dir = os.path.join(os.getcwd(), 'images')
    os.makedirs(images_dir, exist_ok=True)
    
    # Find all markdown files
    markdown_files = find_markdown_files('docs')
    
    # Process each file
    for file_path in markdown_files:
        process_file(file_path, images_dir)
    
    print("Image download and markdown update completed!")

if __name__ == "__main__":
    main() 