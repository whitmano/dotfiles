#!/bin/bash

# some initial script from http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/ 
# This script creates symlinks from the home directory to any dotfiles located in ~/dotfiles and a backup of the old dotfiles in ~/dotfiles_old

# --- variables ---
dir=~/dotfiles 
olddir=~/dotfiles_old 
files=".gitconfig .virtualenvs .bash_profile .bashrc .vimrc .vim" # list of files/folders to symlink in homedir


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

