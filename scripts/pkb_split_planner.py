#!/usr/bin/env python3
"""
pkb_split_planner.py: Analyzes a file's structure via the topic index and generates a split plan.
Arguments: index_json_path, target_filename, threshold
Output: NO_DATA | NO_SPLIT | JSON list of splits
"""

import json
import os
import re
import sys
import argparse

def main():
    parser = argparse.ArgumentParser(description="Generate a split plan for a large markdown file.")
    parser.add_argument("index_json", help="Path to topic_index.json")
    parser.add_argument("filename", help="Filename of the markdown file (e.g., file.md)")
    parser.add_argument("--threshold", type=int, default=15, help="Max topic count before splitting")
    
    args = parser.parse_args()
    
    try:
        if not os.path.exists(args.index_json):
            print("NO_DATA")
            sys.exit(0)

        with open(args.index_json, "r") as f:
            data = json.load(f)
            
        file_data = next((f for f in data["files"] if f["filename"] == args.filename), None)

        if not file_data:
            print("NO_DATA")
            sys.exit(0)
            
        topic_count = file_data.get("topic_count", 0)
        
        if topic_count <= args.threshold:
            print("NO_SPLIT")
            sys.exit(0)
            
        # Get hierarchy
        hierarchy = file_data.get("hierarchy", [])
        
        # Identify extraction candidates
        candidates = []
        if hierarchy:
            # Assuming first node is H1, take children
            root = hierarchy[0]
            if root.get("children"):
                candidates = root["children"]
            else:
                candidates = hierarchy # Flat
        
        exclude_titles = ["summary", "references", "further reading", "see also", "introduction"]
        valid_sections = []
        
        for node in candidates:
            if node["title"].lower() not in exclude_titles:
                valid_sections.append(node)
                
        if len(valid_sections) >= 2:
            plan = []
            for section in valid_sections:
                title_slug = section["title"].lower()
                title_slug = re.sub(r'[^\w\s-]', '', title_slug).strip().replace(' ', '-')
                # Limit to 6 words
                parts = title_slug.split('-')
                title_slug = '-'.join(parts[:6])
                filename = f"{title_slug}.md"
                
                plan.append({
                    "title": section["title"],
                    "filename": filename,
                    "line": section["line"]
                })
            
            print(json.dumps(plan))
        else:
            print("NO_SPLIT")
            
    except Exception as e:
        sys.stderr.write(f"Error: {e}\n")
        print("NO_SPLIT")
        sys.exit(1)

if __name__ == "__main__":
    main()
