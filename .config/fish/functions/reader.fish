function reader --description "search <arg> on the web"
  # This will use the below specified reader to open a file as textfile
  set READER frogmouth

  if not type -q $READER
    echo "[WARN] `$READER` not found, installing via `yay`"
    yay -S $READER || return 1
  end

 $READER $argv
end
