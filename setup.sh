#!/bin/bash

# Constants

PATH_TO_DOTFILES=$(pwd);
PATH_TO_ZSHRC="${PATH_TO_DOTFILES}/.zshrc";
PATH_TO_GITCONFIG="${PATH_TO_DOTFILES}/.gitconfig";
PATH_TO_TMUXCONFIG="${PATH_TO_DOTFILES}/.tmux.conf";
PATH_TO_ANTIGEN="${PATH_TO_DOTFILES}/antigen/antigen.zsh";

TARGET_DIR="$HOME";

ACTIONS=("symlink" "macos" "chsh-zsh" "antigen-update" "cancel");
DESCRIPTIONS=(
"Symlink dotfiles to $HOME directory."
"Install dotfiles to $HOME directory and ensure env is set up with zsh and brew."
"Set zsh as default shell."
"Update antigen."
"No-op."
);

# Actions

symlink()
{
  if [ ! check-zsh ] ; then
    printf "No zsh found, exiting...";
    exit 1;
  fi
  init-submodules;
  symlink-all;
  exit 0;
}

macos()
{
  init-submodules;
  macos-prerequisites;
  symlink-all;
  set-zsh-default;
  exit 0;
}

chsh-zsh()
{
  set-zsh-default;
  exit 0;
}

antigen-update()
{
  init-submodules;
  if [ check-antigen ] ; then
    if [ ! check-zsh ] ; then
      printf "No zsh found, exiting...";
      exit 1;
    fi
    antigen-selfupdate-update;
  fi
  exit 0;
}

cancel()
{
  exit 0;
}

# Helpers

print-help()
{
  printf "\nSalomon Smeke Dotfiles Setup\n";
  printf "\nCommands:\n";
  i=0;
  for opt in "${ACTIONS[@]}"; do
    printf "\t%s - %s\n" "${opt}" "${DESCRIPTIONS[i]}";
    i=$(($i+1));
  done
  printf "\n";
}

init-submodules()
{
  printf "Initializing git submodules.\n";
  git submodule update --init --recursive --remote;
}

symlink-all()
{
  printf "Symlinking...\n";
  pushd ${TARGET_DIR} >/dev/null;
  for opt in ${PATH_TO_ZSHRC} ${PATH_TO_GITCONFIG} ${PATH_TO_ANTIGEN} ${PATH_TO_TMUXCONFIG}; do
    printf "\t%s\n" "${opt}";
    ln -s "${opt}";
  done
  popd >/dev/null;
}

set-zsh-default()
{
  printf "Setting zsh as your default shell, this might require your password.\n\t";
  sudo chsh -s $(which zsh) $(whoami);
}

macos-prerequisites()
{
  if [ ! check-zsh ] ; then
    if [ ! check-brew ] ; then
      printf "No Brew found, installing...\n";
      install-brew;
    fi
    printf "No zsh found, installing...\n";
    install-zsh;
  fi
}

check-antigen()
{
  if [ -f "$~/antigen.zsh" ]; then return 1; else return 0; fi;
}

check-zsh()
{
  if [ -f "$(which zsh)" ]; then return 1; else return 0; fi;
}

check-brew()
{
  if [ -f "$(which brew)" ]; then return 1; else return 0; fi;
}

install-brew()
{
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
}

install-zsh()
{
  brew install zsh;
}

antigen-selfupdate-update()
{
  zsh -c "source ~/.zshrc && antigen selfupdate && antigen update && antigen cleanup;"
}

# Entry

set -e

main()
{
  if [ "$1" == "help" ]; then
    print-help;
    exit 0;
  elif [ "$1" == "symlink" ]; then
    symlink;
  elif [ "$1" == "macos" ]; then
    macos;
  elif [ "$1" == "chsh-zsh" ]; then
    chsh-zsh;
  elif [ "$1" == "antigen-update" ]; then
    antigen-update;
  elif [ "$1" == "cancel" ]; then
    cancel;
  else
    print-help;
    exit 1;
  fi
}

main "$@";
