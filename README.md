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

### 7. **Intelligent Indexing & Splitting**
- **Deep Topic Index** (`pkb-index`): Uses `pkb_hierarchy.py` to generate a comprehensive JSON/Markdown index of all topics and subtopics.
- **Smart Splitting** (`pkb-rebuild`): Uses `pkb_split_planner.py` to detect large files (>15 topics) and intelligently extracts sections into new notes.
- **CLI Query Tool** (`pkb-query`): Filter notes by complexity, tags, or search for topics directly from the terminal.

### 8. **Hybrid Backend & Context Optimizer**
- **LLM Orchestration**: Automatically failover between **Gemini 2.5 Pro** and **Gemini 2.5 Flash** if a rate limit is hit.
- **Token Economy**: Uses `call_llm_light` (Gemini Flash) for non-creation tasks (metadata, titles, redundancy checks) to preserve Pro quota.
- **Context-Aware Metadata**: Injects structured summaries of the entire KB into the AI's prompt via `get_project_context`, reducing the need for expensive file scanning.

---

## 🛠️ Usage Guide

**Tip:** Run `./scripts/setup-global-scripts.sh` to use these commands globally!

| Task | Command | Description |
| :--- | :--- | :--- |
| **New Note** | `pkb-gen "Topic"` | Generates a deep-dive note from scratch. |
| **Refactor** | `pkb-rebuild "File"` | Smartly restructures & splits large notes. |
| **Index** | `pkb-index` | Generates topic index & hierarchy. |
| **Search** | `pkb-search "Query"` | Interactive search with `bat` preview. |
| **Query** | `pkb-query [stats/find]` | Query index stats & filters. |
| **Connect** | `pkb-bridge` | Finds and builds missing semantic links. |
| **Fix** | `pkb-refresh` | Prunes empty notes and syncs backlinks. |
| **Audit** | `pkb-audit` | Checks for broken syntax/links. |
| **Media** | `pkb-shot` | Captures screenshot & copies Obsidian link. |
| **Stats** | `pkb-stats` | View library health and metrics. |
| **Help** | `pkb-help` | Show usage examples for all tools. |

---

*Built for the dedicated physicist who values rigour, structure, and computational depth.*
