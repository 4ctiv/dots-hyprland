function check-file-package --wraps='pacman -Qo $(which cal)' --description 'alias for a file find related package'
  if test -f "$argv[1]"
    pacman -Qo "$argv[1]"
  else if type -q "$argv[1]"
    pacman -Qo "$(which $argv[1])"
  else
    echo "Unknow file/program $argv[1]"
  end
end
