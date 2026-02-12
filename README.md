# ⚛️ Physics Knowledge Base (PKB) Automation 

**An AI-driven, research-grade knowledge management system for Physics.**

This project transforms a folder of Markdown notes into a living, rigorous, and self-improving **Computational Physics Engine**. It goes beyond simple "note-taking" by using AI to structure, link, simulate, and cite complex physical phenomena automatically.

---

## 🚀 Key Capabilities

### 1. **Research-Grade Note Generation** (`pkb-gen`)
- **Skeleton Builder Architecture**: Generates massive, textbook-quality notes by first designing an outline and then writing each section individually to maximize detail and accuracy.
- **Pedagogical Structure**: Uses a **Logical Development Score** (1-100) to ensure notes flow from *Fundamentals & Intuition* → *Mathematical Formalism* → *Applications*.
- **Conflict Awareness**: Checks for existing notes before generation to prevent redundancy.

### 2. **Recursive Structural Optimization** (`pkb-rebuild`)
- **Atomic Splitting**: Automatically detects when a note is too large (>20 headings) or too complex (>35 headings) and splits it into focused "Atomic Files".
- **Recursive Logic**: If a split occurs, the system recursively optimizes the new child notes to ensure they are also perfectly structured.
- **Dynamic Renaming**: If the AI discovers a better title for a concept, it renames the file and **automatically updates every backlink** in your entire library.

### 3. **Interactive Physics Simulations** (`pkb-labs`)
- **Executable Code**: The AI automatically generates Python (NumPy/Matplotlib), C++, or MATLAB scripts for dynamic systems (e.g., *Double Pendulum*, *Wave Functions*).
- **Auto-Extraction**: These scripts are extracted into a dedicated `/simulations` folder but remain linked in your notes, ready to run.

### 4. **Self-Healing Connectivity**
- **Semantic Bridge** (`pkb-bridge`): AI analyzes your library to find "Hidden Threads"—concepts that are theoretically related but not yet linked—and suggests high-value connections.
- **Contextual TODOs** (`pkb-todo`): Tracks missing topics and remembers *where* they were mentioned, giving the AI context when you finally generate them.
- **Global Refactoring**: `pkb-common` handles safe renaming, ensuring no broken links ever exist.

### 5. **Scholarly & Media Richness**
- **Reference Engine**: automatically sources real **DOI** and **arXiv** links for key theorems and experiments.
- **Media Localization**: If a local diagram is missing, the system finds high-quality diagrams on Wikipedia, **downloads them locally** to your `/assets` folder, and embeds them to prevent "link rot."

### 6. **Automated Maintenance**
- **Git Snapshots**: Every major action (generate, rebuild, refine) triggers an automatic logic-aware Git commit, acting as a "Time Machine" for your knowledge.
- **Health Dashboard** (`pkb-stats`): Tracks "Stale Notes" (untouched >90 days) and "Knowledge Islands" (orphaned notes).
- **Quality Audit** (`pkb-audit`): Scans for LaTeX syntax errors and broken image references.

---

## 🛠️ Usage Guide

| Task | Command | Description |
| :--- | :--- | :--- |
| **New Note** | `./scripts/pkb-gen "Topic"` | Generates a deep-dive note from scratch. |
| **Refactor** | `./scripts/pkb-rebuild "File"` | Completely restructures an existing note. |
| **Edit** | `./scripts/pkb-refine "File" "Instr"` | Surgically updates a note with specific instructions. |
| **Search** | `./scripts/pkb-search "Query"` | RAG-based semantic search with AI summaries. |
| **Connect** | `./scripts/pkb-bridge` | Finds and builds missing semantic links. |
| **Fix** | `./scripts/pkb-refresh` | Prunes empty notes and syncs all backlinks. |
| **Audit** | `./scripts/pkb-audit` | Checks for broken syntax/links. |
| **Stats** | `./scripts/pkb-stats` | View library health and metrics. |

---

*Built for the dedicated physicist who values rigour, structure, and computational depth.*
