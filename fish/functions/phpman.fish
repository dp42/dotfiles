function phpman
  set -l manpath $HOME/Documents/phpmanual/
  cat ~/phpmanindex.txt | fzf --preview="w3m (echo $manpath{}.html | sed -e 's/ /./g' -e 's/_/-/g') | bat -l php --color=always"
end
