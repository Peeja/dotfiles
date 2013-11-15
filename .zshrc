### OMZsh Options ###
COMPLETION_WAITING_DOTS="true"


### Antigen ###
source ~/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<BUNDLES
  brew
  gem
  rbenv
  Peeja/ctrl-zsh

  # Note: zsh-syntax-highlighting needs to be the last bundle, according to its README.
  zsh-users/zsh-syntax-highlighting
BUNDLES

antigen theme clean

antigen apply


### Keys ###

# Emacs mode
bindkey -A emacs main


### Aliases ###

# Use hub as git.
alias git=hub
compdef hub=git

# tmux helpers
alias t="tmux attach -t"
alias tnew="tmux new-session -s"
alias tcd="pwd | xargs tmux set default-path"

# Projects
alias wltn="cd /Users/peeja/Dropbox/File\ Cabinet/WLTN/welikethisnow"

### Functions ###
newpost() {
  local post_name="$1"
  cd ~/git/peeja-blog
  rake "new_post[$post_name]"
  local new_post_file=$(ls -tU source/_posts/* | head -n1)
  vim $new_post_file
}

getpassword() {
  local name="$1"
  security find-generic-password -s "$1" -g 2>&1 >/dev/null | sed 's/password: "\(.*\)"/\1/'
}

gmailbackup() {
  local password=$(getpassword "Gmail Backup")
  (cd ~/pkg/gmail-backup-0.107-linux && ./gmail-backup.sh backup ~/mail/peter.a.jaros@gmail.com peter.a.jaros@gmail.com "$password" --stamp)
}

### Options ###
setopt globcomplete
stty -ixon  # Turn off XOFF/XON (software flow control) and free up <C-S> for vim bindings.
