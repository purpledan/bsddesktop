#!/bin/sh

#This script installs all the daily use tools on the system
# Doas is for root privilages
pkg install sudo
visudo
# The usual things you need
pkg install vim htop neofetch
