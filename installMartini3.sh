#! /bin/bash

I3_CONFIG_DIR=~/.config/i3
OLD_I3_CONFIG_DIR=~/.config/i3_old$$
FONTS_REG=fonts/fa-regular-400.ttf
FONTS_SOLID=fonts/fa-solid-900.ttf
FONTS_BRANDS=fonts/fa-brands-400.ttf
FONTS_DIR=~/.fonts

check_install(){
   
   if ! [ -x "$(command -v feh )" ]; then
         echo "Failed to install package feh"
  	 echo "Closing program now"
  	 exit 1
   fi

   if ! [ -x "$(command -v compton )" ]; then
   	 echo "Failed to install package compton"
   	 echo "Closing program now"
   	 exit 1

   fi

   if ! [ -x "$(command -v rofi )" ]; then
  	 echo "Failed to install package feh"
         echo "Closing program now"
   	 exit 1
   fi
}

move_old_i3(){
	mkdir "$old_i3_config_dir"
        mv "$i3_config_dir" "$old_i3_config_dir"
}

yes_no(){
    read -p "do you want to continue[y/n]? " reply
    #reply=${reply:0:1};
    case $reply in
      y*|y*|'') return 0 ;;
      n*|n*) exit 1;;
        * ) echo "abort" ;exit 1;
     esac
}

echo ""
echo "this program will make changes to your i3 config folder"
echo "your old config folder can be found at $old_i3_config_dir"
echo ""
echo ""

yes_no


echo ""
echo "::Installing appropriate packages"
echo ""

#run the install script to the packages
./installPackages.sh

#check if package feh was successfully installed"
check_install

#check for i3 config file
if [ -d "$I3_CONFIG_DIR" ] || [ -f "$I3_CONFID_DIR" ]; then
	move_old_i3	
     
fi
mkdir "$I3_CONFIG_DIR"
mkdir "$I3_CONFIG_DIR"/images
cp -r i3/config "$I3_CONFIG_DIR"
cp -r i3/images "$I3_CONFIG_DIR"

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

