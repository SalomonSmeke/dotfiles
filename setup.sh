#!/bin/bash

# Constants
PATH_TO_DOTFILES=$(pwd);
FNAMES_TO_SYMLINK=(
".zshrc"
".gitconfig"
".tmux.conf"
);
ANTIBODY_PLUGIN_LIST_PATH="$PATH_TO_DOTFILES/.zsh_antibody_plugins.txt";
TARGET_DIR="$HOME";
TARGET_ANTIBODY_PATH="$TARGET_DIR/.zsh_antibody_plugins.sh";

BREW_INSTALLS="ack bat exa htop python sl tmux vim asciinema nvm tree";
BREW_CASK_INSTALLS="atom disk-inventory-x firefox imageoptim onyx vlc";

ACTIONS=("symlink" "macos" "chsh-zsh" "antibody-update" "brew-packages" "cancel");
DESCRIPTIONS=(
"Symlink dotfiles to $HOME directory."
"Install dotfiles to $HOME directory and ensure env is set up with zsh and brew."
"Set zsh as default shell."
"Update/Install antibody."
"Install some nice brew packages (cask and regular)."
"No-op."
);

# Actions

symlink()
{
  if [ ! check-zsh ] ; then
    printf "No zsh found, exiting...";
    exit 1;
  fi
  symlink-all;
  exit 0;
}

macos()
{
  macos-prerequisites;
  symlink-all;
  antibody-self-update;
  set-zsh-default;
  exit 0;
}

chsh-zsh()
{
  set-zsh-default;
  exit 0;
}

antibody-update()
{
  if [ check-antibody ] ; then
    if [ ! check-zsh ] ; then
      printf "No zsh found, exiting...";
      exit 1;
    fi
    antibody-self-update;
  fi
  exit 0;
}

cancel()
{
  exit 0;
}

brew-packages()
{
  macos-prerequisites;
  brew-install;
  brew-cask-install;
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
    i=$((i+1));
  done
  printf "\n";
}

symlink-all()
{
  printf "Symlinking...\n";
  pushd ${TARGET_DIR} >/dev/null;
  for opt in "${FNAMES_TO_SYMLINK[@]}"; do
    printf "\t%s" "${opt}";
    if [ -f "$TARGET_DIR/$opt" ] ; then
      printf "\n\tFound! Not Overriding...";
    else
      ln -s "$PATH_TO_DOTFILES/$opt";
    fi
    printf "\n";
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

check-antibody()
{
  if [ command -v antibody ]; then return 1; else return 0; fi;
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

antibody-self-update()
{
  if [ ! check-antibody ] ; then
    curl -sfL git.io/antibody | sh -s - -b /usr/local/bin;
  fi
  zsh -c "autoload -Uz compinit && compinit && antibody bundle < ${ANTIBODY_PLUGIN_LIST_PATH} > ${TARGET_ANTIBODY_PATH}";
  zsh -c "autoload -Uz compinit && compinit && antibody update";
  zsh -c "rm -f ~/.zcompdump && autoload -Uz compinit && compinit";
}

brew-install()
{
  brew install $BREW_INSTALLS;
}

brew-cask-install()
{
  brew cask install $BREW_CASK_INSTALLS;
}

# Entry

set -e

main()
{
  if [ "$1" == "help" ]; then
    print-help;
    cancel;
  elif [ "$1" == "symlink" ]; then
    symlink;
  elif [ "$1" == "macos" ]; then
    macos;
  elif [ "$1" == "chsh-zsh" ]; then
    chsh-zsh;
  elif [ "$1" == "antibody-update" ]; then
    antibody-update;
  elif [ "$1" == "brew-packages" ]; then
    brew-packages;
  elif [ "$1" == "cancel" ]; then
    cancel;
  else
    print-help;
    exit 1;
  fi
}

main "$@";
