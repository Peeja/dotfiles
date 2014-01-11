#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Adjust path.
# This has to happen in .zshenv to counteract OS X's /etc/zshenv, which
# (erroneously) changes the path.

path=(
  $HOME/bin
  /usr/local/{bin,sbin}
  $path
)

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path
