# load common files
function load_common () {
    local COMMON=($HOME/.shell/common/*)

    for i in $COMMON
        # load common files
        do source $i
    done
}

# load local files
function load_local () {
    [[ -d $1 ]] && {
        local local=($1/*)

        for i in $local
            # recursively load local files
            do [[ -d $1 ]] && load_local $i || source $i
        done
    }
}

load_common

load_local "$HOME/.shell/local"
