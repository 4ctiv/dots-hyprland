function get-yt-audio --wraps='yt-dlp --extract-audio --audio-format best' --description 'alias yt-audio=yt-dlp --extract-audio --audio-format best'
    yt-dlp --extract-audio --audio-format m4a --audio-quality 0 $argv
end
