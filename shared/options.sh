autoload -Uz compinit
compinit

# |--------------------|
# | Completion Options |
# |--------------------|
setopt AUTO_MENU
setopt AUTO_LIST
setopt AUTO_PARAM_SLASH
setopt AUTO_PARAM_KEYS
setopt ALWAYS_TO_END
setopt COMPLETE_ALIASES
setopt GLOB_COMPLETE
setopt HASH_LIST_ALL
setopt LIST_TYPES
setopt LIST_AMBIGUOUS
setopt LIST_ROWS_FIRST

# |----------------------------|
# | Changing Directory Options |
# |----------------------------|
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt CDABLE_VARS

# |-----------------|
# | History Options |
# |-----------------|
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_NO_FUNCTIONS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt SHARE_HISTORY

# |----------------------|
# | Input/Output Options |
# |----------------------|
setopt ALIASES
setopt CLOBBER
setopt HASH_DIRS
setopt SHORT_LOOPS

# |-------------------|
# | Prompting Options |
# |-------------------|
setopt PROMPT_SUBST

# |-----------------|
# | Completion Menu |
# |-----------------|
zstyle ':completion:*' menu select completer

# |----------------------|
# | Completion Selection |
# |----------------------|
zstyle ':completion:*' select-prompt %SSelection at %p%s

# |---------------------|
# | Completion Messages |
# |---------------------|
zstyle ':completion:*:messages' format '%B%F{magenta}--- %d ---%f%b'
zstyle ':completion:*:warnings' format '%B%F{red}--- no completions found ---%f%b'
zstyle ':completion:*:*:*:*:descriptions' format '%B%F{magenta}--- %d ---%f%b'
zstyle ':completion:*:*:*:*:corrections' format '%B%F{red}--- %d (errors: %e) ---%f%b'

# |----------------------|
# | Completion Groupings |
# |----------------------|
zstyle ':completion:*' group-name ''

# |----------------------|
# | Matching Completions |
# |----------------------|
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:matches' group 'yes'

# |-------------------|
# | Completion Colors |
# |-------------------|
zstyle ':completion:*:*' list-colors '=*=1;3;36'

# |-----------------------|
# | Ambiguous Completions |
# |-----------------------|
zstyle ':completion:*' insert-unambiguous true

# |------------------|
# | Auto-Description |
# |------------------|
zstyle ':completion:*' auto-description 'specify: %d'
