# ENV
set -gx EDITOR vim
set -x FZF_DEFAULT_COMMAND 'rg --files -g !.git/ --hidden'
set -x FZF_DEFAULT_OPTS '--height 30% --reverse'
set -x BAT_CONFIG_PATH $HOME/.config/bat/bat.conf
set -x INTELEPHENSE_PHP_VERSION 8.0.6

# PATH
if ! [ $TMUX ]
  set -gx GOPATH $HOME
  set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
  set -gx PATH /usr/local/opt/findutils/libexec/gnubin $PATH
  set -gx PATH /usr/local/opt/grep/libexec/gnubin $PATH
  set -gx PATH /usr/local/opt/mysql@5.7/bin $PATH
  set -gx PATH $HOME/bin $PATH
  set -gx PATH $HOME/.anyenv/bin $PATH
  set -gx PATH /opt/homebrew/bin $PATH

  status --is-interactive; and source (anyenv init -|psub)
end

if ! [ $SSH_AUTH_SOCK ]
  set -x SSH_AUTH_SOCK (ps -ef -E | grep ssh-agent | awk  'NR==1 && /SSH_AUTH_SOCK/{ print  }' | sed 's/^.*SSH_AUTH_SOCK=\([^ ]*\).*/\1/')
end

# Alias
alias gpull='git pull origin (git rev-parse --abbrev-ref HEAD)'
alias gpush='git push origin (git rev-parse --abbrev-ref HEAD)'

# Color
# set -gx fish_color_normal
set fish_color_command brmagenta
set fish_color_param blue --bold
set fish_color_error red --bold
set fish_color_quote green --bold
set fish_color_redirection yellow
set fish_color_end yellow
set fish_color_comment black --bold

function fish_user_key_bindings
bind \cs fzf_change_repository
bind \cr fzf_history
bind \cw warp
end

eval (starship init fish)
direnv hook fish | source
start_tmux
