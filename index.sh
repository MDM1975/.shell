local SHARED=($HOME/.shell/shared/*)

# load shared files
for i in $SHARED
    do source $i
done

# load private files
[[ -d "$HOME/.shell/private/" ]] && {
    local PRIVATE=($HOME/.shell/private/*)

    for i in $PRIVATE
        do source $i
    done
}
