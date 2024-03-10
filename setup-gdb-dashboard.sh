#!/bin/bash

# step 1: install gdb
sudo apt update
sudo apt install gdb

# step 2: copy file from submodule
cp gdb-dashboard/.gdbinit ~/
