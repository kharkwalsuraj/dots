
function f
    set -l path (command fzf --preview 'cat {} 2>/dev/null')
    test -n "$path" || return
    printf '%s' "$path" | wl-copy
end

function fi
    set -l path (command fzf --preview 'cat {} 2>/dev/null')
    test -n "$path" || return
    nvim "$path"
end


if status is-interactive
  zoxide init fish | source
  set -gx EDITOR nvim
  set -gx VISUAL nvim

  alias nv "nvim"
  alias yy "yazi"
  alias lg "lazygit"
end
