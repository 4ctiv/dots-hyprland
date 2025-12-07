function list-drive-mounts --wraps="df -h | grep -E --color=never '/dev/[^(loop|dm\\-0)]|//'" --description "alias list-drive-mounts=df -h | grep -E --color=never '/dev/[^(loop|dm\\-0)]|//'"
    df -h | grep -E --color=never '/dev/[^(loop|dm\-0)]|//' $argv
end
