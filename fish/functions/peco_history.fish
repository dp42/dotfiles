function peco_history
  history|peco $peco_flags|read selected_command

  if [ $selected_command ]
    commandline $selected_command
  else
    commandline ''
  end
end
