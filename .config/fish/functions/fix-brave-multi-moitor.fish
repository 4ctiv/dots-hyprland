function fix-brave-multi-moitor --wraps="sudo sed -i 's/brave %U/brave -disable-features=WaylandWpColorManagerV1 %U/g' /usr/share/applications/brave-browser.desktop" --description "alias fix-brave-multi-moitor=sudo sed -i 's/brave %U/brave -disable-features=WaylandWpColorManagerV1 %U/g' /usr/share/applications/brave-browser.desktop"
    sudo sed -i 's/brave %U/brave -disable-features=WaylandWpColorManagerV1 %U/g' /usr/share/applications/brave-browser.desktop $argv
end
