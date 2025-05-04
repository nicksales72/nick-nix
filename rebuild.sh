#!/usr/bin/env bash

set -euo pipefail

NIX_PATH="/home/kafka/nixos"
SYNC_PATH="/home/kafka/Projects/nick-nix"

if home-manager switch --flake "$NIX_PATH"; then
    if sudo nixos-rebuild switch --flake "$NIX_PATH"; then 
        echo "Running nix flake update in $NIX_PATH..."
        nix flake update --flake "$NIX_PATH"
        
        cd "$SYNC_PATH"
        sudo cp -rf "$NIX_PATH"/* .

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
