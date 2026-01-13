function list-drive-size --wraps='df -h' --description 'alias list-drive-size=df -h'
   df -h -l -x tmpfs -x tmpfs -x devtmpfs -x efivarfs $argv
end
