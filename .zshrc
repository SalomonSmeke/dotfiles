# Antigen

source ~/antigen.zsh;

# Load the oh-my-zsh's library.
antigen use oh-my-zsh;
antigen bundle git;
antigen bundle github;
antigen bundle command-not-found;
antigen bundle colored-man-pages;
antigen bundle colorize;
antigen bundle cp;
antigen bundle wd;

# Load the theme.
antigen theme theunraveler;

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Tell antigen that you're done.
antigen apply

# Config
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
EDITOR="atom"

# After-hook

if [ -f ~/.zshrc_local_after ]; then
  source ~/.zshrc_local_after
fi
