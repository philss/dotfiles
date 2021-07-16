# Copied from: https://github.com/doughsay/omf-theme-doughsay/blob/396abe1e0fed949b95ccb921acca62690f279b07/fish_right_prompt.fish
# And also from "asdf" plugin from omf

function __find_closest_tool_versions
  set -l cwd (pwd)

  set version_file "$cwd/.tool-versions"

  if test -f "$version_file"; and test "$version_file" != "$HOME/.tool-versions"
    echo $version_file
  else
    echo "$HOME/.tool-versions"
  end
end

function asdf-tools
  set -l version_files (__find_closest_tool_versions)
  set -l tools
  set -l tool
  set -l tool_version

  for version_file in $version_files
    for line in (cat $version_file | rg "(elixir|erlang)")
      set tool (echo $line | awk '{print $1}')
      set tool_version (echo $line | awk '{print $2}')

      if not contains $tool $tools
        set tools $tools $tool

        echo $tool $tool_version
      end
    end
  end
end

function fish_right_prompt
  if [ "$theme_display_asdf" = "yes" ]
    set_color $fish_color_autosuggestion
    echo -n (string join (__doughsay_right_prompt_sep) (asdf-tools))
    set_color normal
  end
end

function __doughsay_right_prompt_sep
  set_color magenta
  echo -n " ∴ "
  set_color $fish_color_autosuggestion
end
