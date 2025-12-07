function cp-recursiv --wraps='rsync -ah --no-inc-recursive --info=progress2' --description 'alias cp-recursiv=rsync -ah --no-inc-recursive --info=progress2'
    rsync -ah --no-inc-recursive --info=progress2 $argv
end
