#! /bin/bash


yes_no(){
    read -p "do you want to continue[y/n]? " reply
    #reply=${reply:0:1};
    case $reply in
      y*|y*|'') return 0 ;;
      n*|n*) exit 1;;
        * ) echo "abort";exit 1;
     esac
}

echo "	The following packages are required: "
echo "		1) feh "
echo "		2) compton"
echo "	 	3) rofi"


yes_no

install() {
     if ! [ -x "$(command -v feh )" ]; then
        echo >&2 "package feh is needed for installation!"
        echo "installing package feh:";
        pacman -s feh
     fi

     if ! [ -x "$(command -v compton )" ]; then
        echo >&2 "package feh is needed for installation!"
        echo "installing package feh:";
        pacman -s compton
     fi

     if ! [ -x "$(command -v rofi )" ]; then
        echo >&2 "package feh is needed for installation!"
        echo "installing package feh:";
        pacman -s rofi
     fi	


}

install








