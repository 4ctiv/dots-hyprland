function reset-bash --wraps='cp /etc/skel/.bashrc                  ~/.bashrc                          && echo "Restored bash"' --description 'alias reset-bash=cp /etc/skel/.bashrc                  ~/.bashrc                          && echo "Restored bash"'
    cp /etc/skel/.bashrc                  ~/.bashrc                          && echo "Restored bash" $argv
end
