function cddoc --description 'alias cddoc cd ~/Documents/; cd $1'
	cd ~/Documents/
        cd "./$argv[1]"
end
