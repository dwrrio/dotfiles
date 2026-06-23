#!/usr/bin/env bash
source "$(dirname "$0")/utils.sh"

# ── Set Zsh as default shell ───────────────────────────────────────────────────
if [[ "$SHELL" != "$(command -v zsh)" ]]; then
    chsh -s "$(command -v zsh)"
    ok "Default shell set to Zsh"
else
    ok "Zsh is already the default shell"
fi

# ── Oh-My-Zsh ─────────────────────────────────────────────────────────────────
if [[ -d "$HOME/.oh-my-zsh" ]]; then
    ok "Oh-My-Zsh already installed"
else
    step "Installing Oh-My-Zsh..."
    RUNZSH=no CHSH=no \
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ok "Oh-My-Zsh installed"
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# ── Powerlevel10k theme ───────────────────────────────────────────────────────
P10K_DIR="$ZSH_CUSTOM/themes/powerlevel10k"
if [[ -d "$P10K_DIR" ]]; then
    ok "Powerlevel10k already installed"
else
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
    ok "Powerlevel10k installed"
fi

# ── Plugins ───────────────────────────────────────────────────────────────────
declare -A PLUGINS=(
    ["zsh-autosuggestions"]="https://github.com/zsh-users/zsh-autosuggestions"
    ["zsh-syntax-highlighting"]="https://github.com/zsh-users/zsh-syntax-highlighting"
    ["zsh-completions"]="https://github.com/zsh-users/zsh-completions"
    ["fzf-tab"]="https://github.com/Aloxaf/fzf-tab"
)

for name in "${!PLUGINS[@]}"; do
    dir="$ZSH_CUSTOM/plugins/$name"
    if [[ -d "$dir" ]]; then
        ok "Plugin $name already installed"
    else
        git clone --depth=1 "${PLUGINS[$name]}" "$dir"
        ok "Plugin $name installed"
    fi
done

# ── Symlink p10k config ───────────────────────────────────────────────────────
link "$DOTFILES_DIR/shell/p10k.zsh" "$HOME/.p10k.zsh"
