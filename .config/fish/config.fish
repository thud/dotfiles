alias ls 'exa'
alias l 'exa -lah'
alias vim 'nvim'
alias ka 'killall'
alias tsm 'transmission-remote'
alias dotfiles '/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
abbr -a -g fishrc 'nvim $XDG_CONFIG_HOME/fish/config.fish'
abbr -a -g vimrc 'nvim $XDG_CONFIG_HOME/nvim/init.vim'
abbr -a -g bashrc 'nvim $HOME/.bashrc'

abbr -a -g upd 'sudo emerge --ask --update --deep --changed-use @world'

set fish_greeting

function fish_prompt
	set_color -o magenta
	echo -n $USER
	set_color brblack
	echo -n "@"
	set_color blue
	echo -n (hostname)
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color yellow
		echo -n (basename $PWD)
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color red
	echo -n '| '
	set_color normal
end

set -g fish_cursor_insert line
set -g fish_cursor_replace_one underscore
set -g fish_cursor_visual block

## Nord theme ## Run the following upon install
#set -Ux fish_color_normal normal
#set -Ux fish_color_command 81a1c1
#set -Ux fish_color_quote a3be8c
#set -Ux fish_color_redirection b48ead
#set -Ux fish_color_end 88c0d0
#set -Ux fish_color_error ebcb8b
#set -Ux fish_color_param eceff4
#set -Ux fish_color_comment 434c5e
#set -Ux fish_color_match --background=brblue
#set -Ux fish_color_selection white --bold --background=brblack
#set -Ux fish_color_search_match bryellow --background=brblack
#set -Ux fish_color_history_current --bold
#set -Ux fish_color_operator 00a6b2
#set -Ux fish_color_escape 00a6b2
#set -Ux fish_color_cwd green
#set -Ux fish_color_cwd_root red
#set -Ux fish_color_valid_path --underline
#set -Ux fish_color_autosuggestion 4c566a
#set -Ux fish_color_user brgreen
#set -Ux fish_color_host normal
#set -Ux fish_color_cancel -r
#set -Ux fish_pager_color_completion normal
#set -Ux fish_pager_color_description B3A06D yellow
#set -Ux fish_pager_color_prefix white --bold --underline
#set -Ux fish_pager_color_progress brwhite --background=cyan
