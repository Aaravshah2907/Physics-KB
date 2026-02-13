#!/usr/bin/env python3
"""
pkb_hierarchy.py: Builds a hierarchical tree from a flat list of headings.
Input: Lines from stdin in format: level|line_number|title
Output: JSON structure of the hierarchy
"""

import sys
import json

def build_tree(items):
    if not items:
        return []
    
    root = []
    # Stack stores tuples of (level, children_list)
    # Start with level -1 to accommodate level 0 (H1) items as children
    stack = [(-1, root)]
    
    for item in items:
        level, line, title = item
        
        # Pop stack until we find a parent level < current level
        while stack and stack[-1][0] >= level:
            stack.pop()
        
        # Create node
        node = {
            "title": title,
            "level": level,
            "line": line,
            "children": []
        }
        
        # Add to parent
        if stack:
            stack[-1][1].append(node)
        else:
            # Fallback if stack is empty (shouldn't really happen with -1 start)
            root.append(node)
        
        # Push to stack
        stack.append((level, node["children"]))
    
    return root

def main():
    items = []
    # Read from stdin
    try:
        for line in sys.stdin:
            line = line.strip()
            if not line:
                continue
            parts = line.split('|', 2)
            if len(parts) == 3:
                try:
                    level = int(parts[0])
                    line_num = int(parts[1])
                    title = parts[2]
                    items.append((level, line_num, title))
                except ValueError:
                    continue
    except Exception as e:
        sys.stderr.write(f"Error reading input: {e}\n")
        sys.exit(1)

    print(json.dumps(build_tree(items)))

if __name__ == "__main__":
    main()
