function blurk
    if test $DISPLAY
    	set AlacrittyID (xdo id -n "Alacritty")
    	# set RofiID (xdo id -n "rofi")
    	set YakuakeID (xdo id -n "yakuake")
    	set WindowsID $AlacrittyID $YakuakeID # $RofiID
    	if count $WindowsID > /dev/null
	    	for ID in $WindowsID
			    xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $ID
		    end
		end
	end
end
