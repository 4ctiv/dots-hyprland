function check-file-hex-ascii --wraps='hexdump -C' --description 'alias file-hex-ascii=hexdump -C'
    hexdump -C $argv
end
