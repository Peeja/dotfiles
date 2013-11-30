# To profile the run time of this file, use:
# $ whyslow
#
# Tip: To see which plugins are taking a long time to load, look through the
# results for -antigen-load and see what it's calling that takes so long.

[ -n "$PROFILE_INIT" ] && zmodload zsh/zprof

## Make sure we're up to date. ##
git submodule update --init --recursive

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


## chruby ##

if [[ -d /usr/local/opt/chruby/share/chruby ]]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh
fi


### Aliases ###

# Output total time to load zsh.
alias loadtime="time zsh -il -c exit >/dev/null"

# Output total time to render prompt.
alias prompttime='time (print -P "$PS1") > /dev/null'

# Profile the run time of this file.
alias whyslow="PROFILE_INIT=true zsh -il -c exit | less"

# Use hub as git.
alias git=hub
compdef hub=git

# Zeus shortcuts
alias zc="zeus console"
alias zdb="zeus dbconsole"
alias zr="noglob zeus rake"
alias zs="zeus server"
alias zst="zeus start"

# tmux helpers
alias t="tmux attach -t"
alias tnew="tmux new-session -s"
alias tcd="pwd | xargs tmux set default-path"

# Disable some autocorrection
alias zeus="nocorrect zeus"


### Options ###
setopt globcomplete


[ -n "$PROFILE_INIT" ] && zprof
