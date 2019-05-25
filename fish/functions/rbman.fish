function rbman
  ri . | tail -n +3 | fzf --preview="ri {} | bat"
end
