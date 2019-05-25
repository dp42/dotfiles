function fzf_history
  history|fzf --height 40% --reverse|read selected_command

  if [ $selected_command ]
    commandline $selected_command
  else
    commandline ''
  end
end
