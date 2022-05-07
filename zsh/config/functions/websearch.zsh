function websearch() {
  emulate -L zsh

  typeset -A urls
  urls=(
    google      "https://www.google.com/search?q="
    duckduckgo  "https://www.duckduckgo.com/?q="
    github      "https://github.com/search?q="
    stackoverflow  "https://stackoverflow.com/search?q="
  )

  if [[ -z "$urls[$1]" ]]; then
    echo "'$1' is not supported."
    return 1
  fi

  if [[ $# -gt 1 ]]; then
    url="${urls[$1]}${(j:+:)@[2,-1]}"
  else
    url="${(j://:)${(s:/:)urls[$1]}[1,2]}"
  fi

  open_command "$url"
}
