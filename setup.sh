#!/bin/bash

# some initial script from http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/ 
# This script creates symlinks from the home directory to any dotfiles located in ~/dotfiles

# --- variables ---
dir=~/dotfiles # dotfiles directory
olddir=~/dotfiles_old # old dotfiles backup directory
files=".gitconfig .bash_profile .bashrc .vimrc .vim" # list of files/folders to symlink in homedir


# --- script ---

# create dotfiles_old in home directory
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

install_powerline (){
    cd 
    echo "Cloning repo of fonts patched for powerline"
    git clone https://github.com/powerline/fonts.git
    echo "Changing to the fonts directory"
    cd fonts
    echo "...done"
    echo "Installing fonts"
    ./install.sh
    echo "...done"
    echo "Removing visible fonts folder"
    cd ..
    rm -r fonts
    echo"...done"
    echo "Installing powerline-status with pip"
    pip install powerline-status
    echo "...done"
}

install_powerline
