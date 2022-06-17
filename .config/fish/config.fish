if status is-interactive
    # Commands to run in interactive sessions can go here
end

source /opt/asdf-vm/asdf.fish

fish_add_path /home/tommy/.local/bin
fish_add_path /home/tommy/.cargo/bin

starship init fish | source
