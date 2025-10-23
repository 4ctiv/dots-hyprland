function list-packs-repo
  switch (count $argv):
    case 0
      pacman -Sl | grep --color=always '\[installed\]'
    case 1
      pacman -Sl $argv[1] | grep --color=always '\[installed\]'
    case '*'
      pacman -Sl $argv[1] | grep --color=always '\[installed\]' | grep $argv[2..-1]
end


