# Defined in - @ line 1
function rsync_repo --description 'alias rsync_repo rsync ~/Programs/archlinux/local/axionl_repo/* -avzr --progress --password-file=/home/axionl/.ssh/others/rsync.pwd http@45.77.6.73::repo'
	rsync ~/Programs/archlinux/local/axionl_repo/* -avzr --progress --password-file=/home/axionl/.ssh/others/rsync.pwd html@45.77.6.73::repo $argv;
end
