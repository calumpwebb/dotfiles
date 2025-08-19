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
  [[ -n "$(git status --porcelain 2>/dev/null)" ]] && print -n ' %F{178}✗%f'
}

# optional SSH label when in an SSH session
[[ -n $SSH_CONNECTION ]] && SSH_SEG='%F{160}[SSH: %n@%m]%f '

# %m shows the host. uses parameter expansion so it is dynamic
PROMPT='${SSH_CONNECTION:+%F{160}[SSH: %m]%f }%F{45}%c%f $(git_prompt_info)$(prompt_git_dirty_marker) '

