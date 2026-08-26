function get-yt-video --wraps="yt-dlp" --description "Download Video from URL" -a url
    yt-dlp --continue --color auto \
      -f "bestvideo*+bestaudio/best" --remux-video "mp4/mkv" --convert-thumbnails jpg \
      --audio-multistreams --video-multistreams \
      --embed-subs --embed-chapters --embed-metadata --embed-thumbnail \
      --add-metadata \
      --parse-metadata "%(webpage_url)s:description" \
      --parse-metadata "%(playlist)s:album" \
      --parse-metadata "%(autonumber)s:track" \
      --parse-metadata "%(tags)s:tags" \
      --restrict-filenames --windows-filenames --no-overwrites \
      --sponsorblock-remove default --geo-bypass \
      --yes-playlist --playlist-reverse --no-abort-on-error \
      --sleep-interval 1 --max-sleep-interval 3 --limit-rate 7M \
      --output "%(title)s - %(playlist_title)s @ %(uploader)s.%(ext)s" \
      $argv
end
