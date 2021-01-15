function gsw -d 'switch or create git branch'
  if [ $argv ]
    git switch -c $argv
    return
  end

  git branch -vv\
  | fzf --prompt=Branch:  --height 40% --reverse +m|sed 's/^\*//'\
  | awk '{print $1}'|read branch

  if [ $branch ]
    git switch $branch
  else
    commandline ''
  end
end
