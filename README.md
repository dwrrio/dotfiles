# dotfiles

## Install

```bash
# 1. Clone the repo
git clone https://github.com/YOURNAME/dotfiles.git ~/dotfiles

# 2. Run the installer
cd ~/dotfiles
chmod +x install.sh
./install.sh

# 3. Restart your session
exec zsh   # or log out and back in
```

> The installer is **idempotent** — safe to run again after updates.

---

## Step-by-step breakdown

```
install.sh
├── scripts/packages.sh       apt-get installs
├── scripts/fonts.sh          JetBrainsMono Nerd Font
├── scripts/symlinks.sh       links everything into ~/.config
├── scripts/zsh.sh            Oh-My-Zsh + Powerlevel10k + plugins
├── scripts/theme.sh          WhiteSur GTK + icon + cursor themes
├── scripts/alacritty_setup.sh  sets Alacritty as default terminal
├── scripts/neofetch_setup.sh   (no-op, handled by symlinks)
└── scripts/finalize.sh       picom autostart, permissions
```

---

## Optional: SF Pro / SF Mono (Apple fonts)

If you own a Mac or have legally obtained Apple's fonts:

1. Download from <https://developer.apple.com/fonts/>
2. Copy `.otf` files into `dotfiles/fonts/`
3. Re-run `./scripts/fonts.sh`
4. Update `alacritty.toml` font family to `"SF Mono"`
5. Update GTK settings font to `"SF Pro Display 11"`

---

## Optional: bat Catppuccin theme

```bash
~/dotfiles/bin/install-bat-theme
```

---

## Keybindings cheatsheet

| Shortcut | Action |
|---|---|
| `Ctrl+Shift+V` | Paste in Alacritty |
| `Ctrl+Shift+C` | Copy in Alacritty |
| `Ctrl+Shift+Enter` | New Alacritty window |
| `Ctrl+a \|` | Split tmux pane vertically |
| `Ctrl+a -` | Split tmux pane horizontally |
| `Ctrl+a h/j/k/l` | Move between tmux panes |
| `Ctrl+r` | fzf history search |
| `Ctrl+t` | fzf file search |
| `Alt+c` | fzf cd to directory |
| `fcd` | fuzzy cd (custom function) |
| `fopen` | fuzzy open file |
| `fkill` | fuzzy kill process |
