function web-search --description "search <arg> on the web"
  # This will use `links` web browser to search specified querrys via cmd.

  if not type -q links
    echo "[WARN] `links` cmd-browser not found, installing via `yay`" 
    yay -S links
  end

  set s_querry "https://duckduckgo.com/"
  if count $argv > /dev/null
    set -a s_querry "?q="
    for arg in $argv
      set -a s_querry "%20$arg"
    end
    set s_querry $(echo "$s_querry"|sed 's/ //g')
  end
  echo "$s_querry"
  links "$s_querry"
end