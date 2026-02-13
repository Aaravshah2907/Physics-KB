#!/bin/bash
# setup-global-scripts.sh: Add Physics KB scripts to your PATH

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJ_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SCRIPTS_DIR="$PROJ_ROOT/scripts"

echo "Physics KB - Global Script Setup"
echo "================================="
echo ""

# Detect shell
SHELL_NAME=$(basename "$SHELL")
case "$SHELL_NAME" in
    bash)
        RC_FILE="$HOME/.bashrc"
        [ ! -f "$RC_FILE" ] && RC_FILE="$HOME/.bash_profile"
        ;;
    zsh)
        RC_FILE="$HOME/.zshrc"
        ;;
    *)
        echo "⚠️  Unknown shell: $SHELL_NAME"
        echo "   Please manually add to PATH: $SCRIPTS_DIR"
        exit 1
        ;;
esac

echo "Detected shell: $SHELL_NAME"
echo "Config file: $RC_FILE"
echo ""

# Check if already in PATH
if echo "$PATH" | grep -q "$SCRIPTS_DIR"; then
    echo "✓ Scripts directory already in PATH"
    exit 0
fi

# Check if already in RC file
if grep -q "Physics-KB/scripts" "$RC_FILE" 2>/dev/null; then
    echo "✓ PATH entry already exists in $RC_FILE"
    echo "  Run: source $RC_FILE"
    exit 0
fi

# Add to PATH
echo "Adding Physics KB scripts to PATH..."
echo "" >> "$RC_FILE"
echo "# Physics Knowledge Base Scripts" >> "$RC_FILE"
echo "export PATH=\"\$PATH:$SCRIPTS_DIR\"" >> "$RC_FILE"

echo "✓ Added to $RC_FILE"
echo ""
echo "To use the scripts globally, run:"
echo "  source $RC_FILE"
echo ""
echo "Or restart your terminal."
echo ""
echo "Available commands:"
echo "  pkb-index   - Generate topic index"
echo "  pkb-search  - Search and browse topics"
echo "  pkb-query   - Query index statistics"
echo "  pkb-gen     - Generate new notes"
echo "  pkb-refine  - Refine existing notes"
echo "  pkb-stats   - View KB statistics"
echo "  pkb-shot    - Create Git snapshot"
echo "  pkb-help    - Show usage examples"
echo ""
