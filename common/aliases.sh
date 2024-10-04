# show all files in current directory, including hidden files, sorted by size
alias ls="ls -aSGF"

# kill process
alias kl="kill -9"

# show the size of the current directory
alias size="du -sh"

# list all paths in $PATH
alias path="echo $PATH | tr ':' '\n'"

# see all port processes listening
alias ports="lsof | grep LISTEN"

# print the current date and time
alias now="date +'%r ⎮ %D'"

# edit the global git config
alias gitconfig="code ~/.gitconfig"

# edit the .shell directory
alias shell="code ~/.shell"

# edit the .zshrc file
alias zshrc="code ~/.zshrc"

# edit the .vimrc file
alias vimrc="code ~/.vimrc"
