local SHARED=($HOME/.shell/shared/*)

for i in $SHARED
    do source $i
done

[[ -d "$HOME/.shell/private/" ]] && {
    local PRIVATE=($HOME/.shell/private/)

    for i in $PRIVATE
        do source $i
    done
}
