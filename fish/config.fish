start_tmux

# ENV
set -gx SHELL /usr/local/bin/fish
set -gx EDITOR vim
set -x LANG ja_JP.UTF-8
set -x LC_ALL ja_JP.UTF-8
set -x FZF_DEFAULT_COMMAND 'rg --files -g !.git/ --hidden'
set -x FZF_DEFAULT_OPTS '--height 30% --reverse'
set -x BAT_CONFIG_PATH $HOME/.config/bat/bat.conf

# PATH
rbenv init - | source
source $HOME/.phpbrew/phpbrew.fish
set -gx GOPATH $HOME
set -gx PATH $HOME/bin $PATH
set -gx PATH $HOME/.nodebrew/current/bin $PATH
set -gx PATH $HOME/.composer/vendor/bin $PATH
set -gx PATH $HOME/.phpbrew/bin $PATH
set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set -gx PATH /usr/local/opt/python/libexec/bin $PATH
set -gx PATH /usr/local/opt/llvm/bin $PATH
set -gx PATH /usr/local/opt/mysql@5.7/bin $PATH
set -gx MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH
set -gx PHPBREW_RC_ENABLE 1

# Alias
alias gpl='git pull origin (git rev-parse --abbrev-ref HEAD)'
alias gps='git push origin (git rev-parse --abbrev-ref HEAD)'

# powerline
set fish_function_path $fish_function_path "/usr/local/lib/python3.7/site-packages/powerline/bindings/fish"
powerline-setup

function fish_user_key_bindings
bind \cs fzf_change_repository
bind \cr fzf_history
end

eval (starship init fish)
direnv hook fish | source
