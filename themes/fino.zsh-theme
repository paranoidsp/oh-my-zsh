# fino.zsh-theme

# Use with a dark background and 256-color terminal!
# Meant for people with rbenv and git. Tested only on OS X 10.7.

# You can set your computer name in the ~/.box-name file if you want.

# Borrowing shamelessly from these oh-my-zsh themes:
#   bira
#   robbyrussell
#
# Also borrowing from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
#use extended color palette if available
if [[ $TERM = *256color* || $TERM = *rxvt* ]]; then
    turquoise="%F{81}"
    orange="%F{166}"
    purple="%F{135}"
    hotpink="%F{161}"
    limegreen="%F{118}"
else
    turquoise="$fg[cyan]"
    orange="$fg[yellow]"
    purple="$fg[magenta]"
    hotpink="$fg[red]"
    limegreen="$fg[green]"
fi

function prompt_char {
  git branch >/dev/null 2>/dev/null && echo "±" && return
  echo '○'
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo ${SHORT_HOST:-$HOST}
}

local ruby_env='using%{$FG[243]%} $(ruby_prompt_info)'
local git_info='$(git_prompt_info)'
local prompt_char='$(prompt_char)'

function get_kubecfg {
    kubecfg=$(echo $KUBECONFIG | rev | cut -d'/' -f -1 | rev);
    echo $kubecfg;
}

<<<<<<< HEAD
#setopt PROMPT_SUBST
PROMPT="╭─%{$FG[040]%}%n%{$reset_color%} %{$FG[239]%}@%{$reset_color%} %{$FG[033]%}$(box_name)%{$reset_color%} %{$FG[239]%}in%{$reset_color%} %{$terminfo[bold]$FG[135]%}%~%{$reset_color%}${git_info} %{$FG[239]%}at%{$FG[243]%} %D - %*
╰─${prompt_char}%{$reset_color%} "

#PROMPT="╭─%{$FG[040]%}%n%{$reset_color%}%{$FG[239]%}@%{$reset_color%}%{$FG[033]%}$(box_name)%{$reset_color%} %{$FG[239]%}in%{$reset_color%} %{$terminfo[bold]$purple%}${current_dir}%{$reset_color%}${git_info} %{$FG[239]%}at%{$FG[243]%} %* %{$FG[239]%}[%{$FG[208]%}%!%{$reset_color%}%{$FG[239]%}]%{$reset_color%} $turquoise %? %{$terminfo[bold]$purple%}%(1j.%j.)%{$reset_color%}
╰─${prompt_char}%{$reset_color%} "
# [%{$FG[033]%}%*%{$reset_color%}|
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[239]%}on%{$reset_color%} %{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%}✘✘✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%}✔"
ZSH_THEME_RUBY_PROMPT_PREFIX="‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"
