export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.cargo/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="duellj"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'
export VISUAL='nvim'

# ── Navigation ───────────────────────────────────────────────
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias -- -='cd -'

# ── Modern CLI Replacements ──────────────────────────────────
alias ls='eza --icons --group-directories-first'
alias ll='eza -la --icons --group-directories-first'
alias la='eza -a --icons --group-directories-first'
alias lt='eza --tree --icons --level=2'
alias lt3='eza --tree --icons --level=3'
alias cat='bat --style=plain'
alias catn='bat'
# zoxide handles cd directly via --cmd cd below
alias grep='rg'
alias find='fd'

# ── Editor ───────────────────────────────────────────────────
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias e='nvim .'

# ── Git ──────────────────────────────────────────────────────
alias lg='lazygit'
alias gs='git status -sb'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
alias gca='git commit --amend --no-edit'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gl='git log --oneline --graph --decorate -20'
alias gla='git log --oneline --graph --decorate --all -30'
alias gd='git diff'
alias gds='git diff --staged'
alias gco='git checkout'
alias gsw='git switch'
alias gb='git branch -a'
alias gst='git stash'
alias gstp='git stash pop'
alias grb='git rebase -i'
alias gpl='git pull --rebase'
alias gcl='git clone --depth=1'

# ── System ───────────────────────────────────────────────────
alias ff='fastfetch'
alias bt='btop'
alias fm='vifm .'
alias duf='df -h'
alias free='free -h'
alias psg='ps aux | rg'
alias ports='ss -tulnp'
alias myip='curl -s ifconfig.me'
alias wt='curl -s wttr.in/?format=3'

# ── Pacman / System Updates ──────────────────────────────────
alias pacman='sudo pacman'
alias update='sudo pacman -Syu'
alias upgrade='sudo pacman -Syu'
alias pac='sudo pacman -S'
alias pacu='sudo pacman -Syu'
alias pacr='sudo pacman -Rns'
alias pacq='pacman -Qs'
alias pacs='pacman -Ss'
alias pacf='pacman -F'
alias cleanup='sudo pacman -Rns $(pacman -Qdtq) 2>/dev/null; sudo pacman -Sc --noconfirm'
alias mirrors='sudo reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'

# ── Tmux ─────────────────────────────────────────────────────
alias ta='tmux attach -t'
alias tn='tmux new -s'
alias tl='tmux ls'
alias tk='tmux kill-session -t'

# ── Hyprland ─────────────────────────────────────────────────
alias hc='hyprctl'
alias hr='hyprctl reload'
alias hw='hyprctl clients'
alias hm='hyprctl monitors'

# ── Rust / Zig / Dev ─────────────────────────────────────────
alias cr='cargo run'
alias cb='cargo build'
alias ct='cargo test'
alias cc='cargo check'
alias cn='cargo new'
alias zb='zig build'
alias zr='zig build run'
alias zt='zig build test'
alias mk='make -j$(nproc)'

# ── Files & Directories ─────────────────────────────────────
alias mkdir='mkdir -pv'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'
alias ln='ln -iv'
alias chmod='chmod -v'
alias chown='chown -v'

# ── Quick Edits ──────────────────────────────────────────────
alias zshrc='nvim ~/.zshrc && source ~/.zshrc'
alias hyprconf='nvim ~/.config/hypr/hyprland.conf'
alias wayconf='nvim ~/.config/waybar/config.jsonc'
alias waycss='nvim ~/.config/waybar/style.css'

# ── Clipboard (Wayland) ─────────────────────────────────────
alias copy='wl-copy'
alias paste='wl-paste'

# ── Misc ─────────────────────────────────────────────────────
alias c='clear'
alias h='history | tail -30'
alias reload='source ~/.zshrc'
alias path='echo $PATH | tr ":" "\n"'
alias weather='curl wttr.in'
alias sha='shasum -a 256'
alias epoch='date +%s'
alias now='date "+%Y-%m-%d %H:%M:%S"'
alias sizeof='du -sh'
alias biggest='du -sh * | sort -rh | head -10'

eval "$(zoxide init zsh --cmd cd)"

# ── Systemd ──────────────────────────────────────────────────
alias sc='sudo systemctl'
alias scr='sudo systemctl restart'
alias sce='sudo systemctl enable --now'
alias scst='sudo systemctl status'
alias jc='journalctl -xe -n 50 --no-pager'
alias jcf='journalctl -f'
alias jcu='journalctl -xe -n 50 -u'

# ── Docker ───────────────────────────────────────────────────
alias d='docker'
alias dc='docker compose'
alias dcu='dc up -d'
alias dcd='dc down'
alias dcl='dc logs -f'
alias dps='docker ps'
alias dx='docker exec -it'

# ── Node / JS ────────────────────────────────────────────────
alias nr='npm run'
alias nd='npm run dev'
alias nb='npm run build'
alias nt='npm test'
alias pnr='pnpm run'
alias pnd='pnpm run dev'

# ── Python ───────────────────────────────────────────────────
alias py='python3'
alias venv='python3 -m venv .venv && source .venv/bin/activate'
alias activate='source .venv/bin/activate'
alias pi='pip install'
alias pir='pip install -r requirements.txt'
alias pif='pip freeze > requirements.txt'

# ── Compression ──────────────────────────────────────────────
alias untar='tar -xvf'
alias targz='tar -xvzf'
alias targzc='tar -cvzf'

# ── Network ──────────────────────────────────────────────────
alias ping='ping -c 5'
alias ipa='ip a'
alias serve='python3 -m http.server 8000'
alias listen='lsof -i -P -n | rg LISTEN'

# ── Process / Watch ──────────────────────────────────────────
alias psa='ps auxf'
alias kill9='kill -9'
alias pskill='pkill -9 -f'

# ── Encoding ─────────────────────────────────────────────────
alias jq='jq .'
alias y2j='yq -o=json'
alias j2y='yq -p=json -o=yaml'
alias b64='base64 -w0'
alias b64d='base64 -d'

# ── Git Extras ───────────────────────────────────────────────
alias gr='git remote -v'
alias gclean='git clean -fd'
alias gunstage='git restore --staged'
alias greset='git reset --soft HEAD~1'

# ── fzf ──────────────────────────────────────────────────────
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --inline-info"

export PATH=$PATH:/home/nomnomheapnom/.spicetify
export PATH=~/.npm-global/bin:$PATH
export PATH=~/.npm-global/bin:$PATH
