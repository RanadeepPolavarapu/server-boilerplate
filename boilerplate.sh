#!/usr/bin/env bash

# --- Terminal Colours Documentation --- START ---
# All colours and text styles are output using `tput`.
# Example:  echo "$(tput setaf 1)Hello, world$(tput sgr0)"

# Foreground & Background Colours:
# tput setab [1-7] # Set the background colour using ANSI escape
# tput setaf [1-7] # Set the foreground colour using ANSI escape

# Available Colours:
# Num  Colour    #define         R G B
# 0    black     COLOR_BLACK     0,0,0
# 1    red       COLOR_RED       1,0,0
# 2    green     COLOR_GREEN     0,1,0
# 3    yellow    COLOR_YELLOW    1,1,0
# 4    blue      COLOR_BLUE      0,0,1
# 5    magenta   COLOR_MAGENTA   1,0,1
# 6    cyan      COLOR_CYAN      0,1,1
# 7    white     COLOR_WHITE     1,1,1

# Text Styling:
# tput bold    # Select bold mode
# tput dim     # Select dim (half-bright) mode
# tput smul    # Enable underline mode
# tput rmul    # Disable underline mode
# tput rev     # Turn on reverse video mode
# tput smso    # Enter standout (bold) mode
# tput rmso    # Exit standout mode

# Reset `tput`:
# tput sgr0    # Reset text format to the terminal's default
# tput bel     # Play a bell
# --- Terminal Colours Documentation --- END ---


# --- Utility Function Definitions --- START ---
function util_log_info {
	formatted_date=`date +"%a, %b %d, %Y - %r %Z"`
	echo -e "$(tput setaf 6)[INFO]: $formatted_date $(tput sgr0)- $1 $(tput sgr0)"
}

function util_log_warn {
	formatted_date=`date +"%a, %b %d, %Y - %r %Z"`
	echo -e "$(tput setaf 3)[WARNING]: $formatted_date $(tput sgr0)- $1 $(tput sgr0)"
}

function util_log_error {
	formatted_date=`date +"%a, %b %d, %Y - %r %Z"`
	echo -e "$(tput setaf 1)[ERROR]: $formatted_date $(tput sgr0)- $1 $(tput sgr0)"
}

function util_log_success {
	formatted_date=`date +"%a, %b %d, %Y - %r %Z"`
	echo -e "$(tput setaf 2)[SUCCESS]: $formatted_date $(tput sgr0)- $1 $(tput sgr0)"
}
# --- Utility Function Definitions --- END ---

# --- Initialize SUPERUSER mode ---
# Perform an initial sudo command by taking superuser password as argv at location 1.
# This will allow this shell script to perform operations with sudo without password prompt every time.
echo ${1} | sudo -S ls 1> /dev/null
util_log_warn "Activated SUPERUSER mode!"

sudo apt-get -y update 1> /dev/null
util_log_info "Performed apt-get update."
sudo apt-get -y upgrade 1> /dev/null
util_log_info "Performed apt-get upgrade."
