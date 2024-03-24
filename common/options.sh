####################
## shell settings ##
####################
autoload -Uz compinit # load the compinit function
compinit # initialize the autocompletion system

####################
## shell options ##
####################
setopt AUTO_MENU # automatically display the completion menu
setopt AUTO_LIST # automatically list completions
setopt AUTO_PARAM_SLASH # automatically insert a slash after a completed directory
setopt AUTO_PARAM_KEYS # automatically completes parameter names for arguments
setopt ALWAYS_TO_END # always move the cursor to the end of the line when accepting a completion
setopt COMPLETE_ALIASES # complete aliases
setopt GLOB_COMPLETE # complete glob patterns
setopt LIST_TYPES # list the types of completion (file, directory, etc.).
setopt LIST_AMBIGUOUS # list all completions even if they are ambiguous
setopt LIST_ROWS_FIRST # list rows instead of columns
setopt AUTO_CD # automatically change to a directory without typing cd
setopt AUTO_PUSHD # automatically push the currect directory onto the directory stack
setopt PUSHD_IGNORE_DUPS # ignore duplicate directories when pushing onto the directory stack
setopt CDABLE_VARS # treat variables as directories
setopt INC_APPEND_HISTORY # append history lines to the history file as they are entered
setopt HIST_FIND_NO_DUPS # do not display duplicate history entries
setopt HIST_IGNORE_ALL_DUPS # ignore all history entries that are duplicates of the previous entry
setopt HIST_SAVE_NO_DUPS # do not save history entries that are duplicates of the previous entry
setopt HIST_REDUCE_BLANKS # remove blanks from each command line being added to the history file
setopt HIST_VERIFY # do not execute immediately upon history expansion
setopt SHARE_HISTORY # share history between all sessions
setopt HASH_DIRS # cache the path to directories
setopt SHORT_LOOPS # allow the short form for loops
setopt PROMPT_SUBST # allow command substitution in the prompt

###################
## shell styling ##
###################
zstyle ':completion:*' menu select completer # select the completion menu styl
zstyle ':completion:*' select-prompt %SSelection at %p%s # select the completion prompt style
zstyle ':completion:*:messages' format '%B%F{magenta}--- %d ---%f%b' # completion messages format
zstyle ':completion:*:warnings' format '%B%F{red}--- no completions found ---%f%b' # completion warnings format
zstyle ':completion:*:*:*:*:descriptions' format '%B%F{magenta}--- %d ---%f%b' # completion descriptions format
zstyle ':completion:*:*:*:*:corrections' format '%B%F{red}--- %d (errors: %e) ---%f%b' # completion corrections format
zstyle ':completion:*' group-name '' # completion group name
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*' # sets the matching style for completions
zstyle ':completion:*:matches' group 'yes' # group matching completions together
zstyle ':completion:*:*' list-colors '=*=1;3;36' # sets the list colors for completions
zstyle ':completion:*' insert-unambiguous true # insert unambiguous completions automatically
zstyle ':completion:*' auto-description 'specify: %d' # auto-description format
