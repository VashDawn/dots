local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
local privilege_status="%(!:%B%F{red}l%L%f%b:%B%F{yellow}l%L%f%b)"

# PROMPT='%{$fg[yellow]%}l%L%{$reset_color%}:${ret_status}%{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
PROMPT='${privilege_status}:${ret_status}%{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# ➜
