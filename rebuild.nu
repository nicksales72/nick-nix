#!/usr/bin/env nu

def main [] {
    let home_manager_result = (do { 
        home-manager switch --flake /home/nick/.dotfiles/nixos 
    } | complete)

    if $home_manager_result.exit_code == 0 {
        let nixos_rebuild_result = (do { 
            sudo nixos-rebuild switch --flake /home/nick/.dotfiles/nixos 
        } | complete)

        if $nixos_rebuild_result.exit_code == 0 {
            cd /home/nick/Programming/nick-nix

            sudo cp -rf /home/nick/.dotfiles/nixos/* .

            let current_date = (date now | format date "%Y-%m-%d")

            git add .
            git commit -m $"Updated ($current_date)"
            git push

            echo "Dotfiles update and sync completed successfully!"
        } else {
            echo "NixOS rebuild failed. Stopping process."
            echo $"Error output: ($nixos_rebuild_result.stderr)"
        }
    } else {
        echo "Home-manager switch failed. Stopping process."
        echo $"Error output: ($home_manager_result.stderr)"
    }
}
