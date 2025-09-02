#!/usr/bin/env nu

def main [] {
    let nixos_flake = "/home/nick/nixos"
    let projects_dir = "/home/nick/Projects/nick-nix"

    home-manager switch --flake $nixos_flake
    if $env.LAST_EXIT_CODE != 0 {
        echo $"Home-manager switch failed (exit ($env.LAST_EXIT_CODE)). Stopping."
        return $env.LAST_EXIT_CODE
    }

    sudo nixos-rebuild switch --flake $nixos_flake
    if $env.LAST_EXIT_CODE != 0 {
        echo $"NixOS rebuild failed (exit ($env.LAST_EXIT_CODE)). Stopping."
        return $env.LAST_EXIT_CODE
    }

    cd $projects_dir

    sudo cp -rf $"($nixos_flake)/." .

    let current_date = (date now | format date "%Y-%m-%d")

    git add .

    if ((git status --porcelain | lines | length) > 0) {
        git commit -m $"Updated ($current_date)"
        if $env.LAST_EXIT_CODE != 0 { 
            echo $"git commit failed (exit ($env.LAST_EXIT_CODE))."
            return $env.LAST_EXIT_CODE
        }
        git push
        if $env.LAST_EXIT_CODE != 0 { 
            echo $"git push failed (exit ($env.LAST_EXIT_CODE))."
            return $env.LAST_EXIT_CODE
        }
        echo "Dotfiles update and sync completed successfully!"
    } else {
        echo "No changes to commit. Done."
    }
}
