function list-file-mime --wraps='file --mime-type' --description 'alias list-file-mime=file --mime-type'
    file --mime-type $argv
end
