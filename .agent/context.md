# Physics-KB: Project Context for Antigravity

This file provides a high-level overview of the Physics Knowledge Base automation system for quick lookup and onboarding.

## 🛠️ System Architecture

### 1. Hybrid LLM Backend
- **Function**: `call_gemini` (in `scripts/pkb-common.sh`)
- **Strategy**: Multi-model fallback (Gemini Pro → Gemini 1.5 Flash → Ollama).
- **Token Efficiency**: 
    - Use `call_llm_light` for metadata, titles, and redundancy checks (defaults to Ollama).
    - Use `call_gemini` for high-quality note content generation.
- **Filtering**: `scripts/pkb_llm_filter.py` strips `<think>` blocks from DeepSeek (Ollama) outputs.

### 2. Context Optimization
- **Function**: `get_project_context` (in `scripts/pkb-common.sh`)
- **Mechanism**: Reads `topic_index.json` to provide the AI with a summary of the entire KB structure (Titles, Tags, Locations) without needing to scan the filesystem.
- **Dependency**: Run `pkb-index` to keep this context fresh.

### 3. Core Physics Standards (`GEMINI.md`)
- **Formatting**: LaTeX for math, Obsidian backlinks (no backticks), YAML frontmatter (no backticks).
- **Organization**: Hierarchical headings, **Logical Development Score (100-1)**.
- **Atomic Splitting**: 20 subheadings limit. Use `pkb-rebuild` for automatic splitting.

## 📂 Key Directories
- `/notes`: Production markdown notes.
- `/scripts`: Automation toolkit (Bash/Python).
- `/assets/images`: Localized diagrams from Wikipedia.
- `/simulations`: Extracted Python/C++/MATLAB code.
- `topic_index.json`: The "Brain" of the project; used for search, query, and context mapping.

## 📜 Script Reference
| Script | Primary Purpose |
| :--- | :--- |
| `pkb-gen` | Iterative deep-dive note generation (Outline -> Sections). |
| `pkb-rebuild` | Intelligent refactoring and atomic splitting. |
| `pkb-index` | Re-generates the JSON/Markdown topic hierarchy. |
| `pkb-bridge` | Semantic analysis to find missing conceptual links. |
| `pkb-search` | Hierarchical and RAG-based search with `bat` preview. |
| `pkb-todo` | Scans for missing `[[topics]]` and tracks source context. |
| `pkb-query` | CLI interface for complexity, tags, and stats. |
| `pkb-audit` | Quality control for LaTeX, links, and assets. |

## 🧠 Strategic Reminders
- **Be Proactive**: If a search fails, run `pkb-index` to refresh the registry.
- **Think Locally**: For simple logic or formatting fixes, prefer Ollama.
- **Integrate, Don't Append**: When refining, merge content into the most logical section based on the development score.
