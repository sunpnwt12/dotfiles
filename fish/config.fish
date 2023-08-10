if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting

# setup nvm
function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end
set -gx NVM_DIR ~/.nvm
nvm use default --silent

# shortcut for cheat.sh
function cs
    curl cheat.sh/$argv[1]/$argv[2]
end

function mb
    micromamba $argv
end

# alias
alias ls="exa -la --icons"
alias lg="lazygit"
alias nv="nvim"
alias ipy="ipython3" 
# alias mb='mircomamba'
alias tmux="tmux -u"

set -gx BAT_THEME "Catppuccin-mocha"
set -gx EDITOR "nvim"

starship init fish | source
zoxide init fish | source


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
set -gx MAMBA_EXE "/home/sunpnwt/bin/micromamba"
set -gx MAMBA_ROOT_PREFIX "/home/sunpnwt/micromamba"
$MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<
