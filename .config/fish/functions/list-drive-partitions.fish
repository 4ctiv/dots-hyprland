function list-drive-partitions --wraps='lsblk -o name,label,fstype,fsuse%,RO,HOTPLUG -e7' --description 'alias list-drive-partitions=lsblk -o name,label,fstype,fsuse%,RO,HOTPLUG -e7'
    lsblk -o name,label,fstype,fsuse%,RO,HOTPLUG -e7 $argv
end
