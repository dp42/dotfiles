function start_tmux
  if ! [ $TMUX ]
    tmux new-session -A -s main
  end
end
