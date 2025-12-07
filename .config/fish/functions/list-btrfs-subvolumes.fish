function list-btrfs-subvolumes --wraps='sudo btrfs su li -t /' --description 'alias list-btrfs-subvolumes=sudo btrfs su li -t /'
    sudo btrfs su li -t / $argv
end
