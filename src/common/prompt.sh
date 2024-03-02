#!/usr/bin/env zsh

autoload -Uz promptinit
autoload -Uz vcs_info

zstyle ":vcs_info:*" actionformats "%b|%a"
zstyle ":vcs_info:*" formats "%b"

function precmd () {
  vcs_info && set_prompt
}

function chpwd () {
  vcs_info && set_prompt
}

function set_prompt () {
  [[ -n ${vcs_info_msg_0_} ]] && {
    GIT_BRANCH="%F{blue}⎇%f $(print "${vcs_info_msg_0_}" | sed "s|/|%B%F{blue}/%f%b|g")"
  } || {
    GIT_BRANCH=""
  }

  CURRENT_DIR="$(pwd | sed "s|$HOME|%B%F{yellow}~%f%b|" | sed "s|/|%B%F{blue}/%f%b|g")"
  CURRENT_TIME="$(date +%r | sed "s|^0||" | sed "s|:|%B%F{blue}:%f%b|g")"
  CURRENT_DATE="$(date +%D | sed "s|/|%B%F{blue}/%f%b|g")"

  PROMPT="
%F{yellow}[%F{blue}[%f $CURRENT_DIR %F{blue}]%f%F{yellow}]%f $GIT_BRANCH
%F{yellow}➡%f "

  RPROMPT="%F{yellow}[%F{blue}[%f $CURRENT_TIME %B%F{yellow}|%f%b $CURRENT_DATE %F{blue}]%f%F{yellow}]%f"
}
