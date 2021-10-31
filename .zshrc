zstyle ':znap:*' repos-dir ~/.zsh-snap;
zstyle ':znap:*' plugins-dir ~/.zsh-snap;

. ~/.zsh-snap/znap.zsh;

znap source ohmyzsh/ohmyzsh lib/{git,prompt_info_functions,theme-and-appearance};

znap prompt ohmyzsh/ohmyzsh theunraveler;

znap source ohmyzsh/ohmyzsh lib/{spectrum,key-bindings,clipboard,completion,correction,directories,functions,history};

znap source ohmyzsh/ohmyzsh plugins/{wd,colored-man-pages,gitfast};

znap source zsh-users/zsh-syntax-highlighting;

znap source SalomonSmeke/oh-my-zsh lib/grep.zsh;

znap source zpm-zsh/colorize;

znap source MichaelAquilina/zsh-you-should-use;

# Config
export COMPLETION_WAITING_DOTS="true";
setopt interactivecomments;

# Run the previous command as sudo, thanks gh:cdfuller!
alias pls='sudo $(fc -nl -1)';

# After-hook
if [ -f ~/.zshrc_local_after ]; then
  . ~/.zshrc_local_after;
fi;
