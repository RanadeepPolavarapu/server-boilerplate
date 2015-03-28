#!/usr/bin/env bash

# --- Initialize SUPERUSER mode ---
# Perform an initial sudo command by taking superuser password as argv at location 1.
# This will allow this shell script to perform operations with sudo without password prompt every time.
echo ${1} | sudo -S ls

sudo apt-get -y update
echo -e "[INFO]: | $(date) | Performed apt-get update."
sudo apt-get -y upgrade
echo -e "[INFO]: $(date) - Performed apt-get upgrade."
