# Copied and modified from the oh-my-zsh theme from geoffgarside
# Red server name, green cwd, blue git status

PROMPT='╭─%{$FG[135]%}%n%{$reset_color%}%{$FG[239]%}@%{$reset_color%}%{$fg[red]%}%m%{$reset_color%}:%{$fg[green]%}%c%{$reset_color%}$(git_prompt_info) %{$FG[239]%}at%{$FG[243]%} %* %{$FG[239]%}[%{$FG[208]%}%!%{$reset_color%}%{$FG[239]%}]%{$reset_color%} $turquoise %? %{$terminfo[bold]$purple%}%(1j.%j.)%{$reset_color%} %(!.#.$) 
╰─%(!.#.$) '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
