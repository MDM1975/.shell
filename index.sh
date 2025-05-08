# load common files
function load_common () {
    local COMMON=("${HOME}"/.shell/common/*)

    for i in "${COMMON[@]}"; do
        source "${i}"
    done
}

# load local files
function load_local () {
    if [[ -d $1 ]]; then
        local LOCAL=("$1"/*)

        for i in "${LOCAL[@]}"; do
            if [[ -d $1 ]]; then
                load_local "${i}"
            else
                source "${i}"
            fi
        done
    else
        source "$1"
    fi
}

load_common
load_local "$HOME/.shell/local"
