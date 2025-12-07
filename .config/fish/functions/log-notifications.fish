function log-notifications --wraps="makoctl history # | jq '.data[0][].body.data'" --description "alias log-notifications=makoctl history # | jq '.data[0][].body.data'"
    makoctl history # | jq '.data[0][].body.data' $argv
end
