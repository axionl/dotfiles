# Defined in - @ line 0
function pacsize --description 'Order packages by size (Default: 25)'
    if count $argv > /dev/null
	    pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h -r | bat -r :$argv;
    else
        pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h -r | bat -r :25;
    end
end
