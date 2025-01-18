#!/bin/bash

set -euo pipefail

DOTFILES_PATH="/home/nick/.dotfiles/nixos"
SYNC_PATH="/home/nick/Programming/nick-nix"

if home-manager switch --flake "$DOTFILES_PATH"; then
    if sudo nixos-rebuild switch --flake "$DOTFILES_PATH"; then
        cd "$SYNC_PATH"
        sudo cp -rf "$DOTFILES_PATH"/* .

        CURRENT_DATE=$(date "+%Y-%m-%d")
        git add .
        git commit -m "Updated ($CURRENT_DATE)"
        git push

        echo "Dotfiles update and sync completed successfully!"
    else
        echo "NixOS rebuild failed. Stopping process."
        exit 1
    fi
else
    echo "Home-manager switch failed. Stopping process."
    exit 1
fi
