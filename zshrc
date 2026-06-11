# zoxide
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="minimal"
zstyle ':omz:update' mode disabled

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  sudo
)

# Minimal Theme
MNML_PROMPT=(mnml_ssh mnml_status mnml_keymap)
MNML_RPROMPT=('mnml_cwd 2 0' mnml_git)
MNML_MAGICENTER=()
MNML_INFOLN=()
MNML_OK_COLOR=81

# Syntax highlighting colors
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[builtin]='fg=81,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=81,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=81,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=196,bold'

source $ZSH/oh-my-zsh.sh

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:(ssh|scp):*' hosts on
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=250"
bindkey '\t' autosuggest-accept

# Zoxide (smarter cd)
eval "$(zoxide init zsh --cmd cd)"

# Eza (better ls)
alias ls='eza --icons --git'

# Aliases
alias py='python3'
alias up="cd .."
alias c="clear"
alias grep='grep -i -P'
alias rm="rm -i"
