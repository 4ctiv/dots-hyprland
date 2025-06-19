function csm-verify --description 'Validate a file against a checksum'

   #Arguments: protocoll checksum file
   # Note: Error number match argument, (-1) decodes failed verification
   set -l algo    $argv[1]
   set -l usr_csm $argv[2]
   set -l file    $argv[3]

   # Setup checksum parameters
   set -l min_length 0
   set -l format_regex '^\$'
   switch $algo
     case md5
       set format_regex '^[0-9a-fA-F]{32}$'
       set min_length 32
     case sha1
       set format_regex '^[0-9a-fA-F]{40}$'
       set min_length 40
     case sha224
       set format_regex '^[0-9a-fA-F]{56}$'
       set min_length 56
     case sha256
       set format_regex '^[0-9a-fA-F]{64}$'
       set min_length 64
     case sha384
       set format_regex '^[0-9a-fA-F]{96}$'
       set min_length 96
     case sha512
       set format_regex '^[0-9a-fA-F]{128}$'
       set min_length 128
     case '*'
       echo "[ERROR] Unsupported algorithm: $algo"
       echo "  Avalable: md{5}, sha{1,244,256,384,512}"
       echo "  Usage: [algo] [verification_checksum] [file]"
       return 1
   end

    # Verify user_csm syntax
    echo ''
    if not string match -rq "$format_regex" "$usr_csm"
      echo "[ERROR] Invalid checksum format for $algo"
      echo "  Expected: $min_length characters (hexa-decimal)"
      echo "  Received: $(math (echo "$usr_csm" | wc --chars) - 1) characters"
      return 2
    end

    # Check if file exists
    if not test -f "$file"
      echo "Error: File '$file' not found"
      return 3
    end

    # Calculate file checksum
    set file_csm "$(openssl $algo $file | sed 's/.*= //g;' | head -n 1)"

    # Verify user checksum
    if test "$file_csm" = "$usr_csm"
        echo "✓ Valid checksum"
        return 0
    else
        echo "✗ Invalid checksum for $file"
        echo "Provided: $usr_csm"
        echo "Actual:   $file_csm"
        return -1
    end
end
