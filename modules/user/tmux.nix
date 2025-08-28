{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    clock24 = true;
    
    extraConfig = ''
      set -g default-terminal "screen-256color"
      set -g default-shell ${pkgs.nushell}/bin/nu
      set -g mouse on
      set -g history-limit 5000
      set -g status-style bg=colour235,fg=colour136
      bind r source-file ~/.tmux.conf \; display-message "Config reloaded"
      bind | split-window -h
      bind - split-window -v
      unbind '"'
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
      set -g status-right "#(whoami) | #(date +'%Y-%m-%d %H:%M:%S')"
      set -sg escape-time 0
    '';
  };
}

