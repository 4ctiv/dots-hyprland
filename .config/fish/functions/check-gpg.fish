function check-gpg --wraps='gpg2 --keyserver-options auto-key-retrieve --verify' --description 'alias check-gpg=gpg2 --keyserver-options auto-key-retrieve --verify'
    gpg2 --keyserver-options auto-key-retrieve --verify $argv
end
