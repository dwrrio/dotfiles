# dotfiles — macOS look & feel on Lubuntu

A complete dotfiles setup that transforms Lubuntu into a macOS-like experience:
clean terminal, refined prompt, frosted glass effects, macOS GTK theme, and
consistent keybindings.

---

## What's included

| Area | Tool | What it does |
|---|---|---|
| Shell | Zsh + Oh-My-Zsh | macOS-like shell experience |
| Prompt | Powerlevel10k | Instant, minimal prompt like iTerm2 |
| Terminal | Alacritty | GPU-rendered, semi-transparent like Terminal.app |
| Multiplexer | tmux | macOS-style tabs & panes |
| GTK Theme | WhiteSur | macOS Big Sur / Monterey look |
| Icons | WhiteSur | macOS icon set |
| Cursor | Apple Cursor | macOS pointer |
| Compositor | picom | Frosted glass, shadows, rounded corners |
| `ls` | exa | Color icons, macOS-style listing |
| `cat` | bat | Syntax-highlighted, like a mini editor |
| `find` | fd | Fast, sensible defaults |
| `grep` | ripgrep | Blazing fast |
| Fuzzy search | fzf + fzf-tab | Spotlight-like file/command search |
| File manager | lf | TUI Finder-like explorer |
| Fetch | neofetch | Apple logo + system info |
| Fonts | JetBrainsMono Nerd | SF Mono equivalent (free) |

---

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

## Updating

```bash
cd ~/dotfiles
git pull
./install.sh   # idempotent
```

---

## Structure

```
dotfiles/
├── bin/                    # helper executables
│   └── install-bat-theme
├── config/
│   ├── alacritty/
│   │   └── alacritty.toml
│   ├── lf/
│   │   └── lfrc
│   ├── neofetch/
│   │   └── config.conf
│   ├── gitconfig
│   ├── picom.conf
│   └── tmux.conf
├── fonts/                  # drop SF Pro .otf files here
│   └── SF_FONT_NOTE.md
├── scripts/
│   ├── alacritty_setup.sh
│   ├── finalize.sh
│   ├── fonts.sh
│   ├── neofetch_setup.sh
│   ├── packages.sh
│   ├── symlinks.sh
│   ├── theme.sh
│   ├── utils.sh
│   └── zsh.sh
├── shell/
│   ├── aliases.zsh
│   ├── exports.zsh
│   ├── functions.zsh
│   ├── p10k.zsh
│   ├── zshenv
│   └── zshrc
├── install.sh
└── README.md
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
