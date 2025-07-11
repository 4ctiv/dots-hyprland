function web-search --description "search <arg> on the web"
  # This will use below cmd web browser to search specified querrys via cmd.
  set browser 'lynx' # 'browsh'(rendered),'lynx','links'
  
  if not type -q $browser
    echo "[WARN] `$browser` cmd-browser not found, installing via `yay`" 
    yay -S $browser || return 1
  end

  # Fix lynx confirmation for every cookie 
  # (cookies are still not persistent between sessions)
  if $browser -eq "lynx"
    set browser 'lynx -accept_all_cookies'
  end

  set s_querry "https://lite.duckduckgo.com/lite"
  if count $argv > /dev/null
    set -a s_querry "?q="
    for arg in $argv
      set -a s_querry "%20$arg"
    end
    set s_querry $(echo "$s_querry"|sed 's/ //g')
  end
  echo "$s_querry"
  $browser "$s_querry"
end
