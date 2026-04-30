# A base for fish configuration

# On Linux this might be necessary.
# set -x GPG_TTY (tty)
set -x EDITOR nvim

if status is-interactive
  set -g fish_user_abbreviations
  abbr -a vim nvim
  abbr -a tx env TERM=screen-256color tmuxinator
  abbr -a gco git checkout
  abbr -a ls eza
  abbr -a tree "eza -T"
end

# Local binaries
set _local_bin "$HOME/.local/bin"
if not contains $_local_bin $PATH
  mkdir -p $_local_bin
  set -gx --prepend PATH $_local_bin
end
set --erase _local_bin

# Python binaries (for current python version)
set _python_user_base (python3 -m site --user-base)
if not contains $_python_user_base $PATH
  mkdir -p $_python_user_base
  set -gx --prepend PATH $_python_user_base
end
set --erase _python_user_base

# ASDF configuration code (version  ~> 0.18.0)
if test -z $ASDF_DATA_DIR
  set _asdf_shims "$HOME/.asdf/shims"
else
  set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
  set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims
