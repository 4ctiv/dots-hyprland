function cleanup-tmp --description 'alias to cleanup linux temporary files (native,snap,flatpak)'
  set temporary_folders "/tmp" "/var/tmp" "$HOME/.cache" "$HOME/.davfs2/cache"

  for tmp_dir in $temporary_folders
    string replace -r '^~/' "$HOME/" -- $tmp_dir # fix absoulute path

    if test -d "$tmp_dir"
      find "$tmp_dir" -type f -atime +7 -delete 2>/dev/null
      find "$tmp_dir" -type d -atime +7 -delete 2>/dev/null
    end
  end
end

