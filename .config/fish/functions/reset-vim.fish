function reset-vim --wraps=' cp /etc/skel/.vimrc ~/.vimrc && rm -i ~/.vim && cp /etc/skel/.vim ~/.vim && echo "Restored vim"' --description 'alias reset-vim= cp /etc/skel/.vimrc ~/.vimrc && rm -i ~/.vim && cp /etc/skel/.vim ~/.vim && echo "Restored vim"'
     cp /etc/skel/.vimrc ~/.vimrc && rm -i ~/.vim && cp /etc/skel/.vim ~/.vim && echo "Restored vim" $argv
end
