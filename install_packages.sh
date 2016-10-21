#!/bin/bash
function install_package {
    echo "Do you want to install?(y/n)" "$1"
    read INSTALL_ANSWER
    if [ "$INSTALL_ANSWER" == "y" ]; then
        sudo apt-get install $1
    fi
}

function add_repository {
    echo "Do you want to add $1 repository?(y/n)"

    read INSTALL_ANSWER
    if [ "$INSTALL_ANSWER" == "y" ]; then
        sudo add-apt-repository $1
    fi
}

function clone_repository {
    echo "Do you want to clone $1 repository?(y/n)"

    read INSTALL_ANSWER
    if [ "$INSTALL_ANSWER" == "y" ]; then
        git clone $1 ~/
    fi
}

function map_function {
    for i in "${@:2}"
    do
        $1 $i
    done
}


repositories=(ppa:webupd8team/atom )
map_function add_repository ${repositories[@]}


packages=(vim terminator python atom git meld ecplise firefox gcc g++ mc subversion kdesvn )
map_function install_package ${packages[@]}


git_repositories=("https://github.com/Valloric/YouCompleteMe.git" )
map_function clone_repository ${git_repositories[@]}



sudo apt-get update

sudo apt-get upgrade

