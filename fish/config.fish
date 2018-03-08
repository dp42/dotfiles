set -gx SHELL /usr/local/bin/fish
set -gx EDITOR vim

# Set paths
rbenv init - | source
set -gx GOPATH $HOME/Dev
set -gx PATH $HOME/bin $PATH
set -gx PATH $GOPATH/bin $PATH
set -gx PATH $HOME/.nodebrew/current/bin $PATH
set -gx PATH $HOME/.composer/vendor/bin $PATH
set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set -gx MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH

alias diary='vim ~/Diary/(date +%Y/diary-%Y-%m-%d.md)'

function fish_user_key_bindings
    bind \cs peco_change_repository
    bind \cr peco_history
end
