#!/bin/bash

# Constants
PATH_TO_DOTFILES=$(pwd);
TARGET_DIR="$HOME";
FNAMES_TO_SYMLINK=(
".zshrc"
".gitconfig"
".tmux.conf"
);
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
  zsh-plugins;
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

zsh-plugins()
{
  rm -rf "${TARGET_DIR}/.zgenom"
  git clone https://github.com/jandamm/zgenom.git "${TARGET_DIR}/.zgenom"

  zsh -c "
  . ${TARGET_DIR}/.zgenom/zgenom.zsh

  zgenom load mafredri/zsh-async
  zgenom load SalomonSmeke/pure- pure.zsh

  zgenom load ohmyzsh/ohmyzsh lib/spectrum.zsh
  zgenom load ohmyzsh/ohmyzsh lib/key-bindings.zsh
  zgenom load ohmyzsh/ohmyzsh lib/clipboard.zsh
  zgenom load ohmyzsh/ohmyzsh lib/completion.zsh
  zgenom load ohmyzsh/ohmyzsh lib/correction.zsh
  zgenom load ohmyzsh/ohmyzsh lib/functions.zsh
  zgenom load ohmyzsh/ohmyzsh lib/history.zsh
  zgenom load SalomonSmeke/oh-my-zsh lib/grep.zsh

  zgenom load ohmyzsh/ohmyzsh plugins/wd
  zgenom load ohmyzsh/ohmyzsh plugins/colored-man-pages
  zgenom load ohmyzsh/ohmyzsh plugins/gitfast

  zgenom load zsh-users/zsh-syntax-highlighting
  zgenom load zpm-zsh/colorize
  zgenom load MichaelAquilina/zsh-you-should-use

  zgenom save
  zcompile ${TARGET_DIR}/.zgenom/sources/init.zsh;
  "
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
