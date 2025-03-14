#!/bin/bash
# XDG-compatible tmux configuration setup script

set -e  # Exit on error

# Set default XDG paths if not already defined
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

echo "Setting up tmux configuration with XDG standard paths..."

# Create necessary directories
mkdir -p "${XDG_CONFIG_HOME}/tmux"
mkdir -p "${XDG_DATA_HOME}/tmux/plugins"

# Get the absolute path of the dotfiles directory
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Create symlink for tmux.conf from dotfiles to XDG config location
if [ -f "${DOTFILES_DIR}/tmux/tmux.conf" ]; then
  echo "Linking tmux.conf to XDG config location..."
  ln -sf "${DOTFILES_DIR}/tmux/tmux.conf" "${XDG_CONFIG_HOME}/tmux/tmux.conf"
else
  echo "Warning: tmux.conf not found in dotfiles/tmux/"
fi

# Set up Tmux Plugin Manager (TPM)
TPM_DIR="${XDG_DATA_HOME}/tmux/plugins/tpm"
if [ ! -d "$TPM_DIR" ]; then
  echo "Installing Tmux Plugin Manager..."
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
else
  echo "Tmux Plugin Manager already installed, updating..."
  (cd "$TPM_DIR" && git pull origin master)
fi

# Create a wrapper script to ensure tmux uses XDG paths
TMUX_WRAPPER="${XDG_CONFIG_HOME}/tmux/tmux-wrapper.sh"
cat > "$TMUX_WRAPPER" << 'EOF'
#!/bin/bash
# Wrapper script to start tmux with XDG base directory support

# Set XDG paths if not already defined
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# Start tmux with the config in the right location
exec tmux -f "${XDG_CONFIG_HOME}/tmux/tmux.conf" "$@"
EOF

chmod +x "$TMUX_WRAPPER"
echo "Created tmux wrapper script at ${TMUX_WRAPPER}"

# Install plugins automatically if TPM is installed
if [ -d "$TPM_DIR" ]; then
  echo "Installing tmux plugins..."
  ${TPM_DIR}/bin/install_plugins
  ${TPM_DIR}/bin/update_plugins all
fi

# Provide instructions for shell configuration
echo ""
echo "Setup complete! To use tmux with XDG paths, add the following to your .zshrc or .bashrc:"
echo ""
echo 'export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"'
echo 'export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"'
echo 'export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"'
echo 'alias tmux="$XDG_CONFIG_HOME/tmux/tmux-wrapper.sh"'
echo ""
echo "For convenience, you might want to add this to your dotfiles shell configuration."
