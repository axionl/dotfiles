# Defined in - @ line 0
# Maintainer: Ariel AxionL <i (at) axionl (dot) me>

# All tablet_area subcommands
set -l cmds '-h' '--help' '-d' '--device' '-m' '--monitor'
set -l id_list (command xinput list --id-only)
set -l name_list (command xinput list --name-only)

function __tablet_area_help
	printf "Usage: tablet_selector [OPTIONS]\n\n"
	printf "Options:\n"
	printf "    -h, --help\tShow this help\n"
	printf "    -d, --device\tSelect device\n"
	printf "    -m, --monitor\tSelect monitor\n\n"
	printf "Click <Tab> will auto complete the device id and monitor interface\n"
end

# function __complete_device
# 	command xinput list --id-only

# 	# set -l id_list (command xinput list --id-only)
# 	# set -l name_list (command xinput list --name-only)
# 	# for i in (seq (count $id_list))
# 		# complete -x -c tablet_area -n "__fish_seen_subcommand_from -d --device" -a "$id_list[$i]" -d "$name_list[$i]"
# 		# command echo "$id_list[$i]"
# 	# end
# end

function __complete_monitor
	command xrandr --listactivemonitors | awk '{print $4}' | rg -e '[\w-]+'

	# set -l active_monitor_list (command xrandr --listactivemonitors | awk '{print $4}' | rg -e '[\w-]+')
	# set -l active_monitor_info_list (command xrandr --listactivemonitors | awk 'NR == 1 {next} {print $2 " " $3}')
	# for i in (seq (count $active_monitor_list))
	# 	command echo "$active_monitor_list[$i]"
	# end
end

function tablet_area -d "Select display monitor for your graphic tablet"
	set -l cmds_parse 'd/device=' 'm/monitor=' 'h/help'

	if count $argv > /dev/null
		argparse $cmds_parse -- $argv 2>/dev/null
		if set -q _flag_help
			__tablet_area_help
		end

		set -q _flag_device; or set -l _flag_device 0
		set -q _flag_monitor; or set -l _flag_monitor 'HDMI-1'

		xsetwacom set $_flag_device MapToOutput $_flag_monitor
	else
		__tablet_area_help
	end
end

# complete -f -c tablet_area
complete -f -c tablet_area -n "not __fish_seen_subcommand_from -h --help" -s h -l help -d "Display help and exit"
complete -x -c tablet_area -n "not __fish_seen_subcommand_from -d --device" -s d -l device -d "Select the device to limit"
complete -x -c tablet_area -n "not __fish_seen_subcommand_from -m --monitor" -s m -l monitor -d "Select the display area"

complete -x -c tablet_area -n "__fish_seen_subcommand_from -m --monitor" -a '(__complete_monitor)'

for i in (seq (count $id_list))
	complete -x -c tablet_area -n "__fish_seen_subcommand_from -d --device" -a "$id_list[$i]" -d "$name_list[$i]"
end