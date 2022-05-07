if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="$HOME/.local/bin:$PATH"

ZSH="$HOME/.local/share/omz"
ZSH_CUSTOM="$ZSH/custom"
ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 1

for file in ~/.dotfiles/zsh/config/plugins/*.zsh; do source $file; done

plugins=(
  ########
  # CORE #
  ########

  # tmux # TMUX integration and aliases.
  vi-mode # Vim mode.
  per-directory-history # Directory specific command history.
  pip # PIP completion and aliases.
  perms # Fix directory and file permissions.
  keychain # Credential management.
  ssh-agent # Initialize ssh-agent.
  gpg-agent # Initialize gpg-agent.
  git # Git integration and aliases.
  git-auto-fetch # Auto fetch git remotes.
  gitignore # Gitignore template files.
  # last-working-dir # Switch to last working directory.
  fzf # FZF integration.
  colored-man-pages # Colorful man pages.

  ###############
  # THIRD PARTY #
  ###############

  fast-syntax-highlighting # Syntax highlighting.
  igit # Interactive git.
  print-alias # Expand aliases.
  zsh-show-path # Show path line by line.
  # zsh-vi-mode # Better vim mode.
  zsh-wakatime # Track CLI time.
  zshrc # Auto load custom zshrc file.
  auto-notify # Notify on long running process completion.
  # zsh-autocomplete # Syntax autocomplete.
  zsh-autosuggestions # Syntax autocomplete.
  autopair # Auto pairs.
  autoupdate # Auto update zsh plugins.
  # zsh-clean-project # Clean files.
  alias-tips # Show alias for commands.
  # fzf-zsh-completions # FZF for completions.
)

source $ZSH/oh-my-zsh.sh
source ~/.p10k.zsh

eval "$(zoxide init --cmd j --hook pwd zsh)" # Initialize zoxide.
eval "$(direnv hook zsh)" # Initialize direnv hook.
. $(brew --prefix asdf)/libexec/asdf.sh

for file in ~/.dotfiles/zsh/config/functions/*.zsh; do source $file; done
for file in ~/.dotfiles/zsh/config/completions/*.zsh; do source $file; done
for file in ~/.dotfiles/zsh/config/aliases/*.zsh; do source $file; done

# source ~/.local/share/omz/plugins/fzf-tab-completion/zsh/fzf-zsh-completion.sh
