function btrfs-compress --wraps='sudo btrfs filesystem defragment -r -v -czstd' --description 'alias btrfs-compress=sudo btrfs filesystem defragment -r -v -czstd'
    sudo btrfs filesystem defragment -r -v -czstd $argv
end
