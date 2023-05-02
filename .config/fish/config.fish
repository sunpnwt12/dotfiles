if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting

alias ls="exa -la"
alias lg="lazygit"
alias nv="nvim"
alias ipy="ipython3" 

starship init fish | source
