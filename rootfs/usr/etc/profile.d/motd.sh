#!/bin/bash

if [ -n "$PS1" ]; then
    if [ -f ~/.local/share/.motdcheck ]; then
        :
    else
        glow /usr/share/celestite/firstboot/celestite.md
        touch ~/.local/share/.motdcheck
    fi
fi
