function cleanup-docker --wraps='docker system prune -a --volumes -f' --description 'alias cleanup-docker=docker system prune -a --volumes -f'
    docker system prune -a --volumes -f $argv
end
