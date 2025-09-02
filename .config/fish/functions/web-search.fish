function web-search --description "search <arg> on the web"
  # This will use below cmd web browser to search specified querrys via cmd.
  set browser 'lynx' # 'browsh'(rendered),'lynx','links'
  
  if not type -q $browser
    echo "[WARN] `$browser` cmd-browser not found, installing via `yay`" 
    yay -S $browser || return 1
  end

  # Lynx auto accept all cookies (still non persistent)
  if string match "$browser" "lynx" >/dev/null
    set browser 'lynx -accept_all_cookies'
  end

  # Set base url
  set s_querry "https://lite.duckduckgo.com/lite"
  if string match --regex '^[a-zA-Z0-9]+://' "$argv[1]" >/dev/null
    set s_querry "$argv[1]"
    set argv $argv[2..-1]
  end

  # Set search args
  if count $argv > /dev/null
    set -a s_querry "?q="
    for arg in $argv
      set -a s_querry (string escape --style=url " $arg")
    end
    set s_querry $(echo "$s_querry" | sed 's/ //g')
  end
  echo "$browser $s_querry"
  eval "$browser $s_querry"
end
