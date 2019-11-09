function ubc --wraps unbound-control --description 'alias ubc=sudo unbound-control'
	sudo unbound-control $argv
end
