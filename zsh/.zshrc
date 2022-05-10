KEYTIMEOUT=1

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export EDITOR="nvim"
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

export ZSH="$HOME/.local/share/omz/"
export ZSH_CUSTOM="$ZSH/custom"

export ZSH_THEME="powerlevel10k/powerlevel10k"
# source "$HOME/.dotfiles/zsh/config/starship/starship.zsh"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 1

source "$HOME/.dotfiles/zsh/config/auto-notify.zsh"

plugins=(
  tmux
  vi-mode
  ssh-agent
  gpg-agent

  F-Sy-H
  # auto-notify
  zsh-autosuggestions
)

source "$ZSH/oh-my-zsh.sh"
source "$HOME/.p10k.zsh"

for aliasfile in ~/.dotfiles/zsh/aliases/*.zsh; do source "$aliasfile"; done

source "$HOME/.dotfiles/zsh/config/zoxide.zsh"
eval "$(zoxide init --cmd j --hook pwd zsh)"

. $(brew --prefix asdf)/libexec/asdf.sh
