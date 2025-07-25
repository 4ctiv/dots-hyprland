function list-net-ipv4 --description "Scan local IPv4 network for open ports"
    set -l ip_address (ip --color=never -4 addr list | awk '/inet.*brd/ {print $2}' | head -1 | cut -d'/' -f1)
    if [ -z "$ip_address" ]
        echo "Could not determine local IP address."
        return 1
    end
    nmap "$ip_address" -F --open -oG - | cut -d ' ' -f 2-3 | grep Ports: | sed 's/Ports://g'
end
