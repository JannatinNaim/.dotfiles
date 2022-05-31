if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source ~/.p10k.zsh
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

PATH=$HOME/.bin/:$PATH
KEYTIMEOUT=10
EDITOR="nvim"

. $(brew --prefix asdf)/libexec/asdf.sh

eval "$(zoxide init zsh --cmd j --hook pwd)"

ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}
if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
  git clone --quiet https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
fi
source $ZPLUGINDIR/zsh_unplugged/zsh_unplugged.plugin.zsh

repos=(
  jeffreytse/zsh-vi-mode
  MichaelAquilina/zsh-you-should-use
  zsh-users/zsh-autosuggestions
  mattmc3/zsh-safe-rm
  RobSis/zsh-completion-generator
  z-shell/F-Sy-H
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-completions
  sobolevn/wakatime-zsh-plugin
)
plugin-load $repos

ZVM_CURSOR_STYLE_ENABLED=false
GENCOMPL_FPATH=$HOME/.zsh/complete

alias ls="exa"
alias l="ls -al --color=auto"

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

alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit -v"
alias gp="git push"
alias gacp="ga . && gc && gp"

alias dotfiles="nvim ~/.dotfiles"
alias shellconfig="nvim ~/.zshrc"
alias nvimconfig="nvim ~/.config/nvim"
alias tmuxconfig="nvim ~/.tmux.conf"

alias reload="exec $SHELL"

alias brewupdate="brew update && brew outdated && brew upgrade && brew cleanup"

eval $(thefuck --alias)

HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
if [ -f "$HB_CNF_HANDLER" ]; then
  source "$HB_CNF_HANDLER";
fi

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

function hackerman {
  tmux new-session \; \
    rename-session ${1:-"${PWD##*/}"} \; \
    rename-window "CODE" \; \
    new-window -d -n "BUILD" \; \
    new-window -d -n "GIT" \; \
    new-window -d -n "MISC"
}
