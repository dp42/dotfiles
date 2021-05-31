function warp
  z -l | sed 's/^[^/]*//' | fzf | read dest

  if [ $dest ]
    cd $dest
    commandline -f repaint
  else
    commandline ''
  end
end
