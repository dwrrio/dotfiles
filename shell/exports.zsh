# =============================================================================
# exports.zsh
# =============================================================================

# ── FZF: macOS-like pop-over feel ────────────────────────────────────────────
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="
  --height 40%
  --layout=reverse
  --border=rounded
  --prompt='❯ '
  --pointer='▶'
  --marker='✓'
  --color=fg:#cdd6f4,bg:#1e1e2e,hl:#89b4fa
  --color=fg+:#cdd6f4,bg+:#313244,hl+:#89b4fa
  --color=info:#cba6f7,prompt:#89dceb,pointer:#f38ba8
  --color=marker:#a6e3a1,spinner:#f5c2e7,header:#94e2d5
"

# ── bat ───────────────────────────────────────────────────────────────────────
export BAT_THEME="Catppuccin-mocha"

# ── ls colors ─────────────────────────────────────────────────────────────────
export LS_COLORS='di=34:ln=36:so=35:pi=33:ex=32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

# ── History (macOS Terminal-like: large, shared across sessions) ──────────────
export HISTSIZE=50000
export SAVEHIST=50000
export HISTFILE="$HOME/.zsh_history"
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt EXTENDED_HISTORY

# ── Less: macOS default options ───────────────────────────────────────────────
export LESS='-R --use-color -Dd+r$Du+b'

# ── GPG ───────────────────────────────────────────────────────────────────────
export GPG_TTY="$TTY"
