function fix-gpg-database --wraps='gpg2 --keyserver-options auto-key-retrieve --receive-keys' --description 'alias fix-gpg-database=gpg2 --keyserver-options auto-key-retrieve --receive-keys'
    gpg2 --keyserver-options auto-key-retrieve --receive-keys $argv
end
