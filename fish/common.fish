set -g fish_user_paths "$HOME/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.cargo/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.local/bin" $fish_user_paths

set -x GPG_TTY (tty)
set -x EDITOR nvim
set -x ECTO_EDITOR nvim

if status --is-interactive
  set -g fish_user_abbreviations
  abbr -a vim nvim
  abbr -a tx env TERM=screen-256color tmuxinator
  abbr -a gco git checkout
  abbr -a format "git status --porcelain | cut -d' ' -f3 | xargs | mix format"
  abbr -a ls exa
  abbr -a tree "exa -T"
end
