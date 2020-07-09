set -x LANG ja_JP.UTF-8
set -x LC_ALL ja_JP.UTF-8

status --is-interactive; and source (rbenv init -|psub)
status --is-interactive; and source (anyenv init -|psub)
source $HOME/.phpbrew/phpbrew.fish
set -gx PATH $HOME/.composer/vendor/bin $PATH
set -gx PATH $HOME/.phpbrew/bin $PATH
