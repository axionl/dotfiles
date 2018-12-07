function tmux_init
	printf "==> Checking tmux session ...\n"
	if eval "tmux has-session -t bg"
		echo " ~> Found tmux session ✔"
	else
		echo " ~> Start a new session ✔"
		tmux new-session -d -s bg -x 1920 -y 1080
	end
end
