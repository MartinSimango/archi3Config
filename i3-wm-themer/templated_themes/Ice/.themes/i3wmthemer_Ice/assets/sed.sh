#!/bin/sh
sed -i \
         -e 's/#1e1e20/rgb(0%,0%,0%)/g' \
         -e 's/#c5c8c6/rgb(100%,100%,100%)/g' \
    -e 's/#1e1e20/rgb(50%,0%,0%)/g' \
     -e 's/#6d726e/rgb(0%,50%,0%)/g' \
     -e 's/#1e1e20/rgb(50%,0%,50%)/g' \
     -e 's/#c5c8c6/rgb(0%,0%,50%)/g' \
	*.svg
