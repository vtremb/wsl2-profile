# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Download Znap, if it's not there yet.
[[ -r ~/znap-plugins/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/znap-plugins/znap
source ~/znap-plugins/znap/znap.zsh  # Start Znap

# `znap source` starts plugins.
znap source marlonrichert/zsh-autocomplete
znap source TomfromBerlin/zsh-cmd-time
znap source MichaelAquilina/zsh-autoswitch-virtualenv
znap source zsh-users/zsh-syntax-highlighting
znap source romkatv/windows-terminal-zsh-integration
znap source trystan2k/zsh-tab-title

ZSH_TAB_TITLE_ONLY_FOLDER=true
ZSH_TAB_TITLE_CONCAT_FOLDER_PROCESS=false

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git aws)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias cats='highlight -O ansi --force'

skip_global_compinit=1

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

zstyle ':autocomplete:*' min-input 3
zstyle ':autocomplete:*' delay 0.1
zstyle ':autocomplete:*' default-context history-incremental-search-backward

# Use tab & shift-tab for file/directory completion
bindkey              '^I' expand-or-complete
bindkey "$terminfo[kcbt]" reverse-menu-complete

# Use up/down arrows to enter history search menu
bindkey "^[OA" menu-select
bindkey "^[[A" menu-select
bindkey "^[OB" menu-select
bindkey "^[[B" menu-select

bindkey -M menuselect              '^I' menu-complete
bindkey -M menuselect "$terminfo[kcbt]" reverse-menu-complete

bindkey -M menuselect "^[OA" reverse-menu-complete
bindkey -M menuselect "^[[A" reverse-menu-complete
bindkey -M menuselect "^[OB"         menu-complete
bindkey -M menuselect "^[[B"         menu-complete

bindkey -M menuselect  '^[[D' .backward-char  '^[OD' .backward-char
bindkey -M menuselect  '^[[C'  .forward-char  '^[OC'  .forward-char

bindkey -M emacs \
    "^[p"   .history-search-backward \
    "^[n"   .history-search-forward \
    "^P"    .up-line-or-history \
    \ # "^[OA"  .up-line-or-history \
    \ # "^[[A"  .up-line-or-history \
    "^N"    .down-line-or-history \
    \ # "^[OB"  .down-line-or-history \
    \ # "^[[B"  .down-line-or-history \
    "^R"    .history-incremental-search-backward \
    "^S"    .history-incremental-search-forward \
    #
bindkey -a \
    "^P"    .up-history \
    "^N"    .down-history \
    "k"     .up-line-or-history \
    \ # "^[OA"  .up-line-or-history \
    \ # "^[[A"  .up-line-or-history \
    "j"     .down-line-or-history \
    \ # "^[OB"  .down-line-or-history \
    \ # "^[[B"  .down-line-or-history \
    "/"     .vi-history-search-backward \
    "?"     .vi-history-search-forward \
    #

export LC_COLLATE=C.UTF-8

export WINHOME=$(ls -d -w 1 /mnt/c/Users/* | grep Vincent)
export PATH="$HOME/.nix-profile/bin:$HOME/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:$WINHOME/AppData/Local/Programs/oh-my-posh/bin/:$WINHOME/AppData/Local/Programs/Microsoft VS Code/bin"

export AWS_PROFILE=developer-vincent
export SLS_STAGE=vtremblay
export API_GATEWAY_ID=qyksrg4ba4

alias clip="/mnt/c/Windows/System32/clip.exe"

alias g="git"
alias gs="git status"
alias gco="git checkout"
alias grs="git reset"
alias ga="git add"
alias gcm="git commit"
alias grb="git rebase"
alias gcp="git cherry-pick"
alias gpl="git pull"
alias gps="git push"

# fnm
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$HOME/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# Shell integration with VS Code
# See https://code.visualstudio.com/docs/terminal/shell-integration
[[ "$TERM_PROGRAM" == "vscode" ]] && . $HOME/.vscode-server/bin/*/out/vs/workbench/contrib/terminal/common/scripts/shellIntegration-rc.zsh

# Use podman as the docker host
# export DOCKER_HOST="unix:/run/user/1000/podman/podman.sock"
# alias docker="podman"

. "$HOME/.local/share/../bin/env"

# pnpm
export PNPM_HOME="/home/ht/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# fnm
FNM_PATH="/home/ht/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/ht/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# fnm
FNM_PATH="/home/ht/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/ht/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# fnm
FNM_PATH="/home/ht/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/ht/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# fnm
FNM_PATH="/home/ht/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/ht/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi
