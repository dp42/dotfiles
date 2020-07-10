# ENV
set -gx SHELL (which fish)
set -gx EDITOR vim
set -x FZF_DEFAULT_COMMAND 'rg --files -g !.git/ --hidden'
set -x FZF_DEFAULT_OPTS '--height 30% --reverse'
set -x BAT_CONFIG_PATH $HOME/.config/bat/bat.conf

# PATH
set -gx GOPATH $HOME
set -gx PATH $HOME/bin $PATH
set -gx PATH $HOME/.anyenv/bin $PATH
status --is-interactive; and source (anyenv init -|psub)
# Alias
alias gpl='git pull origin (git rev-parse --abbrev-ref HEAD)'
alias gps='git push origin (git rev-parse --abbrev-ref HEAD)'

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
end

eval (starship init fish)
direnv hook fish | source

if [ $TMUX ]
  tmux set status 2
  tmux set status-format[1] (tmux show-options -gqv status-format[0] | sed 's/:window-status-current-format//g' | sed 's/:window-status-format//g')
  tmux set status-format[0] (tmux show-options -gqv status-format[0] | sed 's/:status-right//g' | sed 's/:status-left//g')
end
