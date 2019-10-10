# Enable completions
autoload -Uz compinit;
compinit -C;

# Antibody
. ~/.zsh_antibody_plugins;

# Config
export COMPLETION_WAITING_DOTS="true"
setopt interactivecomments

# After-hook
if [ -f ~/.zshrc_local_after ]; then
  . ~/.zshrc_local_after;
fi
