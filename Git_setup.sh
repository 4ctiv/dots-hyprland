#!/bin/bash

[ -f "$(which git)" ] || pacman -S git

# Change these accordingly
USER="$USER"
MAIL="noreply.$USER@example.de"
PROJECT_FOLDER="$HOME/Projects"

 # Set username for commits
 git config --global user.name "${USER:-A B}"
 git config --global user.email "${MAIL:-noreply.a-b@c.de}"

 # Use keyring storage for https credentials (linux)
 git config --global credential.helper /usr/lib/git-core/git-credential-libsecret

 # Set sane defaults
 git config --global color.ui auto
 git config –global core.editor “code --wait”
#git config --global core.editor "vim" # or 'nano' or 'micro' or 'code --wait'
 git config --global init.defaultBranch "main"
 git config --global core.filemode false # ignore files "chmod" ↔ permissions

#git config --global pull.ff true          # integrate changes with remote state
 git config --global pull.rebase true # replay changes on top of remote state

# Windows enable ssh agent
# git config --global core.sshCommand C:/Windows/System32/OpenSSH/ssh.exe

# Set trusted folder for own projects
git config --global --add safe.directory "${PROJECTS_FOLDER}"

# User-edit global git config
 git config -e --global

exit 0
