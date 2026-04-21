#!/bin/bash

set -e

REPO_URL='https://github.com/brunialan/fancy_tools.git'
SRC_DIR=~/src/fancy_tools

# Ajoute une ligne dans .bashrc si absente
add_if_missing() {
    grep -qF "$1" ~/.bashrc || echo "$1" >> ~/.bashrc
}

# Sauvegarde .bashrc
cp ~/.bashrc ~/.bashrc.bak.$(date +%F-%H%M%S)

# Crée ~/src si absent
mkdir -p ~/src

# Clone le dépôt si absent
if [ ! -d "$SRC_DIR" ]; then
    git clone $REPO_URL $SRC_DIR
fi

# Ajouter configurations sans doublon
add_if_missing "source $(pwd)/.aliases"
add_if_missing "source $(pwd)/fancy_functions.sh"
add_if_missing 'export PATH=$HOME/bin:$PATH'

# Créer ~/bin si absent
mkdir -p ~/bin

echo "Installation terminée."
