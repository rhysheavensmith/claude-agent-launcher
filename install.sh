#!/bin/bash

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}Claude Agent Team Launcher - Installation${NC}"
echo ""

# Detect shell
if [ -n "$ZSH_VERSION" ]; then
    SHELL_CONFIG="$HOME/.zshrc"
    SHELL_NAME="zsh"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_CONFIG="$HOME/.bashrc"
    SHELL_NAME="bash"
else
    echo -e "${RED}Unsupported shell. Please use zsh or bash.${NC}"
    exit 1
fi

echo -e "Detected shell: ${GREEN}$SHELL_NAME${NC}"
echo -e "Config file: ${GREEN}$SHELL_CONFIG${NC}"
echo ""

# Check for tmux
if ! command -v tmux &> /dev/null; then
    echo -e "${RED}tmux is not installed.${NC}"
    echo ""
    echo "Install it with:"
    echo "  macOS:    brew install tmux"
    echo "  Ubuntu:   sudo apt install tmux"
    echo "  Fedora:   sudo dnf install tmux"
    exit 1
fi

echo -e "${GREEN}✓${NC} tmux found: $(tmux -V)"

# Check for Claude Code
if ! command -v claude &> /dev/null; then
    echo -e "${YELLOW}⚠${NC} Claude Code CLI not found"
    echo "Install from: https://code.claude.com/"
    echo ""
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
else
    echo -e "${GREEN}✓${NC} Claude Code found"
fi

echo ""
echo -e "${YELLOW}Installing to $SHELL_CONFIG...${NC}"

# Check if already installed
if grep -q "# Claude Agent Teams" "$SHELL_CONFIG" 2>/dev/null; then
    echo -e "${YELLOW}Already installed. Updating...${NC}"
    # Remove old version (create backup)
    sed -i.bak '/# Claude Agent Teams/,/alias ct-list/d' "$SHELL_CONFIG"
fi

# Download and append
curl -fsSL https://raw.githubusercontent.com/YOUR-USERNAME/claude-agent-launcher/main/claude-team.sh >> "$SHELL_CONFIG"

echo ""
echo -e "${GREEN}✓ Installation complete!${NC}"
echo ""
echo "Reload your shell with:"
echo -e "  ${GREEN}source $SHELL_CONFIG${NC}"
echo ""
echo "Then try:"
echo -e "  ${GREEN}ct${NC}              # Launch agent team"
echo -e "  ${GREEN}ct-list${NC}         # List sessions"
echo -e "  ${GREEN}ct-kill [name]${NC}  # Kill session"
echo ""
echo -e "⭐ Star the repo: ${GREEN}https://github.com/YOUR-USERNAME/claude-agent-launcher${NC}"
