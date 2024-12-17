{ pkgs, config, ... }: {
  programs.tmux = {
    enable = true;
    clock24 = true;
    
    extraConfig = ''
      # Set default terminal
      set -g default-terminal "screen-256color"

      # Enable mouse support
      set -g mouse on

      # Set history limit
      set -g history-limit 5000

      # Better status bar
      set -g status-style bg=colour235,fg=colour136

      # Reload tmux config
      bind r source-file ~/.tmux.conf \; display-message "Config reloaded"

      # Default pane splitting
      bind | split-window -h
      bind - split-window -v
      unbind '"'

      # Shortcuts for switching panes
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Set a default shell (e.g., Nushell)
      set-option -g default-shell "${pkgs.nushell}/bin/nu"

      # Customize status bar
      set -g status-right "#(whoami) | #(date +'%Y-%m-%d %H:%M:%S')"

      set -sg escape-time 0
    '';
  };
}

