set -x LANG ja_JP.UTF-8
set -x LC_ALL ja_JP.UTF-8

status --is-interactive; and source (anyenv init -|psub)
set -gx PATH $HOME/.composer/vendor/bin $PATH
