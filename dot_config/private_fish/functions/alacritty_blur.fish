function alacritty_blur --description 'make blur for alacritty terminal.'
    set -l ppid (cat /proc/(echo %self)/status | grep PPid | cut -f2)
    if string match -r alacritty (ps --no-headers -p $ppid -o comm) 1>/dev/null
        for wid in (xdotool search --pid $ppid)
            xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid
        end
    end
end
