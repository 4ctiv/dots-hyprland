function get-yt-audio --wraps='yt-dlp' --description 'Download Audio from URL' -a url
    type -q atomicparsley; or \
      echo "[WARNING] AtomicParsley not installed, thumbnail embed may fail"

    yt-dlp --continue --color auto \
      -f "bestaudio" --extract-audio --audio-format "m4a/mp3" --convert-thumbnails jpg \
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
