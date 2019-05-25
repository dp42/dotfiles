function fzf_change_repository
  set -l root_dir (ghq root)
  ghq list |fzf --height 40% --reverse|read repository

  if [ $repository ]
    cd $root_dir/$repository
    commandline -f repaint
  else
    commandline ''
  end
end
