function list-btrfs-filesystem --wraps='sudo btrfs filesystem df /' --description 'alias list-btrfs-filesystem=sudo btrfs filesystem df /'
    sudo btrfs filesystem df / $argv
end
