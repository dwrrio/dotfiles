# =============================================================================
# functions.zsh — macOS-inspired helper functions
# =============================================================================

# ── mkcd: mkdir + cd in one ───────────────────────────────────────────────────
mkcd() { mkdir -p "$@" && cd "$_"; }

# ── extract: universal archive extractor (like macOS Archive Utility) ─────────
extract() {
    if [[ -f "$1" ]]; then
        case "$1" in
            *.tar.bz2)  tar xjf "$1"     ;;
            *.tar.gz)   tar xzf "$1"     ;;
            *.tar.xz)   tar xJf "$1"     ;;
            *.bz2)      bunzip2 "$1"     ;;
            *.rar)      unrar x "$1"     ;;
            *.gz)       gunzip "$1"      ;;
            *.tar)      tar xf "$1"      ;;
            *.tbz2)     tar xjf "$1"     ;;
            *.tgz)      tar xzf "$1"     ;;
            *.zip)      unzip "$1"       ;;
            *.Z)        uncompress "$1"  ;;
            *.7z)       7z x "$1"        ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# ── fcd: fuzzy cd (like Spotlight but for dirs) ───────────────────────────────
fcd() {
    local dir
    dir=$(fd --type d --hidden --exclude .git 2>/dev/null | fzf --preview 'exa --tree --level=1 --icons {}' --height=40%)
    [[ -n "$dir" ]] && cd "$dir"
}

# ── fopen: fuzzy open file ────────────────────────────────────────────────────
fopen() {
    local file
    file=$(fd --type f --hidden --exclude .git 2>/dev/null | fzf --preview 'bat --style=numbers --color=always {}' --height=60%)
    [[ -n "$file" ]] && xdg-open "$file"
}

# ── fkill: fuzzy kill process (like macOS Activity Monitor) ───────────────────
fkill() {
    local pid
    pid=$(ps aux | fzf --height=40% | awk '{print $2}')
    [[ -n "$pid" ]] && kill -9 "$pid" && echo "Killed PID $pid"
}

# ── trash: move to trash instead of rm (macOS behavior) ──────────────────────
trash() {
    local trash_dir="$HOME/.local/share/Trash/files"
    mkdir -p "$trash_dir"
    for f in "$@"; do
        mv "$f" "$trash_dir/"
    done
}

# ── spotlight: search file contents recursively ───────────────────────────────
spotlight() { rg --smart-case --hidden "$@"; }

# ── ip info ───────────────────────────────────────────────────────────────────
localip() { ip route get 1 | awk '{print $7; exit}'; }

# ── quick HTTP server (like macOS SimpleHTTPServer) ───────────────────────────
serve() {
    local port="${1:-8000}"
    echo "Serving at http://localhost:$port"
    python3 -m http.server "$port"
}

# ── weather (bonus) ───────────────────────────────────────────────────────────
weather() { curl -s "wttr.in/${1:-Hamburg}?format=3"; }

# ── show PATH entries one per line ────────────────────────────────────────────
path() { echo "$PATH" | tr ':' '\n' | nl; }
