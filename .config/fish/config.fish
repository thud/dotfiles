set -x XDG_CONFIG_HOME "$HOME/.config"
set -x LANG en_US.UTF-8
set -x EDITOR nvim
set -x VISUAL nvim


alias ls 'exa'
alias l 'exa -lah'
alias vim 'nvim'
alias ka 'killall'
alias tsm 'transmission-remote'
alias dotfiles '/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
abbr -a fishrc 'nvim ~/.config/fish/config.fish'
abbr -a vimrc 'nvim ~/.config/nvim/init.vim'

set -x PATH $PATH ~/.local/bin
set -x PATH $PATH ~/.cargo/bin
set -x PATH $PATH ~/.scripts

function fish_greeting
end

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

function fish_vi_cursor --on-variable fish_bind_mode
    switch $fish_bind_mode
        case insert
            printf '\e]50;CursorShape=1\x7'
        case default
            printf '\e]50;CursorShape=0\x7'
        case "*"
            printf '\e]50;CursorShape=0\x7'
    end
end

fish_vi_key_bindings

# Nord theme
set -U fish_color_normal normal
set -U fish_color_command 81a1c1
set -U fish_color_quote a3be8c
set -U fish_color_redirection b48ead
set -U fish_color_end 88c0d0
set -U fish_color_error ebcb8b
set -U fish_color_param eceff4
set -U fish_color_comment 434c5e
set -U fish_color_match --background=brblue
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_search_match bryellow --background=brblack
set -U fish_color_history_current --bold
set -U fish_color_operator 00a6b2
set -U fish_color_escape 00a6b2
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion 4c566a
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel -r
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D yellow
set -U fish_pager_color_prefix white --bold --underline
set -U fish_pager_color_progress brwhite --background=cyan
