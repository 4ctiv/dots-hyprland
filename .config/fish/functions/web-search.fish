function web-search --description "search <arg> on the web"
  # This will use below cmd web browser to search specified querrys via cmd.
  set browser 'lynx' # 'browsh'(rendered),'vimb','lynx','links','surf'

  if not type -q $browser
    echo "[WARN] `$browser` cmd-browser not found, installing via `yay`"
    yay -S $browser || return 1
  end

  switch ($browser)
   #case '[Bb]rowsh'
   #  set browser 'browsh'
    case '[Ll]ynx'
      # Lynx auto accept all cookies (still non persistent)
      set browser 'lynx -accept_all_cookies'
   #case '[Vv]imb'
   #  set browser 'vimb'
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
  eval "$browser $s_querry"
end
