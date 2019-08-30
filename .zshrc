autoload -Uz compinit;
compinit;

# Antibody
source ~/.zsh_antibody_plugins.sh;

# Config
export DISABLE_AUTO_TITLE="true"
export COMPLETION_WAITING_DOTS="true"

# After-hook
if [ -f ~/.zshrc_local_after ]; then
  source ~/.zshrc_local_after
fi
