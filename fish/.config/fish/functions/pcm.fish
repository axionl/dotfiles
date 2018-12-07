function pcm --wraps pacman --description 'alias pcm=sudo pacman'
	sudo pacman $argv
end
