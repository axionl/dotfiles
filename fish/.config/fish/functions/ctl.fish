function ctl --wraps systemctl --description 'alias ctl=sudo systemctl'
	sudo systemctl $argv
end
