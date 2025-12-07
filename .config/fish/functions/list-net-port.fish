function list-net-port --wraps='netstat -tunlp | sort -t: -k4 -n | grep LISTEN' --description 'alias list-net-port=netstat -tunlp | sort -t: -k4 -n | grep LISTEN'
    netstat -tunlp | sort -t: -k4 -n | grep LISTEN $argv
end
