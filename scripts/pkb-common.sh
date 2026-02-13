#!/bin/bash
# pkb-common.sh: Shared functionality for Physics Knowledge Base scripts.

export NODE_NO_WARNINGS=1

# --- Global Paths ---
PKB_SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJ_ROOT="$(cd "$PKB_SCRIPTS_DIR/.." && pwd)"
NOTES_DIR="$PROJ_ROOT/notes"
GEMINI_CONF="$PROJ_ROOT/GEMINI.md"
TODO_FILE="$PROJ_ROOT/additional_topics.txt"
ASSETS_IMG_DIR="$PROJ_ROOT/assets/images"
SIMULATIONS_DIR="$PROJ_ROOT/simulations"

# --- Versioning ---
git_snapshot() {
    local message="$1"
    if [ -d "$PROJ_ROOT/.git" ]; then
        (cd "$PROJ_ROOT" && git add . && git commit -m "$message" >/dev/null 2>&1)
        printf "\r\033[K      📸 Git snapshot: $message\n" >&2
    fi
}

# --- UI Helpers ---

# Master Progress (Sticky colored header)
draw_master_progress() {
    local current=$1
    local total=$2
    local label=$3
    printf "\n\033[1;36m┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\033[0m\n" >&2
    printf "\033[1;36m┃ 🚀 BATCH PROGRESS: [%d/%d] %-35s ┃\033[0m\n" "$current" "$total" "$label" >&2
    printf "\033[1;36m┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛\033[0m\n" >&2
}

# Sub-Task Progress (Clears after use, indented)
draw_task_progress() {
    local current=$1
    local total=$2
    local label=$3
    local completed=$(( 20 * current / total ))
    local remaining=$(( 20 - completed ))
    
    printf "\r\033[K   \033[1;34m└─ %-25s\033[0m [" "$label" >&2
    printf "\033[32m%${completed}s\033[0m" | tr ' ' '━' >&2
    printf "%${remaining}s" | tr ' ' ' ' >&2
    printf "] Step %d/%d" "$current" "$total" >&2
}

# Spinner for long running tasks
show_spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    while [ "$(ps -p $pid -o state= 2>/dev/null)" ]; do
        local temp=${spinstr#?}
        printf " \033[1;33m[%c]\033[0m " "$spinstr" >&2
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b" >&2
    done
    printf "     \b\b\b\b\b" >&2
}

# --- Helper: Call Gemini with fallback and spinner ---
# --- Helper: Call Gemini with robust retry and fallback ---
call_gemini() {
    export NODE_NO_WARNINGS=1
    local PROMPT_TEXT="$1"
    local FULL_PROMPT
    FULL_PROMPT=$(printf "You are helpful assistant. If a requested image is not in the provided local context, you may use your search tools to find high-quality, direct image URLs ONLY from Wikipedia (upload.wikimedia.org). Ensure the URLs are direct links to the image files (png, svg, jpg).\n\n%s" "$PROMPT_TEXT")
    
    local ERR_FILE=$(mktemp)
    local OUT_FILE=$(mktemp)
    
    local MODELS=("default" "gemini-1.5-flash")
    local MAX_RETRIES=3
    
    for MODEL in "${MODELS[@]}"; do
        local CMD="gemini"
        if [ "$MODEL" != "default" ]; then
            CMD="gemini -m $MODEL"
        fi
        
        local RETRY_DELAY=10
        local ATTEMPT=1
        
        while [ $ATTEMPT -le $MAX_RETRIES ]; do
            # Execute command with prompt
            $CMD "$FULL_PROMPT" > "$OUT_FILE" 2> "$ERR_FILE" &
            local PID=$!
            
            # Show spinner while waiting
            local spinstr='|/-\'
            while kill -0 $PID 2>/dev/null; do
                local temp=${spinstr#?}
                printf " \033[1;33m[%c]\033[0m " "$spinstr" >&2
                local spinstr=$temp${spinstr%"$temp"}
                sleep 0.1
                printf "\b\b\b\b\b" >&2
            done
            printf "     \b\b\b\b\b" >&2
            
            wait $PID
            local STATUS=$?
            
            # Check success
            if [ $STATUS -eq 0 ]; then
                cat "$OUT_FILE"
                rm -f "$ERR_FILE" "$OUT_FILE"
                return 0
            fi
            
            # Check for Rate Limit to decide on retry
            if grep -qiE "429|Too Many Requests|Quota exceeded" "$ERR_FILE"; then
                if [ $ATTEMPT -lt $MAX_RETRIES ]; then
                    printf "\r\033[K   ⚠️  Rate limit hit ($MODEL). Retrying in ${RETRY_DELAY}s (Attempt $ATTEMPT/$MAX_RETRIES)...\n" >&2
                    sleep $RETRY_DELAY
                    RETRY_DELAY=$((RETRY_DELAY * 2)) # Exponential backoff
                    ATTEMPT=$((ATTEMPT + 1))
                else
                    printf "\r\033[K   ❌ Rate limit persists for $MODEL.\n" >&2
                    break # Break retry loop to try next model
                fi
            else
                # Non-retriable error
                cat "$ERR_FILE" >&2
                rm -f "$ERR_FILE" "$OUT_FILE"
                return $STATUS
            fi
        done
        
        # If we are here, we failed retries for this model. Try fallback if available.
        if [ "$MODEL" == "default" ]; then
             printf "\r\033[K   🔄 Switching to fallback model: gemini-1.5-flash...\n" >&2
        fi
    done
    
    # All models failed
    echo "❌ All attempts failed." >&2
    rm -f "$ERR_FILE" "$OUT_FILE"
    return 1
}

# --- Data Helpers ---

get_existing_notes_list() {
    find "$NOTES_DIR" -maxdepth 1 -name "*.md" -exec basename {} \; | sed 's/\.md$//' | tr '\n' ',' | sed 's/,$//'
}

get_available_images() {
    [ -d "$ASSETS_IMG_DIR" ] && find "$ASSETS_IMG_DIR" -maxdepth 1 -type f -exec basename {} \; | tr '\n' ',' | sed 's/,$//' || echo ""
}

extract_links_filtered() {
    local FILE="$1"
    [ ! -f "$FILE" ] && return
    sed -E '/^#+[[:space:]]*(References|Further Reading)/,$d' "$FILE" | grep -oE "\[\[[^]]+\]\]" | sed -E 's/\[\[([^]|]+)(\|[^]|]+)?\]\]/\1/' | sort -u
}

sync_backlinks() {
    local SOURCE_FILE="$1"
    [ ! -f "$SOURCE_FILE" ] && return
    local SOURCE_TITLE=$(grep "^title:" "$SOURCE_FILE" | head -1 | sed "s/title: //;s/\"//g;s/'//g")
    [ -z "$SOURCE_TITLE" ] && SOURCE_TITLE=$(basename "$SOURCE_FILE" .md)

    local TOUCHED=""
    local LINKS=$(extract_links_filtered "$SOURCE_FILE")
    while read -r LINK; do
        [ -z "$LINK" ] && continue
        local FILE_PART=$(echo "$LINK" | cut -d'#' -f1)
        local TARGET_FILE_NAME=$(echo "$FILE_PART" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9 ]//g' | tr -s ' ' '-' | sed 's/^-//;s/-$//')
        local TARGET_PATH="$NOTES_DIR/$TARGET_FILE_NAME.md"

        if [ -f "$TARGET_PATH" ] && [ "$TARGET_PATH" != "$SOURCE_FILE" ]; then
            if ! grep -q "\[\[$SOURCE_TITLE\]\]" "$TARGET_PATH"; then
                printf "\r\033[K      🔗 Backlinking [[$SOURCE_TITLE]] in $(basename "$TARGET_PATH")\n" >&2
                [ ! -z "$(tail -c 1 "$TARGET_PATH")" ] && echo >> "$TARGET_PATH"
                echo -e "\n### Related Notes\n- [[$SOURCE_TITLE]]" >> "$TARGET_PATH"
                TOUCHED+="$TARGET_PATH "
            fi
        fi
    done <<< "$LINKS"
    echo "$TOUCHED"
}

# --- File & Content Systems ---

sanitize_filename() {
    local input="$1"
    echo "$input" | tr '[:upper:]' '[:lower:]' | sed 's/\.md$//' | sed 's/[^a-z0-9 ]/ /g' | tr '_ ' '-' | tr -s '-' | sed 's/^-//;s/-$//'
}

# --- Media Systems ---

download_external_images() {
    local FILE="$1"
    [ ! -f "$FILE" ] && return
    
    # Match Markdown image tags with Wikipedia URLs
    # Format: ![label](https://upload.wikimedia.org/...)
    local REGEX='!\[[^]]*\]\((https:\/\/upload\.wikimedia\.org\/[^)]+)\)'
    
    local CONTENT=$(cat "$FILE")
    local URLS=$(echo "$CONTENT" | grep -oE "https:\/\/upload\.wikimedia\.org\/[^)]+")
    
    while read -r URL; do
        [ -z "$URL" ] && continue
        
        # Extract filename from URL and sanitize
        local EXT="${URL##*.}"
        local RAW_NAME=$(basename "$URL" ".$EXT")
        local CLEAN_NAME=$(sanitize_filename "$RAW_NAME")
        local FILENAME="${CLEAN_NAME}.${EXT}"
        local TARGET_PATH="$ASSETS_IMG_DIR/$FILENAME"
        
        # Download if not exists
        if [ ! -f "$TARGET_PATH" ]; then
            printf "\r\033[K      📥 Downloading: $FILENAME..." >&2
            mkdir -p "$ASSETS_IMG_DIR"
            curl -s -L "$URL" -o "$TARGET_PATH"
        fi
        
        # Replace in file (Note: using sed with URL characters requires careful escaping or alternate delimiter)
        # We use Obsidian format ![[filename.ext]]
        sed -i '' "s|!\[[^]]*\]($URL)|![[$FILENAME]]|g" "$FILE"
        printf "\r\033[K      🖼️  Localized: [[$FILENAME]]\n" >&2
        
    done <<< "$URLS"
}

extract_simulations() {
    local FILE="$1"
    [ ! -f "$FILE" ] && return
    
    # Check for SIMULATION blocks
    if grep -q "\-\-\-SIMULATION:" "$FILE"; then
        printf "\r\033[K      🧪 Extracting simulations...\n" >&2
        mkdir -p "$SIMULATIONS_DIR"
        
        # Temporary file for the modified markdown content
        local TEMP_MD=$(mktemp)
        
        # Use awk to process the file: extract code to files and replace in markdown
        awk -v outdir="$SIMULATIONS_DIR" -v relative_dir="simulations" '
        BEGIN { in_block=0; print_line=1 }
        
        /^---SIMULATION:/ {
            # Start of a simulation block
            # Parse header: ---SIMULATION:lang:filename.ext---
            msg=$0
            gsub(/---/, "", msg)
            split(msg, parts, ":")
            lang = parts[2]
            fname = parts[3]
            
            current_file = outdir "/" fname
            relative_path = relative_dir "/" fname
            
            # Create/Empty the simulation file
            printf "" > current_file
            
            in_block=1
            print_line=0 # Stop printing to markdown
            
            # Print replacement link to markdown immediately
            print "\n> [!code] **Simulation Code**" 
            print "> The source code for this simulation is available in: `simulations/" fname "`"
            print "> ```" lang
            next
        }
        
        /^```/ {
             if (in_block) {
                 # End of simulation block
                 in_block=0
                 print_line=1
                 print "```" # Close the markdown code block
                 print "      💾 Saved simulation: " current_file > "/dev/stderr"
                 next
             }
        }
        
        {
            if (in_block) {
                # content of the simulation function
                print $0 >> current_file
                print $0 # Also print to markdown to keep the code visible
            } else {
                print $0
            }
        }
        ' "$FILE" > "$TEMP_MD"
        
        # Replace original file with processed content
        mv "$TEMP_MD" "$FILE"
    fi
}

check_heading_limit() {
    local file="$1"
    local limit=${2:-20}
    local count=$(grep -c "^##" "$file")
    if [ "$count" -gt "$limit" ]; then
        printf "\r\033[K   ⚠️  Large file detected ($count subheadings). Split recommended.\n" >&2
        return 1
    fi
    return 0
}

update_global_links() {
    local OLD_BASE="$1"
    local NEW_BASE="$2"
    [ "$OLD_BASE" == "$NEW_BASE" ] && return
    
    printf "\r\033[K      🔄 Updating global links: [[$OLD_BASE]] -> [[$NEW_BASE]]\n" >&2
    # Update both exact case and common variations
    find "$NOTES_DIR" -maxdepth 1 -name "*.md" -exec sed -i '' -E "s/\[\[$OLD_BASE(\|[^]]+)?\]\]/[[$NEW_BASE\1]]/gI" {} +
}

cleanup_todo() {
    local TOPIC="$1"
    if [ -f "$TODO_FILE" ]; then
        # Handle topics with context pipe
        sed -i '' "/^$TOPIC|/Id" "$TODO_FILE"
        # Also handle plain topics
        sed -i '' "/^$TOPIC$/Id" "$TODO_FILE"
    fi
}
