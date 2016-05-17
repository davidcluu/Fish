set fish_color_user f7f7f7
set fish_color_host f7f7f7
set fish_color_cwd cdee69
set git_color ffe377
set fish_color_status e09690
set virtual_env_color e09690

set __fish_git_prompt_show_informative_status 1
set __fish_git_prompt_char_upstream_ahead  "↑"
set __fish_git_prompt_char_upstream_behind "↓"
set __fish_git_prompt_char_stateseparator  "|"
set __fish_git_prompt_char_dirtystate      "✚ "
set __fish_git_prompt_char_invalidstate    "✖ "
set __fish_git_prompt_char_stagedstate     "● "
set __fish_git_prompt_char_untrackedfiles  "…"
set __fish_git_prompt_char_cleanstate      "✔ "

function fish_prompt
  set -l last_status $status

  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

  switch $USER
    case root
      if not set -q __fish_prompt_cwd
        if set -q fish_color_cwd_root
          set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
        else
          set -g __fish_prompt_cwd (set_color $fish_color_cwd)
        end
    end
    case '*'
      if not set -q __fish_prompt_cwd
        set -g __fish_prompt_cwd (set_color $fish_color_cwd)
      end
    end

  set -l prompt_status
  if test $last_status -ne 0
    if not set -q __fish_prompt_status
      set -g __fish_prompt_status (set_color $fish_color_status)
    end
    set prompt_status "$__fish_prompt_status [$last_status]$__fish_prompt_normal"
  end

  if not set -q __fish_prompt_user
    set -g __fish_prompt_user (set_color $fish_color_user)
  end
  if not set -q __fish_prompt_host
    set -g __fish_prompt_host (set_color $fish_color_host)
  end

  # user@host
  echo -n -s "$__fish_prompt_user" "$USER" "$__fish_prompt_normal"
  echo -n -s @
  echo -n -s "$__fish_color_host" "$__fish_prompt_hostname" "$__fish_prompt_normal"

  echo -n -s " "

  # current directory
  echo -n -s "$__fish_prompt_cwd" (pwd)

  # git
  echo -n -s (set_color $git_color) (__fish_git_prompt) (set_color normal)

  if set -q VIRTUAL_ENV
    echo -n -s (set_color $virtual_env_color) " [" (basename "$VIRTUAL_ENV") "]" (set_color normal) " "
  end

  # prompt status
  echo -n -s "$__fish_prompt_normal" "$prompt_status" 
  echo

  # prompt
  echo '~> '
end
