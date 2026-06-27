HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt APPEND_HISTORY

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

bindkey -e
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST

PROMPT='%F{green}%n@%m%f %F{blue}%1~%f %# '

alias ls='ls --color=auto'
alias ll='ls -lAh --color=auto'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias c='clear'
alias h='history'
alias which='type -a'

if ! command -v open &>/dev/null; then
  alias open='xdg-open'
fi

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
setopt AUTO_CD
setopt CORRECT
setopt CORRECT_ALL

setopt NO_BEEP
setopt INTERACTIVE_COMMENTS
export EDITOR='nano'
export LANG=en_US.UTF-8


source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
