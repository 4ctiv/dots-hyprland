function btrfs-balance --wraps='sudo btrfs balance start -dusage=66' --description 'alias btrfs-balance=sudo btrfs balance start -dusage=66'
    sudo btrfs balance start -dusage=66 $argv
end
