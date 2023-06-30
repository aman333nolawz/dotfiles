# colors
local color1=#1da1f2
local color2=#0ff
local color3=#2d8
local color4=#f80
local color5=#efb974

autoload -Uz vcs_info
setopt PROMPT_SUBST

function create_separator() {
	local sep=""

	local terminal_width=$(tput cols)
	local prompt_len=${#${(%):---- %n-%m- - %2~ }}
	local git_prompt_skel=""

	if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
		local unstaged_count=$(git diff --numstat | wc -l)
		local staged_count=$(git diff --cached --numstat | wc -l)
		local untracked_count=$(git ls-files --others --exclude-standard | wc -l)

		local current_branch=$(git branch --show-current)

		git_prompt_skel+=" ${current_branch} "

		if ((staged_count!=0)); then
			git_prompt_skel+="${staged_count}+ "
		fi

		if ((unstaged_count!=0)); then
			git_prompt_skel+="${unstaged_count}* "
		fi

		if ((untracked_count!=0)); then
			git_prompt_skel+="${untracked_count}! "
		fi
	fi

	local git_prompt_len=${#git_prompt_skel}

	separator_len=$((terminal_width - prompt_len - git_prompt_len))

	for ((i=0; i < separator_len; i++)); do
		sep+="󰍴"
	done

	echo "$sep"
}

precmd() {
	vcs_info

	if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
		prompt_char="○ "

		local unstaged_count=$(git diff --numstat | wc -l)
		local staged_count=$(git diff --cached --numstat | wc -l)
		local untracked_count=$(git ls-files --others --exclude-standard | wc -l)

		local current_branch=$(git branch --show-current)

		git_prompt="%B%F{$color5}%K{$color5}%F{black}%F{black} ${current_branch} "

		if ((staged_count!=0)); then
			git_prompt+="%F{#080}${staged_count} "
		fi

		if ((unstaged_count!=0)); then
			git_prompt+="%F{black}${unstaged_count} "
		fi

		if ((untracked_count!=0)); then
			git_prompt+="%F{black}${untracked_count}! "
		fi

	else
		prompt_char="○"
		git_prompt=""
	fi

	prompt_top="╭──%B%F{black}%K{${color1}} %n%K{${color2}}%F{${color1}}%F{black}%m%f%k%F{${color2}} %B%F{cyan}%F{${color3}} %b%2~ %f"
	prompt_below="%f╰──${prompt_char}%f "
}

PROMPT='${prompt_top}%F{#644}$(create_separator)$git_prompt%f%k%b
${prompt_below}'

RPROMPT='%F{#f00}$(if [ $? -ne 0 ]; then echo "󰌑%? "; fi)%f $(date "+%I:%M:%S %p")'
