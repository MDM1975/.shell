autoload -Uz promptinit
autoload -Uz vcs_info

zstyle ":vcs_info:*" formats "%b"
zstyle ":vcs_info:*" actionformats "%b|%a"

# hook to run after a command is executed to update the version control information and set the prompt
function precmd () {
  vcs_info && set_prompt
}

# hook to run after the current directory is changed to update the version control information and set the prompt
function chpwd () {
  vcs_info && set_prompt
}

# set the prompt to display the current directory, time, date, and git branch
function set_prompt () {
  local CURRENT_DIR="$(pwd | sed "s|$HOME|%B%F{#14FF00}~%f%b|" | sed "s|/|%B%F{#14FF00}/%f%b|g")"
  local CURRENT_TIME="$(date +%r | sed "s|^0||" | sed "s|:|%B%F{#14FF00}:%f%b|g")"
  local CURRENT_DATE="$(date +%D | sed "s|/|%B%F{#14FF00}/%f%b|g")"
  local CURRENT_BATTERY="$(pmset -g batt | egrep "([0-9]{1,3}%)" -o)"
  local CURRENT_GIT_BRANCH=""

  [[ -n ${vcs_info_msg_0_} ]] && {
    CURRENT_GIT_BRANCH="%F{#14FF00}⎇%f $(print "${vcs_info_msg_0_}" | sed "s|/|%B%F{#14FF00}/%f%b|g")"
  } || {
    CURRENT_GIT_BRANCH=""
  }

  PROMPT="
%F{#14FF00}(%F{#14FF00}(%f $CURRENT_DIR %F{#14FF00})%f%F{#14FF00})%f $CURRENT_GIT_BRANCH
%F{#14FF00}➡%f "

  RPROMPT="%F{#14FF00}(%F{#14FF00}(%f $CURRENT_TIME %B%F{#14FF00}|%f%b $CURRENT_DATE %B%F{#14FF00}|%f%b $CURRENT_BATTERY% %F{#14FF00})%f%F{#14FF00})%f"
}
