# Defined in - @ line 0
function _ipsb_complete
	complete -ec ipsb
	complete -xc ipsb -n __fish_use_subcommand -a -4 -d "Resolve names to IPv4 addresses"
	complete -xc ipsb -n __fish_use_subcommand -a -6 -d "Resolve names to IPv6 addresses"
	complete -xc ipsb -n __fish_use_subcommand -a --help -d "Show usage help"
	complete -xc ipsb -n __fish_use_subcommand -a --geoip -d "Get IP address location in JSON format"
end

function _ipsb_help
	echo "usage: ipsb                   Get default ip info"
	echo "       ipsb -4                Resolve names to IPv4 addresses"
	echo "       ipsb -6                Resolve names to IPv6 addresses"
	echo "       ipsb -g|--geoip        Get local geoip info"
	echo "       ipsb <ip>              Get remote geoip info"
	echo "       ipsb --help            Show this help"
	echo "examples:"
	echo "       ipsb 114.114.114.114"
	echo ""
	echo "       {
         "longitude": 113.7266,
         "timezone": "Asia/Shanghai",
         "offset": 28800,
         "asn": 174,
         "organization": "Cogent Communications",
         "country": "China",
         "ip": "114.114.114.114",
         "latitude": 34.7725,
         "continent_code": "AS",
         "country_code": "CN"
       }"
end

function ipsb -d "get your ip address from IP.SB Free API."
	set url "https://api.ip.sb/ip"
	set url_geoip "https://api.ip.sb/geoip"
	set format_json false
	if count $argv > /dev/null
		for cmd in $argv
			switch "$cmd"
				case -4
					set iptype "-4"
				case -6
					set iptype "-6"
				case {,-}-g{eoip,}
					set url $url_geoip
					set format_json true
				case {,-}-h{elp,}
					_ipsb_help
					return 0
				case \*
					set iptype ""
					set ipaddr $cmd
			end

			if count $ipaddr > /dev/null
				set url $url_geoip
				set resp (curl -s $iptype "$url/$ipaddr")
				set format_json true
			else
				set resp (curl -s $iptype $url)
			end

			if count $resp > /dev/null
				if $format_json
					echo $resp | python -m json.tool
				else
					printf "My ip address is:\n%s\n" $resp
				end
			else
				echo "Failed to get the ip address."
				return 1
			end
		end
	else
		printf "My ip address is:\n%s\n" (curl -s "https://api.ip.sb/ip")
	end
	_ipsb_complete
end
