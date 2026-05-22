#!/bin/bash

# Exit on error
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PKGS_FILE="$DOTFILES_DIR/packages.txt"

echo "--- Starting Rice Installation ---"

# 1. Check for AUR helper (paru)
if ! command -v paru &> /dev/null; then
    echo "Error: 'paru' not found. Please install an AUR helper first."
    exit 1
fi

# 2. Install Packages
echo "Step 1: Installing packages from $PKGS_FILE..."
if [ -f "$PKGS_FILE" ]; then
    # Remove comments and empty lines from packages.txt
    PKGS=$(grep -v '^#' "$PKGS_FILE" | grep -v '^$')
    paru -S --needed --noconfirm $PKGS
else
    echo "Error: packages.txt not found"
    exit 1
fi

# 3. Copy Dotfiles
echo "Step 2: Restoring configuration files to $HOME..."

# Restore .config
echo "Restoring .config..."
mkdir -p "$HOME/.config"
cp -rf "$DOTFILES_DIR/config/"* "$HOME/.config/"

# Restore shell dotfiles
echo "Restoring shell dotfiles..."
cp -rf "$DOTFILES_DIR/shell/".* "$HOME/" 2>/dev/null || true

# Restore local scripts
echo "Restoring local scripts..."
mkdir -p "$HOME/.local"
# Ensure we copy the actual bin folder content
if [ -d "$DOTFILES_DIR/scripts/local/bin" ]; then
    cp -rf "$DOTFILES_DIR/scripts/local/bin" "$HOME/.local/"
fi

# 4. Final Setup
echo "Step 3: Finalizing setup..."
chmod +x "$HOME/.local/bin/"* 2>/dev/null || true

echo "--- Installation Complete! ---"
echo "Note: You may need to log out and back in for some changes to take effect."
