#zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  mvn
  sbt
  kubectl
  autojump
  direnv
  vi-mode
  fzf
  nvm
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# As suggested by tmux-setup-xdg.sh in dotfiles
# XDG Base Directory specification
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
alias tmux="$XDG_CONFIG_HOME/tmux/tmux-wrapper.sh"

# Optimize FZF
export FZF_DEFAULT_OPTS="--height 40% --border"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"

export VAULT_ADDR=https://or.vault.comcast.com
export AWS_PROFILE=saml


#cluster access aliases
alias na='open https://microsoft.com/devicelogin;aadawscli --profile-name na --account-id 196111890883 --role OneCloud/HIPUserAccess | tee >(grep "[A-Z0-9][A-Z0-9]\+" -o -m 1 | pbcopy)'
alias eu='open https://microsoft.com/devicelogin;aadawscli --profile-name eu --account-id 385469752808 --role ApplicationOwner | tee >(grep "[A-Z0-9][A-Z0-9]\+" -o -m 1 | pbcopy)'
alias ap='open https://microsoft.com/devicelogin;aadawscli --profile-name ap --account-id 018982855310 --role ApplicationOwner | tee >(grep "[A-Z0-9][A-Z0-9]\+" -o -m 1 | pbcopy)'
alias eu_stage='open https://microsoft.com/devicelogin;aadawscli --profile-name stage-eu --account-id 661752356268 --role ApplicationOwner | tee >(grep "[A-Z0-9][A-Z0-9]\+" -o -m 1 | pbcopy)' 

function pullify() {
  git config --add remote.upstream.fetch '+refs/pull/*/head:refs/remotes/upstream/pr/*'
  git config --add remote.origin.fetch '+refs/pull/*/head:refs/remotes/origin/pr/*'
}

export KUBECONFIG=~/.kube/cd-nonprod-ccp-as-rke2

export PATH="$HOME/.rustup/toolchains/$(rustup show active-toolchain | cut -d ' ' -f1)/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/bin:$PATH"

export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"

# export NVM_DIR="$HOME/.nvm"
 [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
 # [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Replace the standard NVM loading with this lazy-loading function
export NVM_DIR="$HOME/.nvm"

# Create placeholder nvm function
# nvm() {
#   # Remove the placeholder function
#   unfunction nvm
#
#   # Load the real NVM
#   [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
#
#   # Call the real nvm with the provided arguments
#   nvm "$@"
# }
#
# # Create placeholder functions for node, npm, etc.
# node() {
#   unfunction node
#   [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
#   node "$@"
# }
#
# npm() {
#   unfunction npm
#   [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
#   npm "$@"
# }
#
# npx() {
#   unfunction npx
#   [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
#   npx "$@"
# }


# Autojump configuration
[ -f $(brew --prefix)/etc/profile.d/autojump.sh ] && . $(brew --prefix)/etc/profile.d/autojump.sh
# zprof
