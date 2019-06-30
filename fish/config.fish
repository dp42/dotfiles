set -gx SHELL /usr/local/bin/fish
set -gx EDITOR vim
set -x LANG ja_JP.UTF-8
set -x LC_ALL ja_JP.UTF-8

# PATH
rbenv init - | source
source $HOME/.phpbrew/phpbrew.fish
set -gx GOPATH $HOME
set -gx PATH $HOME/bin $PATH
set -gx PATH $HOME/.nodebrew/current/bin $PATH
set -gx PATH $HOME/.composer/vendor/bin $PATH
set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set -gx PATH /usr/local/opt/python/libexec/bin $PATH
set -gx PATH /usr/local/opt/llvm/bin $PATH
set -gx PATH $HOME/.cargo/bin  $PATH
set -gx PATH /usr/local/opt/mysql@5.7/bin $PATH
set -gx MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH
set -gx FZF_DEFAULT_COMMAND 'pt -g= --hidden --ignore=.git'
set -gx BAT_CONFIG_PATH $HOME/.config/bat/bat.conf
set -g theme_display_date no
set -g theme_nerd_fonts yes
set -g theme_display_cmd_duration no

#Alias
alias gpl='git pull origin (git rev-parse --abbrev-ref HEAD)'
alias gps='git push origin (git rev-parse --abbrev-ref HEAD)'

# bobthefish
set -g theme_display_git_master_branch yes

# powerline
set fish_function_path $fish_function_path "/usr/local/lib/python3.7/site-packages/powerline/bindings/fish"
powerline-setup


function fish_user_key_bindings
    bind \cs fzf_change_repository
    bind \cr fzf_history
end

eval (direnv hook fish)
start_tmux
