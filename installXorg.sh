#!/bin/sh

#Installs xorg
pkg install xorg
pw groupmod video -m dan

#Installs drm-kmod
pkg install drm-kmod


