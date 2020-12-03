function gcp
  git branch -vv\
  | fzf --prompt=Branch:  --height 40% --reverse +m|sed 's/^\*//'\
  | awk '{print $1}'|read branch

  if [ $branch ]
    tig $branch
  else
    commandline ''
  end
end
