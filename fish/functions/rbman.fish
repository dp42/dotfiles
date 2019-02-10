function rbman
  cat ~/rbmanindex.txt | fzf --preview="refe {} | bat -l ruby --color=always"
end
