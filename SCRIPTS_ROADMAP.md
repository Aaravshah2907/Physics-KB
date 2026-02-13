# 🚀 Physics KB Scripts Roadmap

This document summarizes the completed features and tracks the implementation of advanced computational physics capabilities.

## ✅ Completed Core Features

### 🏗️ Generation & Structure
- **Multi-Phase "Skeleton Builder"**: `pkb-gen` now generates outline first, then writes each section individually to bypass token limits and maximize detail.
- **Centralized UI Library**: `pkb-common.sh` with Master/Task progress bars and localized image management.
- **Recursive & Atomic Optimization**:
    - **Atomic Splitting**: Hard limit of 20 subheadings; mechanical pre-split for >35 headings.
    - **Pedagogical Rebuilding**: Logical Development Scoring (Fundamentals → Technical → Specialized).
    - **Renaming & Global Link Correction**: Automatic file renaming with global bidirectional link updates.

### 🎨 Media & References
- **Media Localization**: Automatic "Suck-In" system for Wikipedia diagrams (downloads to `/assets/images`).
- **Scholarly Reference Engine**: AI tool-access to source real, clickable DOI and arXiv links for major results.

### 🔍 Discovery & Intelligence
- **RAG-based Search**: `pkb-search` 2.0 with local context retrieval and AI-summaries.
- **Semantic Bridge**: `pkb-bridge` for discovering hidden connections between conceptually related notes.
- **Contextual TODO**: `pkb-todo` tracks source-context for missing topics.

### 🧠 Hybrid LLM Backend
- **Multi-Model Orchestration**: Priority-based fallback: `Gemini Pro` → `Gemini 1.5 Flash` → `Ollama (DeepSeek-r1:7b)`.
- **Local-First Metadata**: `call_llm_light` routes non-creative tasks (titles, checks) to local Ollama by default to save tokens.
- **Context Optimizer**: Uses structured JSON index data to provide the AI with a "Project Consciousness" without scanning the entire note library.
- **Think-Tag Filtration**: Dedicated Python logic (`pkb_llm_filter.py`) to prune reasoning-model thought blocks from final notes.

### 🔎 Search & Indexing (Shell Optimized)
- **Topic Index**: `pkb-index` generates comprehensive hierarchical index (JSON & Markdown). Python logic externalized to `pkb_hierarchy.py`.
- **Query Tool**: `pkb-query` provides CLI access to index stats, tags, and complexity filters.
- **Smart Search**: `pkb-search` uses the index for hierarchical browsing and RAG-based search with `bat` integration.
- **Smart Rebuild**: `pkb-rebuild` uses index data to intelligently split large files (>15 topics). Logic externalized to `pkb_split_planner.py` and `pkb_split_executor.py`.

### 🧪 Interactive Simulations
- **Physics Labs**: Optional `--with-code` flag for generating Python/C++/MATLAB simulation scripts.
- **Auto-Extraction**: Simulations are extracted to `/simulations` folder and linked in notes.

### 🛠️ Maintenance & Health
- **Git Snapshots**: Automatic version control for all structural changes (generate, rebuild, refine).
- **KB Dashboard**: `pkb-stats` for complexity distribution, power-node tracking, stale notes (>90 days), and orphaned notes.
- **Quality Audit**: `pkb-audit` for LaTeX syntax, dead image links, and orphaned assets.
- **Topic Index**: `pkb-index` generates comprehensive hierarchical index of all topics across the KB in JSON and Markdown formats with statistics.

### 🛡️ Scientific Rigor & Infrastructure
- **Prompt Versioning (`/prompts`)**: All AI instructions are externalized for version control and precise tuning.
- **Technical Audit**: `pkb-verify` uses local LLMs to perform dimensional analysis and check for physical contradictions.
- **Deep-Link Injection**: `pkb-link-fixer` provides automatic "Obsidian-style" backlink discovery across the entire library.
- **Export Engine**: `pkb-export` converts note collections into publication-ready LaTeX or PDF via Pandoc.

## 🎯 System Architecture Highlights

### Token Efficiency
- **Skeleton Builder**: Generates outline first, then sections individually
- **Optional Simulations**: `--with-code` flag saves memory and time when code isn't needed
- **Mechanical Pre-Split**: Files >35 headings are split before AI processing to avoid rate limits

### Self-Healing
- **Recursive Rebuilds**: Modified files trigger cascading optimization
- **Global Link Updates**: File renames automatically update all backlinks
- **Orphan Detection**: Identifies disconnected knowledge islands

### Quality Assurance
- **Logical Development Scoring**: Ensures pedagogical flow (100→1)
- **Reference Verification**: Real DOI/arXiv links from search tools
- **Syntax Auditing**: Automated LaTeX and asset integrity checks

### ⚙️ System Configuration & Health
- **Centralized Config**: `config.env` for managing models, thresholds, and UI settings.
- **Pre-Flight Health Check**: `check_system_health` function in `pkb-common.sh` verifies dependencies and LLM status.

### 🧪 Interactive Simulations (Enhanced)
- **Simulation Lab**: `pkb-lab` for interactive browsing and execution of physics simulations with compilation support.

### 🗺️ Concept Mapping
- **Visual Knowledge Graph**: `pkb-index` now automatically generates `KNOWLEDGE_GRAPH.md` with Mermaid.js relationship maps.

## 📋 Future Enhancements (Optional)

### Potential Additions
- [ ] **Intelligence-Aware Refinement**: Update `pkb-refine` to cross-reference simulation code with note text for technical consistency.
- [ ] **Spaced Repetition**: Integration with Anki for active recall
- [ ] **Citation Network**: Visualize paper citation relationships
- [ ] **Multi-Language**: Support for notes in multiple languages

---

**Status**: Production-ready research-grade knowledge management system ✨
