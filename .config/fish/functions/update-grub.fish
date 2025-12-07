function update-grub --wraps='sudo grub-mkconfig -o /boot/grub/grub.cfg' --description 'alias update-grub=sudo grub-mkconfig -o /boot/grub/grub.cfg'
    sudo grub-mkconfig -o /boot/grub/grub.cfg $argv
end
