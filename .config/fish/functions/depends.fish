function function_depends
    search=$(echo "$1"); 
    sudo pacman -Sii $search | grep "Required" | sed -e "s/Required By     : //g" | sed -e "s/  /\n/g";
end
