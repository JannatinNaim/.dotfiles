KEYTIMEOUT=10
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/bin:/usr/local/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 1

plugins=(
  asdf
  tmux
  vi-mode
  ssh-agent
  gpg-agent
  F-Sy-H
  zsh-autosuggestions
)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh

alias brewupdate="brew update && brew outdated && brew upgrade && brew cleanup"

HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
if [ -f "$HB_CNF_HANDLER" ]; then
source "$HB_CNF_HANDLER";
fi

eval "$(zoxide init --cmd j --hook pwd zsh)"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source "${HOME}/.iterm2_shell_integration.zsh"

alias ga="git add"
alias gc="git commit -v"
alias gp="git push"
