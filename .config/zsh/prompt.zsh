# colors
local color1=#b4befe
local color2=#94e2d5
local color3=#f80
local color4=#efb974

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

	for ((i=0; i < separator_len+10; i++)); do
		sep+="-"
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

		git_prompt="%B%F{$color4}%K{$color4}%F{black}%F{black} ${current_branch} "

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

  prompt_top="╭──%B%F{black}%K{${color1}} %F{black}%n%f%k%F{${color1}} %B%F{cyan}%F{${color2}} %b%2~ %f"
	prompt_below="%f╰──${prompt_char}%f "
}

PROMPT='${prompt_top}%F{black}$(create_separator)$git_prompt%f%k%b
${prompt_below}'

RPROMPT='%F{red}$(if [ $? -ne 0 ]; then echo "󰌑%? "; fi)%f'
