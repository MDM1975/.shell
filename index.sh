# load shared files
function load_shared () {
    local SHARED=($HOME/.shell/shared/*)

    for i in $SHARED
        do source $i
    done
}

# load private files
function load_private () {
    [[ -d $1 ]] && {
        local PRIVATE=($1/*)

        for i in $PRIVATE
            # recursively load private files if directory
            do [[ -d $1 ]] && load_private $i || source $i
        done
    }
}

load_shared

load_private "$HOME/.shell/private/"
