function list-drive-ids --wraps='lsblk -io KNAME,TYPE,SIZE,MODEL,LABEL | awk \'$2 != "loop" { print }\'' --description 'alias list-drive-ids=lsblk -io KNAME,TYPE,SIZE,MODEL,LABEL | awk \'$2 != "loop" { print }\''
    lsblk -io KNAME,TYPE,SIZE,MODEL,LABEL | awk '$2 != "loop" { print }' $argv
end
