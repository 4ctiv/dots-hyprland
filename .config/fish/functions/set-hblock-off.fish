function set-hblock-off --wraps='hblock -S none -D none' --description 'alias unhblock=hblock -S none -D none'
    hblock -S none -D none $argv
end
