function list-packs-size --wraps="expac -H M '%m\\t%n' | sort -h | nl" --description "alias list-packs-size=expac -H M '%m\\t%n' | sort -h | nl"
    expac -H M '%m\t%n' | sort -h | nl $argv
end
