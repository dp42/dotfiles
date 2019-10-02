function warp
  z -l | sed 's/^[^/]*//' | fzf | read dest

  if [ $dest ]
    cd $dest
  else
    commandline ''
  end
end
