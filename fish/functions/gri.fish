function gri
  git log --color=always --date=iso --no-merges --pretty=format:'%C(yellow)%h %C(blue)%ad %C(reset)%s %C(cyan)%an'\
  | fzf --ansi --prompt Rebase: --height 40% --reverse +m|awk '{print $1}'\
  | read commit_id

  if [ $commit_id ]
    git rebase -i {$commit_id}~
  else
    commandline ''
  end
end
