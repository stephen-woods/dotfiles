#!/bin/bash

# Script to set up oh-my-zsh with plugins for a dotfiles repository
# Save this as 'setup-zsh-plugins.sh' in your dotfiles repository

set -e # Exit on error

echo "Setting up oh-my-zsh and plugins..."

# Install oh-my-zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Create custom plugins directory if it doesn't exist
custom_plugins_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins"
mkdir -p "$custom_plugins_dir"

# Install zsh-autosuggestions
if [ ! -d "$custom_plugins_dir/zsh-autosuggestions" ]; then
  echo "Installing zsh-autosuggestions..."
  git clone git@github.com:zsh-users/zsh-autosuggestions.git "$custom_plugins_dir/zsh-autosuggestions"
else
  echo "zsh-autosuggestions already installed"
fi

# Install zsh-syntax-highlighting
if [ ! -d "$custom_plugins_dir/zsh-syntax-highlighting" ]; then
  echo "Installing zsh-syntax-highlighting..."
  git clone git@github.com:zsh-users/zsh-syntax-highlighting.git "$custom_plugins_dir/zsh-syntax-highlighting"
else
  echo "zsh-syntax-highlighting already installed"
fi

# Check for autojump and install it if not present
echo "Checking for autojump..."
if ! command -v autojump &>/dev/null; then
  echo "Installing autojump..."

  # Detect OS
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux - try to detect package manager
    if command -v apt-get &>/dev/null; then
      sudo apt-get update && sudo apt-get install -y autojump
    elif command -v dnf &>/dev/null; then
      sudo dnf install -y autojump
    elif command -v yum &>/dev/null; then
      sudo yum install -y autojump
    elif command -v pacman &>/dev/null; then
      sudo pacman -S --noconfirm autojump
    else
      echo "Could not detect package manager. Please install autojump manually."
    fi
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    if command -v brew &>/dev/null; then
      brew install autojump
    else
      echo "Homebrew not found. Please install Homebrew and then autojump."
      echo "You can install Homebrew with:"
      echo '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    fi
  else
    echo "Unsupported OS. Please install autojump manually."
  fi
else
  echo "autojump already installed"
fi

# Create or update .zshrc
echo "Updating your .zshrc file..."

# Backup existing .zshrc if it exists
if [ -f "$HOME/.zshrc" ]; then
  echo "Backing up existing .zshrc to .zshrc.backup"
  cp "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi

# Update the plugins in .zshrc using a more compatible approach
if [ -f "$HOME/.zshrc" ]; then
  # Check if plugins line exists
  if grep -q "^plugins=(" "$HOME/.zshrc"; then
    # Create a temporary file for our updated .zshrc
    temp_file=$(mktemp)

    # Process the file line by line
    while IFS= read -r line; do
      if [[ "$line" =~ ^plugins=\((.*)\) ]]; then
        # Extract current plugins
        current_plugins="${BASH_REMATCH[1]}"

        # Check if each plugin is already in the list, add if missing
        for plugin in "autojump" "zsh-autosuggestions" "zsh-syntax-highlighting"; do
          if [[ ! "$current_plugins" =~ (^|[[:space:]])$plugin([[:space:]]|$) ]]; then
            current_plugins="$current_plugins $plugin"
          fi
        done

        # Clean up extra spaces
        current_plugins=$(echo "$current_plugins" | tr -s ' ')

        # Write the updated plugins line
        echo "plugins=($current_plugins)" >>"$temp_file"
      else
        # Copy the line as is
        echo "$line" >>"$temp_file"
      fi
    done <"$HOME/.zshrc"

    # Replace the original file with our updated version
    mv "$temp_file" "$HOME/.zshrc"
  else
    # If no plugins line exists, add one
    echo 'plugins=(git autojump zsh-autosuggestions zsh-syntax-highlighting)' >>"$HOME/.zshrc"
  fi
else
  # Create a minimal .zshrc if none exists
  cat >"$HOME/.zshrc" <<'EOF'
# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Set theme
ZSH_THEME="robbyrussell"

# Enable plugins
plugins=(git autojump zsh-autosuggestions zsh-syntax-highlighting)

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# User configuration goes here
EOF
fi

# Additional autojump configuration if needed
# Some systems require manual sourcing of autojump
if ! grep -q "autojump.sh" "$HOME/.zshrc"; then
  echo "# Autojump configuration" >>"$HOME/.zshrc"

  # Different locations based on OS
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo '[ -f /usr/share/autojump/autojump.sh ] && source /usr/share/autojump/autojump.sh' >>"$HOME/.zshrc"
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo '[ -f $(brew --prefix)/etc/profile.d/autojump.sh ] && . $(brew --prefix)/etc/profile.d/autojump.sh' >>"$HOME/.zshrc"
  fi
fi

echo "Setup complete! Restart your terminal or run 'source ~/.zshrc' to apply changes."
