

#1 - file, 2 - string to add
function add_if_missing {
    STR=`cat $1 | grep $2`
    if [ -z "$STR" ]; then
        echo "$2" >> $1
    fi

}


VIM_CONF="/etc/vim/vimrc"
add_if_missing $VIM_CONF "set expandtab"
add_if_missing $VIM_CONF "set tabstop=4"
add_if_missing $VIM_CONF "set shiftwidth=4"
add_if_missing $VIM_CONF "set number"


