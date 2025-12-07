function fix-qt --wraps="export QT_QPA_PLATFORM='wayland;xcb'" --description "alias fix-qt=export QT_QPA_PLATFORM='wayland;xcb'"
    export QT_QPA_PLATFORM='wayland;xcb' $argv
end
