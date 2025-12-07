function list-packs-recent-extended --wraps="expac --timefmt='%Y-%m-%d %T' '%l\\t%n %v' | sort | tail -3000 | nl" --description "alias list-packs-recent-extended=expac --timefmt='%Y-%m-%d %T' '%l\\t%n %v' | sort | tail -3000 | nl"
    expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl $argv
end
