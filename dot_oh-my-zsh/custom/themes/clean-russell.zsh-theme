# clean-russell.zsh-theme

autoload -U colors; colors
setopt PROMPT_SUBST

# right prompt: time in gray
RPROMPT='%F{242}%*%f'

# git prompt coloring: parens wrap only the branch
ZSH_THEME_GIT_PROMPT_PREFIX='%F{69}git:(%F{141}'
ZSH_THEME_GIT_PROMPT_SUFFIX='%F{69})%f'
ZSH_THEME_GIT_PROMPT_DIRTY=''   # keep empty so the star is not inside ()
ZSH_THEME_GIT_PROMPT_CLEAN=''

# print a dirty marker AFTER the git info
prompt_git_dirty_marker() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || return
  print -n ' '                   # always one space
  [[ -n "$(git status --porcelain 2>/dev/null)" ]] && print -n '%F{178}✗%f '
}

# recompute SSH segment dynamically each prompt
precmd() {
  if [[ -n "$SSH_CONNECTION$SSH_CLIENT$SSH_TTY" ]]; then
    SSH_SEG='%F{160}[%n@%m]%f '
  else
    SSH_SEG=''
  fi
}

# main prompt
PROMPT='${SSH_SEG}%F{45}%c%f $(git_prompt_info)$(prompt_git_dirty_marker)'

