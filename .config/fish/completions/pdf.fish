complete -e -c pdf
complete -c pdf -f -a '(
__fish_complete_directories;
__fish_complete_suffix | grep ".pdf\$";
)'
