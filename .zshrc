# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(
	brew
	direnv
	eza
	fzf
	git
	pyenv
	zoxide
)
ZOXIDE_CMD_OVERRIDE=cd

# Manage Oh-My-Zsh plugins with Antigen
source $(brew --prefix)/share/antigen/antigen.zsh

# antigen use oh-my-zsh
antigen use ohmyzsh/ohmyzsh

# Specify plugins we want
# antigen bundle memark/zsh-dotnet-completion
antigen bundle Leizhenpeng/zsh-plugin-pnpm
# antigen bundle nvm
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# fzf
antigen bundle Aloxaf/fzf-tab
antigen bundle Freed-Wu/fzf-tab-source@main

# OMZ - just remind me to update when it's time
zstyle ':omz:update' mode reminder

# eza
zstyle ':omz:plugins:eza' 'dirs-first' yes
zstyle ':omz:plugins:eza' 'git-status' yes
zstyle ':omz:plugins:eza' 'header' yes
zstyle ':omz:plugins:eza' 'icons' yes

antigen apply

# init tools
eval "$(oh-my-posh init zsh --config $HOME/.ohmyposh/base.json)"
eval "$(fnm env --use-on-cd --shell zsh --version-file-strategy=recursive --corepack-enabled)"
eval "$(pyenv init --path)"

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias d=dotnet
alias db="dotnet build"
alias dw="dotnet watch"
alias dr="dotnet run"
alias dt="dotnet test"

alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias zshconfig="code ~/.zshrc"

# pnpm
export PNPM_HOME="/Users/matt/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
