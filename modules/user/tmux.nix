{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    clock24 = true;
    
    extraConfig = ''
      # Set default terminal
      set -g default-terminal "screen-256color"

      # set shell     
      set -g default-shell ${pkgs.nushell}/bin/nu

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

      # Customize status bar
      set -g status-right "#(whoami) | #(date +'%Y-%m-%d %H:%M:%S')"

      # Latency
      set -sg escape-time 0
    '';
  };
}

