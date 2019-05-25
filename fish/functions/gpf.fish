function gpf
  set branch (git rev-parse --abbrev-ref HEAD)

  if [ $branch != 'master' ]
    git push --force origin $branch
  else
    echo 'Force Push to Master is prohibited!'
  end
end
