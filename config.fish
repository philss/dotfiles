set -g fish_user_paths "$HOME/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.cargo/bin" $fish_user_paths

set -x GPG_TTY (tty)
set -x EDITOR nvim

if status --is-interactive
  set -g fish_user_abbreviations
  abbr -a vim nvim
  abbr -a tx env TERM=screen-256color tmuxinator
  abbr -a gco git checkout
  abbr -a gst git status
  abbr -a gfix git commit --amend -a --no-edit
  abbr -a gsub 'git submodule update --remote --merge'
  abbr -a floki 'cd ~/sandbox/floki'
  abbr -a pods 'kubectl get pods'
  abbr -a kexec 'kubectl exec -it'
  abbr -a livecam 'gst-launch-1.0 souphttpsrc location=http://192.168.15.27:80/live ! jpegdec ! videoconvert ! v4l2sink device=/dev/video0'
  abbr -a format "git status --porcelain | cut -d' ' -f3 | xargs | mix format"
end

source ~/.asdf/asdf.fish
