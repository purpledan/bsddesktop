#!/bin/sh

# This script clones the freeBSD branches of my suckless repos, it also installs some other desktop tools

# Vars
name="dan"
dwmrepo="https://github.com/purpledan/dwm"
strepo="https://github.com/purpledan/st"
dmenurepo="https://github.com/purpledan/dmenu"
slstatusrepo="https://github.com/purpledan/slstatus"
REPODIR="/home/$name/REPOSTEST"

# Funcs
installSuckless() {
	cd $REPODIR/dwm
	echo "Installing dwm"
	sudo make install
	cd $REPODIR/st
	echo "Installing st"
	sudo make install
	cd $REPODIR/slstatus
	echo "Installing slstatus"
	sudo make install
	cd $REPODIR/dmenu
	echo "Installing dmenu"
	sudo make install
	echo "Done installing"
}

# Get repos, assuming clean REPO folder
if [ ! -d "$REPODIR" ]; then
	echo "${REPODIR} doesn't exist, creating..."
	mkdir -p "$REPODIR"
fi

cd $REPODIR
echo "Cloning suckless desktop in ${REPODIR}"
git clone "$dwmrepo"
git clone "$strepo"
git clone "$dmenurepo"
git clone "$slstatusrepo"
mkdir $REPODIR/fonts/

# Install sound system from OpenBSD
sudo pkg install sndio
sudo sysrc sndiod_enable="YES"

# Install fonts used
sudo pkg install intel-one-mono b612 harfbuzz

# This pulls in the Go-Mono font from nerd-fonts
# TODO: Should be updated to pull in intel-one-mono once it is patched
sudo mkdir -p /usr/local/share/fonts/nerd-fonts/Go-Mono
cd $REPODIR/fonts
curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/Go-Mono/Regular/GoMonoNerdFont-Regular.ttf
sudo cp GoMonoNerdFont-Regular.ttf /usr/local/share/fonts/nerd-fonts/Go-Mono/GoMonoNerdFont-Regular.ttf

#TODO: Automate activation of true type fonts in Xorg

# Install suckless desktop
while true; do
	read -p "Would you like to install suckless desktop? (y/n) " yn
	case $yn in
		[Yy]* ) installSuckless; break;;
		[Nn]* ) break;;
esac
done

