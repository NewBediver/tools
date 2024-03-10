#!/bin/bash

# step 1: install gdb
sudo apt update
sudo apt install gdb

# step 2: copy file from submodule
rm ~/.gdbinit
cp gdb-dashboard/.gdbinit ~/
