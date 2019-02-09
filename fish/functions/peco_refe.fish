function peco_refe
  cat ~/ruby_dict.txt | peco | read index
  if [ $index ]
    refe $index | bat -l ruby
  end
end
