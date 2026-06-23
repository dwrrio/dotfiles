# =============================================================================
# aliases.zsh — macOS-flavoured aliases on Linux
# =============================================================================

# ── ls / exa ─────────────────────────────────────────────────────────────────
alias ls='exa --color=always --group-directories-first --icons'
alias ll='exa -lah --color=always --group-directories-first --icons --git'
alias la='exa -a --color=always --group-directories-first --icons'
alias lt='exa --tree --color=always --icons --level=2'
alias l='exa --color=always --icons'

# ── cat → bat ─────────────────────────────────────────────────────────────────
alias cat='bat --style=auto'
alias catp='bat --paging=always'

# ── find → fd ─────────────────────────────────────────────────────────────────
alias find='fd'

# ── grep → ripgrep ────────────────────────────────────────────────────────────
alias grep='rg'

# ── macOS habits ─────────────────────────────────────────────────────────────
alias open='xdg-open'          # macOS open
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias md='mkdir -p'
alias rd='rmdir'
alias which='command -v'
alias o='xdg-open'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias c='clear'
alias q='exit'
alias h='history'
alias x='exit'

# ── macOS-style clipboard ─────────────────────────────────────────────────────
alias clip='xclip -selection clipboard'

# ── System shortcuts ──────────────────────────────────────────────────────────
alias please='sudo'            # 😄
alias update='sudo apt-get update && sudo apt-get upgrade -y'
alias install='sudo apt-get install'
alias remove='sudo apt-get remove'
alias purge='sudo apt-get purge'
alias cleanup='sudo apt-get autoremove && sudo apt-get autoclean'

# ── Dotfiles ──────────────────────────────────────────────────────────────────
alias dotfiles='cd ~/dotfiles'
alias reload='exec zsh'
alias zshrc='$EDITOR ~/.zshrc'
alias aliases='$EDITOR ~/.config/zsh/aliases.zsh'

# ── Network ───────────────────────────────────────────────────────────────────
alias ip='ip -color'
alias myip='curl -s https://ipinfo.io/ip'
alias ping='ping -c 5'

# ── Git (like macOS devs use) ─────────────────────────────────────────────────
alias g='git'
alias gs='git status -sb'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gco='git checkout'
alias gb='git branch'
alias gp='git push'
alias gpl='git pull'
alias gl='git log --oneline --graph --decorate --all'
alias gd='git diff'
alias gds='git diff --staged'
alias gcl='git clone'

# ── tmux ──────────────────────────────────────────────────────────────────────
alias ta='tmux attach -t'
alias tn='tmux new -s'
alias tl='tmux ls'
alias tk='tmux kill-session -t'
