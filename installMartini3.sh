#! /bin/bash

I3_CONFIG_DIR=~/.config/i3
OLD_I3_CONFIG_DIR=~/.config/i3_old$$
FONTS_REG=fonts/fa-regular-400.ttf
FONTS_SOLID=fonts/fa-solid-900.ttf
FONTS_BRANDS=fonts/fa-brands-400.ttf
FONTS_DIR=~/.fonts


yes_no(){
    read -p "Do you want to continue[Y/n]? " reply
    #reply=${reply:0:1};
    case $reply in
      y*|Y*|'') return 0 ;;
      n*|N*) exit 1;;
        * ) echo "Abort" ;exit 1;
     esac
}

echo ""
echo "This program will make changes to your i3 config folder"
echo "Your old config folder can be found at $OLD_I3_CONFIG_DIR"
echo ""
echo ""

yes_no

#$OLD_CONFIG_DIR

#install the package for wallpaper settings
#pacman -S feh
install() {
     if ! [ -x "$(command -v feh )" ]; then
     	echo >&2 "Package feh is needed for installation!"
     	echo "Installing package feh:";
        pacman -S feh
     fi
}

move_old_i3(){
	mkdir "$OLD_I3_CONFIG_DIR"
        mv "$I3_CONFIG_DIR" "$OLD_I3_CONFIG_DIR"
}

echo ""
echo "Installing appropriate packages"
echo ""

install
#check if package feh was successfully installed"
if ! [ -x "$(command -v feh )" ]; then
   echo "Failed to install package feh"
   echo "Closing program now"
   exit 1
fi

#check for i3 config file
if [ -d "$I3_CONFIG_DIR" ]; then
	move_old_i3	
else
   mkdir $I3_CONFIG_DIR
fi
cp -r ./i3/config "$I3_CONFIG_DIR"
cp -r ./i3/images "$I3_CONFIG_DIR"

#copy font files

echo ""
echo "The following files will be placed into $FONTS_DIR: "
echo "	1) $FONTS_REG"
echo "	2) $FONTS_SOLID"
echo "	3) $FONTS_BRANDS"
echo ""

if ! [ -d "$FONTS_DIR" ];then
    mkdir "$FONTS_DIR"
fi 
cp "$FONTS_REG"   "$FONTS_DIR" 
cp "$FONTS_SOLID" "$FONTS_DIR"
cp "$FONTS_BRANDS" "$FONTS_DIR"



echo "Finished!"
exit 0

