autoload -Uz promptinit
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

# initialize the prompt system
zstyle ":vcs_info:*" formats "%b"
zstyle ":vcs_info:*" actionformats "%b | %a"

# set the prompt to display the current directory, time, date, and git branch
function set_prompt () {
  CURRENT_DIR="$(pwd | sed "s|$HOME|%B%F{#14FF00}~%f%b|" | sed "s|/|%B%F{#14FF00}/%f%b|g")"
  CURRENT_TIME="$(date +%r | sed "s|^0||" | sed "s|:|%B%F{#14FF00}:%f%b|g")"
  CURRENT_DATE="$(date +%D | sed "s|/|%B%F{#14FF00}/%f%b|g")"
  CURRENT_BATTERY="$(pmset -g batt | grep -E "([0-9]{1,3}%)" -o)"
  CURRENT_GIT_BRANCH=""

  vcs_info

  if [[ -n ${vcs_info_msg_0_} ]]
  then
    CURRENT_GIT_BRANCH="%F{#14FF00}⎇%f $(echo "${vcs_info_msg_0_}" | sed "s|/|%B%F{#14FF00}/%f%b|g")"
  else
    CURRENT_GIT_BRANCH=""
  fi

  export PROMPT="
%F{#14FF00}(%F{#14FF00}(%f $CURRENT_DIR %F{#14FF00})%f%F{#14FF00})%f $CURRENT_GIT_BRANCH
%F{#14FF00}➡%f "

  export RPROMPT="%F{#14FF00}(%F{#14FF00}(%f $CURRENT_TIME %B%F{#14FF00}|%f%b $CURRENT_DATE %B%F{#14FF00}|%f%b $CURRENT_BATTERY% %F{#14FF00})%f%F{#14FF00})%f"
}

# add the set_prompt function to the precmd and chpwd hooks
add-zsh-hook precmd set_prompt
add-zsh-hook chpwd set_prompt
