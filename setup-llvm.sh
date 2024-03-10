#!/bin/bash

if [ -z "$1" ]; then
    echo "Enter llvm version number"
    exit 1
fi

# step 1: download llvm installation script
sudo apt update
wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh

# step 2: install llvm with preferred version
sudo ./llvm.sh $1

# step 3: set clang version as the default compiler
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-$1 100
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-$1 100

# step 4: remove llvm.sh script
rm llvm.sh
