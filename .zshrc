source ~/.zgenom/sources/init.zsh;

# Config
setopt interactivecomments;
export CLICOLOR=1;
bindkey '^[[B' history-substring-search-down;
bindkey '^[[A' history-substring-search-up;
HISTORY_SUBSTRING_SEARCH_PREFIXED="1";

# Run the previous command as sudo, thanks gh:cdfuller!
alias pls='sudo $(fc -nl -1)';

turbo () {
  zcompile ~/.zcompdump;
}

# After-hook
if [ -f ~/.zshrc_local_after ]; then
  source ~/.zshrc_local_after;
fi;
