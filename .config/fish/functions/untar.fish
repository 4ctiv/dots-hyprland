function untar --wraps='tar -xf' --description 'alias untar=tar -xf'
    set flags "-vxf"
    if string match -- "*.tar.gz" "$argv[1]" or string match -- "*.tgz" "$argv[1]"
      set flags (string join "" $flags "z")
    end

    tar $flags $argv
end
