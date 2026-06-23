#!/usr/bin/env bash
source "$(dirname "$0")/utils.sh"

D="$DOTFILES_DIR"

# ── Shell ──────────────────────────────────────────────────────────────────────
link "$D/shell/zshrc"          "$HOME/.zshrc"
link "$D/shell/zshenv"         "$HOME/.zshenv"
link "$D/shell/aliases.zsh"    "$HOME/.config/zsh/aliases.zsh"
link "$D/shell/functions.zsh"  "$HOME/.config/zsh/functions.zsh"
link "$D/shell/exports.zsh"    "$HOME/.config/zsh/exports.zsh"

# ── Alacritty ─────────────────────────────────────────────────────────────────
link "$D/config/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"

# ── Tmux ──────────────────────────────────────────────────────────────────────
link "$D/config/tmux.conf"  "$HOME/.tmux.conf"

# ── Neofetch ──────────────────────────────────────────────────────────────────
link "$D/config/neofetch/config.conf" "$HOME/.config/neofetch/config.conf"

# ── LF file manager ───────────────────────────────────────────────────────────
link "$D/config/lf/lfrc" "$HOME/.config/lf/lfrc"

# ── Git ───────────────────────────────────────────────────────────────────────
link "$D/config/gitconfig" "$HOME/.gitconfig"
