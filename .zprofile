export BROWSER="open"
export EDITOR="vim"
export PAGER="less"

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

path=(
  /usr/local/{bin,sbin}
  $path
)
