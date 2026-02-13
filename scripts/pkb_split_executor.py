#!/usr/bin/env python3
"""
pkb_split_executor.py: Execute a split plan by creating extracted files and updating the original file.
Arguments: split_plan_json, original_file_path, notes_dir
"""

import argparse
import json
import os
import sys

def main():
    parser = argparse.ArgumentParser(description="Execute a split plan.")
    parser.add_argument("split_plan_json", help="JSON string of the split plan")
    parser.add_argument("notes_dir", help="Directory for notes")
    parser.add_argument("original_file", help="Path to original markdown file")
    
    args = parser.parse_args()
    
    try:
        split_plan = json.loads(args.split_plan_json)
    except json.JSONDecodeError as e:
        sys.stderr.write(f"Invalid split plan JSON: {e}\n")
        sys.exit(1)
        
    try:
        with open(args.original_file, 'r') as f:
            lines = f.readlines()
            
        # Identify heading boundaries from Level 2 headings (##)
        all_headings = []
        for i, line in enumerate(lines):
            if line.startswith('## '):
                all_headings.append(i)
        all_headings.append(len(lines))
        
        updated_content = []
        last_pos = 0
        
        # Ensure plan is sorted by line number
        split_plan.sort(key=lambda x: x['line'])
        
        for section in split_plan:
            start_idx = section['line'] - 1 # line numbers are 1-based, list index 0-based
            
            # Determine end index (next H2 or EOF)
            try:
                curr_h_idx = all_headings.index(start_idx)
                end_idx = all_headings[curr_h_idx + 1]
            except ValueError:
                # Fallback scan
                end_idx = len(lines)
                for h_line in all_headings:
                    if h_line > start_idx:
                        end_idx = h_line
                        break
            
            # Extract content
            content = "".join(lines[start_idx:end_idx])
            
            # Create new file
            new_filename = section['filename']
            base, ext = os.path.splitext(new_filename)
            new_path = os.path.join(args.notes_dir, new_filename)
            
            # Handle potential filename collisions
            counter = 1
            while os.path.exists(new_path):
                new_filename = f"{base}-{counter}{ext}"
                new_path = os.path.join(args.notes_dir, new_filename)
                counter += 1
            
            # Write extract file
            with open(new_path, 'w') as out:
                out.write("---\n")
                out.write(f"title: \"{section['title']}\"\n")
                out.write(f"tags: [physics, extracted]\n")
                out.write(f"date: \"2026-02-13\"\n") # TODO: use actual date or pass it in
                out.write("complexity: intermediate\n")
                out.write("---\n\n")
                out.write(f"# {section['title']}\n\n")
                original_basename = os.path.basename(args.original_file)
                # Remove extension for link
                original_link_target = os.path.splitext(original_basename)[0]
                out.write(f"extracted from [[{original_link_target}]]\n\n")
                
                # We might want to strip the initial "## Heading" if we added "# Heading"
                # For now, keep it simple.
                out.write(content)
                
            print(f"CREATED:{new_filename}")
            
            # Update Original File Content Buffer
            # Add content before extraction point
            updated_content.extend(lines[last_pos:start_idx])
            
            # Add Link
            updated_content.append(f"\n## {section['title']}\n\n")
            # If filename changed due to collision, use actual filename
            extracted_link = os.path.splitext(new_filename)[0]
            updated_content.append(f"Detailed discussion moved to: [[{extracted_link}]]\n\n")
            
            last_pos = end_idx
            
        # Add remaining content
        updated_content.extend(lines[last_pos:])
        
        # Write back to original file
        with open(args.original_file, 'w') as f:
            f.writelines(updated_content)
            
    except Exception as e:
        sys.stderr.write(f"Error executing split: {e}\n")
        sys.exit(1)

if __name__ == "__main__":
    main()
