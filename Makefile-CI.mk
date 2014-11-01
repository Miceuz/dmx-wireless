### DISCLAIMER
### This is an example Makefile and it MUST be configured to suit your needs.
### For detailled explanations about all the avalaible options,
### please refer to https://github.com/sudar/Arduino-Makefile/blob/master/arduino-mk-vars.md

### PROJECT_DIR
### This is the path to where you have created/cloned your project
PROJECT_DIR       =

### AVR_GCC_VERSION
### Check if the version is equal or higher than 4.9
AVR_GCC_VERSION  := $(shell expr `avr-gcc -dumpversion | cut -f1` \>= 4.9)

### ARDMK_DIR
### Path to the Arduino-Makefile directory.
ARDMK_DIR         = $(PROJECT_DIR)/Arduino-Makefile

### ARDUINO_DIR
### Path to the Arduino application and ressources directory.
ARDUINO_DIR       =

### USER_LIB_PATH
### Path to where the your project's libraries are stored.
USER_LIB_PATH     := $(PROJECT_DIR)/lib

### BOARD_TAG
### It must be set to the board you are currently using. (i.e uno, mega2560, etc.)
BOARD_TAG         = mega2560

### MONITOR_BAUDRATE
### It must be set to Serial baudrate value you are using.
MONITOR_BAUDRATE  = 115200

### AVR_TOOLS_DIR
### Path to the AVR tools directory such as avr-gcc, avr-g++, etc.
AVR_TOOLS_DIR     =

### AVRDDUDE
### Path to avrdude directory.
AVRDDUDE          = /usr/bin/avrdude

### CFLAGS_STD
CFLAGS_STD        = -std=gnu11

### CXXFLAGS_STD
CXXFLAGS_STD      = -std=gnu++11

### CPPFLAGS
### Flags you might want to set for debugging purpose. Comment to stop.
CXXFLAGS         = -pedantic -Wall -Wextra

### If avr-gcc -v is higher than 4.9, activate coloring of the output
ifeq "$(AVR_GCC_VERSION)" "1"
    CXXFLAGS += -fdiagnostics-color
endif

### MONITOR_PORT
### The port your board is connected to. Using an '*' tries all the ports and finds the right one.
MONITOR_PORT      = /dev/tty.usbmodem*

### don't touch this
CURRENT_DIR       = $(shell basename $(CURDIR))

### OBJDIR
### This is were you put the binaries you just compile using 'make'
OBJDIR            = $(PROJECT_DIR)/bin/$(BOARD_TAG)/$(CURRENT_DIR)

### path to Arduino.mk, inside the ARDMK_DIR, don't touch.
include $(ARDMK_DIR)/Arduino.mk
