export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.scripts:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"

export EDITOR="nvim"
export BROWSER="brave-bin"

if [[ $(ps --no-header --pid=$PPID --format=cmd) != "fish" ]]
then
	exec fish
fi

source /home/thud/.config/broot/launcher/bash/br
