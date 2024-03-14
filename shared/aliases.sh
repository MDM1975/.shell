# show all files in current directory, including hidden files, sorted by size
alias ls="ls -aSGF"

# list global npm packages
alias nls="npm list -g"

# list all paths in $PATH
alias paths="echo $PATH | tr ':' '\n'"

# make directory and all parent directories
alias mkdir='mkdir -p'

# remove directory and all its contents
alias rmd='rm -rdf'

# remove file
alias rmf='rm -f'

# kill process
alias kl="kill -9"

# print the current date and time
alias now="date +'⏰ %r ⎮ 🗓️ %D'"

# edit the global git config
alias gitconfig="code ~/.gitconfig"

# edit the .shell directory
alias shell="code ~/.shell"
