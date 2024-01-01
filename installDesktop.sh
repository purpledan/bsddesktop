#!/bin/sh

# This script clones the freeBSD branches of my suckless repos, it also installs some other desktop tools

# Install sound system from OpenBSD
pkg install sndio
sysrc sndiod_enable="YES"

# Install fonts used
pkg install intel-one-mono font-awesome b612
