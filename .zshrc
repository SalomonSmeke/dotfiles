# typeset -F SECONDS
# autoload -Uz add-zsh-hook
# add-zsh-hook precmd print_startup_time
#
# print_startup_time () {
#   print -n "Startup time: "
#   echo $SECONDS
#
#   # Clean up.
#   add-zsh-hook -d precmd print_startup_time
#   unset startup_timer_module_path
# }

source ~/.zgenom/sources/init.zsh;

alias grep="grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}";

# Config
setopt interactivecomments;
export CLICOLOR=1;

# History search
bindkey '^[[B' history-substring-search-down;
bindkey '^[[A' history-substring-search-up;
HISTORY_SUBSTRING_SEARCH_PREFIXED="1";

# Ctrl+r config for fzf
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND="rg --files";
  export FZF_DEFAULT_OPTS="-m";
fi

# Run the previous command as sudo, thanks gh:cdfuller!
alias pls='sudo $(fc -nl -1)';

turbo () {
  zcompile ~/.zcompdump;
  zcompile ~/.zshrc;
  [ -f ~/.fzf.zsh ] && zcompile ~/.fzf.zsh;
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh;

# After-hook
if [ -f ~/.zshrc_local_after ]; then
  source ~/.zshrc_local_after;
fi;
