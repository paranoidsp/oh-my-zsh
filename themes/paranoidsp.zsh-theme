################################## Powerline ######################
# This is from powerline.zsh

#if test -z "${POWERLINE_COMMAND}" ; then
	#if which powerline-client &>/dev/null ; then
		#export POWERLINE_COMMAND=powerline-client
	#else
		#export POWERLINE_COMMAND=powerline
	#fi
#fi

#_powerline_tmux_setenv() {
	#emulate -L zsh
	#if [[ -n "$TMUX" ]]; then
		#tmux setenv -g TMUX_"$1"_$(tmux display -p "#D" | tr -d %) "$2"
		#tmux refresh -S
	#fi
#}

#_powerline_tmux_set_pwd() {
	#_powerline_tmux_setenv PWD "$PWD"
#}

#_powerline_tmux_set_columns() {
	#_powerline_tmux_setenv COLUMNS "$COLUMNS"
#}

#_powerline_install_precmd() {
	#emulate -L zsh
	#for f in "${precmd_functions[@]}"; do
		#if [[ "$f" = "_powerline_precmd" ]]; then
			#return
		#fi
	#done
	#chpwd_functions+=( _powerline_tmux_set_pwd )
	#if zmodload zsh/zpython &>/dev/null ; then
		#zpython 'from powerline.bindings.zsh import setup as powerline_setup'
		#zpython 'powerline_setup()'
		#zpython 'del powerline_setup'
	#else
		#PS1='$($POWERLINE_COMMAND shell left -r zsh_prompt --last_exit_code=$? --last_pipe_status="$pipestatus")'
		#RPS1='$($POWERLINE_COMMAND shell right -r zsh_prompt --last_exit_code=$? --last_pipe_status="$pipestatus")'
	#fi
#}

#trap "_powerline_tmux_set_columns" SIGWINCH
#_powerline_tmux_set_columns

#setopt promptpercent
#setopt promptsubst
#_powerline_install_precmd
#
#
################################## /Powerline ######################
#
################################## agnoster-mod ######################
ZSH_THEME_GIT_PROMPT_DIRTY='±'
function _git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git show-ref --head -s --abbrev |head -n1 2> /dev/null)"
  echo "${ref/refs\/heads\//⭠ }$(parse_git_dirty)"
}
 
function _git_info() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    local BG_COLOR=green
    if [[ -n $(parse_git_dirty) ]]; then
      BG_COLOR=yellow
      FG_COLOR=black
    fi
 
    if [[ ! -z $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
        BG_COLOR=red
        FG_COLOR=white
    fi
    echo "%{%K{$BG_COLOR}%}⮀%{%F{$FG_COLOR}%} $(_git_prompt_info) %{%F{$BG_COLOR}%K{blue}%}⮀"
  else
    echo "%{%K{blue}%}⮀"
  fi
}
 
function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

####  RVM 
#local rvm=''
#if which rvm-prompt &> /dev/null; then
  #rvm='%{$fg[green]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
#else
  #if which rbenv &> /dev/null; then
    #rvm='%{$fg[green]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  #fi
#fi
######


PROMPT_HOST='%{%b%F{gray}%K{black}%} %(?.%{%F{green}%}✔.%{%F{red}%}✘)%{%F{yellow}%} %n %{%F{black}%}'
PROMPT_DIR='%{%F{white}%} %~%  '
PROMPT_SU='%(!.%{%k%F{blue}%K{black}%}⮀%{%F{yellow}%} ⚡ %{%k%F{black}%}.%{%k%F{blue}%})⮀%{%f%k%b%}'
 
PROMPT='%{%f%b%k%}$PROMPT_HOST$(_git_info)$PROMPT_DIR$PROMPT_SU%{$fg[blue]%}$(virtualenv_info)%{$reset_color%}%{$fg[blue]%}❯%{$reset_color%}%{$fg[magenta]%}❯%{$reset_color%}%{$fg[green]%}❯%{$reset_color%} '
#RPROMPT='%{$fg[green]%}[%*]%{$reset_color%}'
#RPROMPT="%{$fg[magenta]%}[${return_status}$(battery_time_remaining)]%{$reset_color%}%{$fg[green]%}$(battery_pct_prompt)%{$reset_color%}[${rvm}]"
#export ZRPROMPT='%{$fg[magenta]%}[${return_status}$(battery_time_remaining)]%{$reset_color%}%{$fg[green]%}$(battery_pct_prompt)%{$reset_color%}'
export ZPROMPT='%{%f%b%k%}$PROMPT_HOST$(_git_info)$PROMPT_DIR$PROMPT_SU%{$fg[blue]%}$(virtualenv_info)%{$reset_color%}%{$fg[blue]%}❯%{$reset_color%}%{$fg[magenta]%}❯%{$reset_color%}%{$fg[green]%}❯%{$reset_color%} '


#prompt_smileart_setup "$@"
