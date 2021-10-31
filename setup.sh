#!/bin/bash

# Constants
PATH_TO_DOTFILES=$(pwd);
TARGET_DIR="$HOME";
FNAMES_TO_SYMLINK=(
".zshrc"
".gitconfig"
".tmux.conf"
);
ANTIBODY_PLUGIN_LIST_PATH="$PATH_TO_DOTFILES/.zsh_antibody_plugins.txt";

ACTIONS=("init" "cancel");
DESCRIPTIONS=(
"Install dotfiles to $TARGET_DIR."
"No-op."
);

# Actions

init()
{
  zsh-install;
  symlink;
  zsh-snap-install;
  exit 0;
}

cancel()
{
  exit 0;
}

# Helpers

check-command()
{
  if ! command -v "$1" >/dev/null; then
    return 1;
  fi
}

zsh-install()
{
  if check-command "brew" ; then
    brew install zsh;
  elif ! check-command "zsh" ; then
    printf "No Brew found, please install zsh manually...\n";
    exit 1;
  fi
  printf "Setting zsh as your default shell, this might require your password.\n\t";
  sudo chsh -s $(which zsh) $(whoami);
}

symlink()
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

zsh-snap-install()
{
  rm -rf "$TARGET_DIR/.zsh-snap";
  cp -R "$PATH_TO_DOTFILES/zsh-snap" "$TARGET_DIR/.zsh-snap";
  zsh -c "(source $TARGET_DIR/.zsh-snap/znap.zsh && znap pull;)";
}

# Entry

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

set -e

main()
{
  if [ "$1" == "help" ]; then
    print-help;
    cancel;
  elif [ "$1" == "init" ]; then
    init;
  elif [ "$1" == "cancel" ]; then
    cancel;
  else
    print-help;
    exit 1;
  fi
}

main "$@";
