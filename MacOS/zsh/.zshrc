# Load PowerLevel10K prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source ~/.p10k.zsh
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# Add local binaries to PATH.
PATH=$HOME/.bin/:$PATH

# Key timeout delay
KEYTIMEOUT=10

# Set default editor.
export EDITOR="nvim"

# Initialize asdf.
. $(brew --prefix asdf)/libexec/asdf.sh

# Initialize zoxide.
eval "$(zoxide init zsh --cmd j --hook pwd)"

# Initialize fzf.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Initialize command-not-found suggestion feature.
HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
if [ -f "$HB_CNF_HANDLER" ]; then
  source "$HB_CNF_HANDLER";
fi

# Initialize conda.
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin

# export ANDROID_SDK_ROOT=/opt/homebrew/Caskroom/android-sdk/4333796
# export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
# export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
# export PATH=$PATH:$ANDROID_SDK_ROOT/tools

export TOOLCHAINS=swift

# Bootstrap zsh_unplugged. (plugin manager)
# ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}
ZPLUGINDIR=$HOME/.config/zsh/plugins
if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
  git clone --quiet https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
fi
source $ZPLUGINDIR/zsh_unplugged/zsh_unplugged.plugin.zsh

# Plugins.
repos=(
  jeffreytse/zsh-vi-mode
  # MichaelAquilina/zsh-you-should-use
  zsh-users/zsh-autosuggestions
  mattmc3/zsh-safe-rm
  RobSis/zsh-completion-generator
  z-shell/F-Sy-H
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-completions
  # sobolevn/wakatime-zsh-plugin
)
plugin-load $repos

# Vim mode cursor styles.
ZVM_CURSOR_STYLE_ENABLED=false

# Custom autocomplete generation directory.
GENCOMPL_FPATH=$HOME/.zsh/complete

# ZSH autocomplete settings.
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' complete-options true
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
setopt globdots

# ZSH history config.
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Load Homebrew completions.
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

# General aliases.
alias cd="j"
alias c="clear"
alias q="exit"
alias n="neofetch"
alias p="pipes.sh"
alias v="nvim"
alias cat="bat"

# Navigation aliases.
alias ls="exa --color=auto -F --icons --group-directories-first -h"
alias l="ls -al"

# Git aliases.
alias g="git"
alias gs="g status"
alias ga="g add"
alias gc="g commit -v"
alias gcl="g clone"
alias gp="g push"
alias gpl="g pull"
alias gnb="g checkout -b"
alias gsb="g switch"
alias gl="g log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gac="ga . && gc"
alias gacp="ga . && gc && gp"
alias gb="gh browse"
alias ghpr="gh pr create --fill"
alias ggraph="ghcal -u jannatinnaim"

# VSCode alias.
alias icode="code-insiders"

# Quick config edit aliases.
alias dotfiles="nvim ~/Documents/Code/.dotfiles/"
alias shellconfig="nvim ~/.zshrc"
alias nvimconfig="nvim ~/.config/nvim/"
alias tmuxconfig="nvim ~/.tmux.conf"

# Shell reload.
alias reload="exec $SHELL"

# Homebrew update alias.
alias brewupdate="brew update && brew outdated && brew upgrade && brew cleanup"

# Coding workspace generator.
function hackerman {
  tmux new-session \; \
    rename-session ${1:-"${PWD##*/}"} \; \
    rename-window "CODE" \; \
    new-window -d -n "BUILD" \; \
    new-window -d -n "GIT" \; \
    new-window -d -n "MISC"
}

# Alias for cloning own repositories.
function ogclone {
  gcl git@github.com:JannatinNaim/${1}
}
# Alias for cloning git repositories.
function gclone {
  gcl git@github.com:${1}
}
