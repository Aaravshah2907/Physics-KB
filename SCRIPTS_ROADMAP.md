# 🚀 Physics KB Scripts Roadmap

This document summarizes the completed features and tracks the implementation of advanced computational physics capabilities.

## ✅ Completed Core Features
- **Centralized UI Library**: `pkb-common.sh` with Master/Task progress bars and localized image management.
- **Recursive & Atomic Optimization**:
    - **Atomic Splitting**: Hard limit of 20 subheadings; mechanical pre-split for >35 headings.
    - **Pedagogical Rebuilding**: Logical Development Scoring (Fundamentals -> Technical -> Specialized).
    - **Renaming & Global Link Correction**: Automatic file renaming with global bidirectional link updates.
- **Media Localization**: Automatic "Suck-In" system for Wikipedia diagrams (downloads to `/assets/images`).
- **Discovery Tools**:
    - **RAG-based Search**: `pkb-search` 2.0 with local context retrieval and AI-summaries.
    - **Contextual TODO**: `pkb-todo` tracks source-context for missing topics.
- **Maintenance & Health**:
    - **KB Dashboard**: `pkb-stats` for complexity distribution and power-node tracking.
    - **Quality Audit**: `pkb-audit` for LaTeX syntax, dead image links, and orphaned assets.

## ⏳ Future Implementation Queue

### 1. 🐍 Interactive Python "Physics Labs"
- [ ] Update `GEMINI.md` to require `python` (NumPy/Matplotlib) simulation blocks in complex notes.
- [ ] Ensure blocks are formatted for Obsidian's "Execute Code" plugin.

### 2. 📜 Scholarly Reference Engine
- [ ] Enable AI tool-access to source real, clickable DOI and arXiv links for major results.
- [ ] Implement a `References` section template that prioritizes verified peer-reviewed sources.

### 3. 📉 "Knowledge Decay" & Dashboard 2.0
- [ ] Add "Stale Factor" to `pkb-stats` (tracking notes not updated in X months).
- [ ] Identify "Knowledge Islands" (orphaned notes with zero inbound/outbound links).

### 🤖 Semantic "Bridge" Suggestions (`pkb-bridge`)
- [x] Created `pkb-bridge` for semantic link suggestions and suggest high-utility links between conceptually related notes that are currently disconnected.

### 🔄 Git Integration (`pkb-git`)
- [ ] Implement `git_snapshot` in `pkb-common.sh` to auto-commit structural changes (renames/splits) with descriptive logs.
