# Enable vi-mode for command-line editing
bindkey -v

# Enable prompt substitution so that command expressions are evaluated in your prompt
setopt prompt_subst

# Load color definitions; many themes (including robbyrussell) use variables for styling
autoload -U colors && colors

# git_prompt_info function for the theme git branch info 
git_prompt_info() {
  # Retrieve the current branch name or exit if not in a Git repo
  local branch
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || return
  if [ -n "$branch" ]; then
    # Check for changes in the repository to decide if it's dirty
    if [ -n "$(git status --porcelain 2>/dev/null)" ]; then
      # Repository has modifications; use the "dirty" marker from the theme
      local state="$ZSH_THEME_GIT_PROMPT_DIRTY"
    else
      # Repository is clean; use the "clean" marker
      local state="$ZSH_THEME_GIT_PROMPT_CLEAN"
    fi
    # Construct and output the Git prompt using theme variables
    echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${branch}${state}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
  fi
}


# Source the downloaded robbyrussell theme file
source "$HOME/.config/zsh/themes/robbyrussell.zsh-theme"

# Set up Zsh’s built-in auto-completion
autoload -Uz compinit
compinit

# Initialize zoxide
eval "$(zoxide init zsh)"

# Source zsh-syntax-highlighting
source "$HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Optional: Configure history settings
HISTFILE=~/.config/zsh/history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS

