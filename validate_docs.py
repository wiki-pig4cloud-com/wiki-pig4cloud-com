import os
import json

def validate_docs_json():
    # Read the docs.json file
    with open('docs.json', 'r', encoding='utf-8') as f:
        docs_data = json.load(f)
    
    # Extract all file paths
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
    
    print(f"Found {len(paths)} paths in docs.json")
    
    # Validate each path
    missing_files = []
    for path in paths:
        # Check if the file exists with .mdx extension
        mdx_path = f"{path}.mdx"
        if not os.path.exists(mdx_path):
            missing_files.append(path)
    
    # Print results
    if missing_files:
        print(f"\nFound {len(missing_files)} missing files:")
        for path in missing_files:
            print(f"  - {path}")
    else:
        print("\nAll files exist!")
    
    # Print summary
    print(f"\nSummary:")
    print(f"  - Total files referenced: {len(paths)}")
    print(f"  - Files exist: {len(paths) - len(missing_files)}")
    print(f"  - Files missing: {len(missing_files)}")

if __name__ == "__main__":
    validate_docs_json() 