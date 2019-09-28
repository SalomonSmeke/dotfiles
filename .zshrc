# Enable completions
autoload -Uz compinit;
compinit -C;

# Antibody
. ~/.zsh_antibody_plugins.sh;

# Config
export COMPLETION_WAITING_DOTS="true"

# After-hook
if [ -f ~/.zshrc_local_after ]; then
  . ~/.zshrc_local_after
fi
