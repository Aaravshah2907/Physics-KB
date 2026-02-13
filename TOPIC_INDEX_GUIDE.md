# Topic Index System

## Overview

The Physics Knowledge Base includes an automated topic indexing system that tracks all headings and subheadings across your notes. This provides a bird's-eye view of your entire knowledge base structure.

## Generated Files

### 1. `topic_index.json`
**Format**: JSON  
**Purpose**: Machine-readable structured index for programmatic access

**Structure**:
```json
{
  "generated_at": "ISO timestamp",
  "total_files": 9,
  "total_topics": 141,
  "files": [
    {
      "filename": "classical-mechanics.md",
      "path": "notes/classical-mechanics.md",
      "title": "Classical Mechanics",
      "summary": "This note explores the core principles of Classical Mechanics, delving into its mathematical foundations and physical consequences.",
      "tags": ["physics", "mechanics"],
      "complexity": "advanced",
      "date": "2026-02-12",
      "topic_count": 23,
      "max_depth": 3,
      "hierarchy": [
        {
          "title": "Classical Mechanics",
          "level": 1,
          "line": 1,
          "children": [...]
        }
      ]
    }
  ]
}
```

**Use Cases**:
- **AI Context Injections**: Provide LLMs with a high-level summary of existing knowledge to prevent redundancy.
- **Semantic Bridging**: Identify conceptual links between notes using summarized data.
- **Fast Search**: Browse high-level summaries without opening full markdown files.
- **Dashboarding**: Power visualizations and health metrics.

### 2. `TOPIC_INDEX.md`
**Format**: Markdown  
**Purpose**: Human-readable index for browsing in Obsidian

**Contents**:
- Table of contents with topic counts
- Detailed hierarchy for each file
- Statistics by complexity and tags
- Line number references for quick navigation

## Usage

### Generate/Update Index

```bash
./scripts/pkb-index
```

**When to run**:
- After creating new notes
- After refining or rebuilding notes
- Before analyzing your knowledge base structure
- Periodically to track growth

### Automated Integration

You can add index generation to your existing scripts:

```bash
# In pkb-gen, pkb-refine, or pkb-rebuild
./scripts/pkb-index
```

## Features

### Hierarchical Structure
- Preserves heading levels (H1-H6)
- Maintains parent-child relationships
- Tracks nesting depth

### Metadata Extraction
- **YAML frontmatter parsing**: Tags, complexity, and dates.
- **Content Summarization**: Intelligent extraction of the introduction or "Summary" section for contextual parity.
- **Topic Counts**: Tracks total granularity per note.

### Statistics
- Total files and topics
- Average topics per file
- Distribution by complexity
- Distribution by tags
- Maximum nesting depth

### Line References
Each heading includes its line number for quick navigation in your editor.

## Example Queries

### Find All Topics on a Subject

Search `topic_index.json` for specific keywords:

```bash
cat topic_index.json | jq '.files[] | select(.tags[] | contains("electromagnetism"))'
```

### Count Topics by Complexity

```bash
cat topic_index.json | jq '.files | group_by(.complexity) | map({complexity: .[0].complexity, count: length})'
```

### Find Deepest Hierarchies

```bash
cat topic_index.json | jq '.files | sort_by(.max_depth) | reverse | .[0:5] | .[] | {title, max_depth}'
```

### List All Level-1 Headings

```bash
cat topic_index.json | jq '.files[].hierarchy[] | select(.level == 1) | .title'
```

## Integration Ideas

### 1. Knowledge Graph Visualization
Use the hierarchy data to generate interactive visualizations with D3.js or Cytoscape.

### 2. Topic Coverage Analysis
Identify gaps in your knowledge base by comparing your index against a curriculum or textbook.

### 3. Automated Table of Contents
Generate a master TOC for your entire knowledge base.

### 4. Cross-Reference Checker
Compare backlinks in notes against the actual topic hierarchy to find broken references.

### 5. Study Path Generator
Use topic depth and complexity to create learning paths from basic to advanced.

## File Format Details

### JSON Schema

The JSON index follows this schema:
- **Root**: Object with metadata and file array
- **Files**: Array of file objects
- **Hierarchy**: Recursive tree structure
- **Children**: Array of child nodes (can be nested)

### Markdown Format

The Markdown index uses:
- Headers for organization
- Indented lists for hierarchy
- Inline metadata (complexity, tags, dates)
- Statistics sections at the end

## Performance

- **Speed**: Processes ~10 files/second
- **Memory**: Minimal (streaming parser)
- **Output Size**: ~2-3KB per file indexed

## Troubleshooting

### Empty Hierarchy
**Cause**: No headings found in file  
**Solution**: Ensure notes use proper markdown headings (#, ##, ###)

### Missing Metadata
**Cause**: YAML frontmatter not properly formatted  
**Solution**: Check YAML syntax (must start/end with `---`)

### Incorrect Nesting
**Cause**: Skipped heading levels (e.g., H1 → H3)  
**Solution**: Use consecutive heading levels for proper hierarchy

---

**Last Updated**: 2026-02-13  
**Script**: `scripts/pkb-index`
