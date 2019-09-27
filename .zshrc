# Enable completions
autoload -Uz compinit;
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit;
else
  compinit -C;
fi

# Antibody
source ~/.zsh_antibody_plugins.sh;

# Config
export COMPLETION_WAITING_DOTS="true"

# After-hook
if [ -f ~/.zshrc_local_after ]; then
  source ~/.zshrc_local_after
fi
