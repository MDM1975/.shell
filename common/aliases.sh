# show all files in current directory, including hidden files, sorted by size
alias ls="ls -aSGF"

# list all paths in $PATH
alias path="echo $PATH | tr ':' '\n'"

# kill process
alias kl="kill -9"

# kill all node processes
alias kln="killall node"

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

# see all port processes listening
alias ports="lsof -i -P -n | grep LISTEN"
