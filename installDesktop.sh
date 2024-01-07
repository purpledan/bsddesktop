#!/bin/sh

# This script clones the freeBSD branches of my suckless repos, it also installs some other desktop tools

# Install sound system from OpenBSD
pkg install sndio
sysrc sndiod_enable="YES"

# Install fonts used
pkg install intel-one-mono b612 harfbuzz

# This pulls in the Go-Mono font from nerd-fonts
# TODO: Should be updated to pull in intel-one-mono once it is patched
mkdir -p /usr/local/share/fonts/nerd-fonts/Go-Mono
cd /usr/local/share/fonts/nerd-fonts/Go-Mono
curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/Go-Mono/Regular/GoMonoNerdFont-Regular.ttf

#TODO: Automate activation of true type fonts in Xorg

