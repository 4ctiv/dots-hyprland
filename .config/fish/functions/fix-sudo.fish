function fix-sudo --wraps='faillock --reset' --description 'alias fix-sudo=faillock --reset'
    faillock --reset $argv
end
