function list-file-mime
    if test (count $argv) -ne 1
        echo "Usage: list-file-mime FILENAME"
        return 1
    end

    if not test -f "$argv[1]"
        echo "Error: '$argv[1]' is not a regular file"
        return 1
    end

    file --mime-type "$argv[1]" | sed 's/.*://' 
end
