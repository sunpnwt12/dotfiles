#! /bin/bash

home=$HOME

sl = ("neovim" "glow" "glamour" "tmux" "fish" "starship" "lazygit")

for pkg in $sl; do
    stow -t $home $pkg
done
