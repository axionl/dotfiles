# Defined in - @ line 4
set DIR_PATH "$HOME/Documents/"

function cddoc --description 'alias cd $DIR_PATH'
    if test -d "$DIR_PATH$argv"
        cd "$DIR_PATH$argv"
    else
        set_color red -o; echo "Dir doesn't exists!"
    end
end

complete -x -c cddoc -a "(ls $DIR_PATH | cut -f1)"
