function peco_change_repository
  set -l root_dir (ghq root)
  ghq list | peco --query ""| read repository
  cd $root_dir/$repository
  commandline -f repaint
end
