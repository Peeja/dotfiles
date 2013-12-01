# To profile the run time of this file, use:
# $ whyslow

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

# Profile the run time of this file.
alias whyslow="PROFILE_INIT=true zsh -il -c exit | less"

# Use hub as git.
# Disabled temporarily: It makes the prompt slow.
# https://github.com/sorin-ionescu/prezto/issues/507
#
# alias git=hub
# compdef hub=git

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


## Functions

# Show times to run preexec functions and render prompt.
function prompttime {
  TIMEFMT="%E"

  for f in $precmd_functions; do
    echo -n "$f\t"
    time ($f) > /dev/null
  done

  echo -n "PROMPT\t"
  time (print -P "$PROMPT") > /dev/null
}

# Profile a function with zprof.
# Usage: zprof-func some-function with-arguments
function zprof-func {
  (
    unset precmd_functions
    zmodload zsh/zprof
    $@
    zprof
  )
}


### Options ###
setopt GLOB_COMPLETE
setopt HUP
setopt CHECK_JOBS
unsetopt AUTO_RESUME


[ -n "$PROFILE_INIT" ] && zprof

return 0
