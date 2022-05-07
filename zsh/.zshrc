if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH="$HOME/.local/share/omz"
ZSH_CUSTOM="$ZSH/custom"
ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 1

for f in ~/.dotfiles/zsh/config/**/*.zsh; do source $f; done

plugins=(
  ################
  # CORE PLUGINS #
  ################

  tmux # TMUX integration and aliases.
)

source $ZSH/oh-my-zsh.sh
source ~/.p10k.zsh
