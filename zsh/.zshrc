if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

export STARSHIP_CONFIG="$HOME/.dotfiles/zsh/config/starship.toml"
eval "$(starship init zsh)"
