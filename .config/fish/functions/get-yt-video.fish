function get-yt-video --wraps="yt-dlp" --description "Download Video from URL"
    yt-dlp  $argv
    yt-dlp --continue --color auto \
      -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' \
      --embed-subs --embed-chapters --embed-metadata --embed-thumbnail \
      --parse-metadata "description:%(webpage_url)s" \
      --parse-metadata "album:%(playlist)s" \
      --parse-metadata "track:%(autonumber)s" \
      --parse-metadata "tags:%(tags)s" \
      --restrict-filenames --windows-filenames --no-overwrites \
      --sponsorblock-remove default --geo-bypass \
      --yes-playlist --playlist-reverse --no-abort-on-error \
      --sleep-interval 1 --max-sleep-interval 3 --limit-rate 7M \
      --output "%(title)s %(playlist_title)@%(uploader)s.%(ext)s" \
      $argv
end
