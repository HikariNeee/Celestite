#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#fffaf3/g' \
         -e 's/rgb(100%,100%,100%)/#555169/g' \
    -e 's/rgb(50%,0%,0%)/#faf4ed/g' \
     -e 's/rgb(0%,50%,0%)/#907aa9/g' \
 -e 's/rgb(0%,50.196078%,0%)/#907aa9/g' \
     -e 's/rgb(50%,0%,50%)/#f2e9de/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#f2e9de/g' \
     -e 's/rgb(0%,0%,50%)/#26233a/g' \
	"$@"
