function list-grub-entries --wraps='sudo awk -F \\\' \'=="menuentry " || =="submenu " {print i++ "     : " }; /\\smenuentry / {print "\\t" i-1">"j++ " : " };\' /boot/grub/grub.cfg' --description 'alias list-grub-entries=sudo awk -F \\\' \'=="menuentry " || =="submenu " {print i++ "     : " }; /\\smenuentry / {print "\\t" i-1">"j++ " : " };\' /boot/grub/grub.cfg'
    sudo awk -F \' '=="menuentry " || =="submenu " {print i++ "     : " }; /\smenuentry / {print "\t" i-1">"j++ " : " };' /boot/grub/grub.cfg $argv
end
