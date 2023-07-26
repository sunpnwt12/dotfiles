if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting

function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

function cs
    curl cheat.sh/$argv[1]/$argv[2]
end

alias ls="exa -la --icons"
alias lg="lazygit"
alias nv="nvim"
alias ipy="ipython3" 

starship init fish | source
