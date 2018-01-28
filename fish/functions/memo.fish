function memo
  if test -z $argv
    echo "メモのタイトルを入力してください" 1>&2
    return 1
  end

  set -l date (date +%Y-%m-%d-%H%M)
  set -l file $HOME/Notes/{$date}-{$argv[1]}.md

  vim $file
end
