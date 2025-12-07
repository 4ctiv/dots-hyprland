function grub-install-efi-tpm --wraps="sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --modules='tpm' --disable-shim-lock" --description "alias grub-install-efi-tpm=sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --modules='tpm' --disable-shim-lock"
    sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --modules='tpm' --disable-shim-lock $argv
end
