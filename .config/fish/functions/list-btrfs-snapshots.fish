function list-btrfs-snapshots --wraps='sudo timeshift --list' --description 'alias list-btrfs-snapshots=sudo timeshift --list'
    sudo timeshift --list $argv
end
