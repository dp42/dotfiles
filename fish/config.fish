set -gx SHELL /usr/local/bin/fish
set -gx EDITOR vim
set -x LANG ja_JP.UTF-8
set -x LC_ALL ja_JP.UTF-8

# Set paths
rbenv init - | source
set -gx GOPATH $HOME/Dev
set -gx PATH $HOME/bin $PATH
set -gx PATH $GOPATH/bin $PATH
set -gx PATH $HOME/.nodebrew/current/bin $PATH
set -gx PATH $HOME/.composer/vendor/bin $PATH
set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set -gx PATH /usr/local/opt/python/libexec/bin $PATH
set -gx PATH /usr/local/opt/llvm/bin $PATH
set -gx PATH $HOME/.cargo/bin  $PATH
set -gx MANPATH /usr/local/opt/coreutils/libexec/gnuman: $MANPATH

# bobthefish
set -g theme_display_git_master_branch yes

set fish_function_path $fish_function_path "/usr/local/lib/python3.7/site-packages/powerline/bindings/fish"
powerline-setup

alias diary='vim ~/Diary/(date +%Y/diary-%Y-%m-%d.md)'

function fish_user_key_bindings
    bind \cs peco_change_repository
    bind \cr peco_history
end
