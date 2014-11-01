#!/usr/bin/env bash

# INSTRUCTIONS: copy and past the following inside your drone.io project setting.

# Environnement variables - must be copied in the reserved space
# CWD=/home/ubuntu/src/github.com/WeAreLeka/Bare-Arduino-Project
# SRC=/home/ubuntu/src/github.com/WeAreLeka/Bare-Arduino-Project/src
# TEST=/home/ubuntu/src/github.com/WeAreLeka/Bare-Arduino-Project/test
# ARDMK=/home/ubuntu/src/github.com/WeAreLeka/Bare-Arduino-Project/Arduino-Makefile

CWD=pwd
SRC=$CWD/src
TEST=$CWD/test
ARDMK=$CWD/Arduino-Makefile

SUDO_CMD=
if command -v sudo >/dev/null 2>&1; then
	SUDO_CMD="sudo -E"
fi

# Commands - must be copied in the reserved space
echo "Install avr-gcc..."
wget --quiet  http://downloads.arduino.cc/arduino-1.5.7-linux32.tgz
tar -xf arduino-1.5.7-linux32.tgz
$SUDO_CMD mv arduino-1.5.7/hardware/tools/avr /usr/local/share/avr-gcc

echo "Install Arduino IDE..."
wget --quiet  http://arduino.googlecode.com/files/arduino-1.0.5-linux32.tgz
tar -xf arduino-1.0.5-linux32.tgz
$SUDO_CMD mv arduino-1.0.5/ /usr/local/share/arduino

echo "Cloning Arduino-Makefie and activate auto-lib..."
git submodule init && git submodule update
cd $ARDMK
git checkout auto-lib

echo "Test all sources..."
cd $SRC
for dir in *; do
	if [ -d "${dir}" ]; then
		cd $dir
		cp $CWD/Makefile-Drone.mk Makefile
		make
		echo "Building ${dir} passed with success!"
		cd ..
	fi
done

