function cleanup-vm --wraps='virsh undefine --remove-all-storage --delete-snapshots --domain' --description 'alias cleanup-vm=virsh undefine --remove-all-storage --delete-snapshots --domain'
    virsh undefine --remove-all-storage --delete-snapshots --domain $argv
end
