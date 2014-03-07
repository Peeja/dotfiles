# To profile the run time of this file, use:
# $ whyslow

[ -n "$PROFILE_INIT" ] && zmodload zsh/zprof

## Make sure we're up to date. ##
(cd ~; git submodule update --init --recursive)

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


# OS X's /etc/zshenv (erroneously) changes the path. That should really be set
# in /etc/zshrc, which is only loaded for the outermost shell. Subshells should
# inherit the path set in /etc/zshrc and ~/.zshrc. Instead, /etc/zshenv (which
# loads for each subshell) overwrites the path.
#
# To get around that, we secret away the path in this environment variable.
# Then we restore it in ~/.zshenv.
#
# Call this function any time you modify the path to update it.
function skirt_osx_path_helper__update {
  export PATH__SKIRT_OSX_PATH_HELPER="$PATH"
}


path=(
  $HOME/bin
  /usr/local/{bin,sbin}
  $path
)

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# We generally want trusted binstubs to come before chruby's gem binaries.

function git_trusted__update {
  path=(
    ./.git/trusted/../../bin
    $path
  )
  typeset -gU path
}

## chruby ##

if [[ -d /usr/local/opt/chruby/share/chruby ]]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh
fi

skirt_osx_path_helper__update
git_trusted__update

# chruby will update our path on preexec, so now we need to watch for that change.
preexec_functions+=("git_trusted__update" "skirt_osx_path_helper__update")


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

# Trying out gh, a hub clone written in Go, instead.
alias git=gh
compdef gh=git

# Rails shortcuts
alias rc="rails console"
alias rdb="rails dbconsole"
alias rr="noglob rails rake"
alias rs="rails server"

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
unsetopt NOTIFY

# Turn off flow control, free up <C-S> and <C-Q> keys.
stty -ixon


## Modules in progress...

# Ctrl-Zsh

# ^Z to foreground the last suspended job.
foreground-current-job() { fg; zle reset-prompt; }
zle -N foreground-current-job
bindkey -M emacs '^z' foreground-current-job


# Jobs

zmodload zsh/parameter

# TODO: Make it an actual format string.
# FIXME: Prompt doesn't refresh after ending job fg'ed with Ctrl-Zsh.
function jobs-info {
  # Clean up previous $jobs_info.
  unset jobs_info
  typeset -gA jobs_info

  local suspended_job_count=${(Mw)#jobstates#suspended:}
  local suspended_format
  zstyle -s ":prezto:module:jobs:info:count:suspended:$suspended_job_count" format suspended_format
  jobs_info[suspended]="$suspended_format"

  local running_job_count=${(Mw)#jobstates#running:}
  local running_format
  zstyle -s ":prezto:module:jobs:info:count:running:$running_job_count" format running_format
  jobs_info[running]="$running_format"
}

add-zsh-hook precmd jobs-info


zstyle ':prezto:module:jobs:info:count:*:0' format ''

() {
  local circled_numbers
  circled_numbers=(➊ ➋ ➌ ➍ ➎ ➏ ➐ ➑ ➒ ➓)
  for n in {1..10}; do
    zstyle ":prezto:module:jobs:info:count:*:$n" format " $circled_numbers[$n]"
  done
}

zstyle ':prezto:module:jobs:info:count:*:*' format " ✪"


RPROMPT="%F{green}\$jobs_info[running]%f%F{blue}\$jobs_info[suspended]%f$RPROMPT"


[ -n "$PROFILE_INIT" ] && zprof
