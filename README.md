# dotfiles

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/551c467fd5544cd486f61446793b6c6f)](https://www.codacy.com/app/ssmeke/dotfiles?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=SalomonSmeke/dotfiles&amp;utm_campaign=Badge_Grade)

[dotfiles](https://askubuntu.com/questions/94780/what-are-dot-files), and some scripts to automate macos setup.

inspired by [gmoe](https://github.com/gmoe)'s [dotfiles](https://github.com/gmoe/dotfiles), a 🍯🐝/🍯🐝 guy.

## batteries

[Brew](https://brew.sh) - 👌 macos package manager.  
[Zsh](http://www.zsh.org) - 💪 shell.  
[Antigen](http://antigen.sharats.me) - 👏 plugin manager for zsh.  
[Oh My Zsh](https://ohmyz.sh) - 🙏 zsh config framework and all around place-where-zsh-stuff-lives.  

## usage

**go somewhere you dont mind this repo living in:**  
```shell
cd ${FOLDER_WHERE_DOTFILES_WILL_LIVE_FOREVER_PROBABLY_TILDE_IDK_IM_NOT_YOUR_BOSS}
```  

**clone the repo:**  
```shell
git clone https://github.com/SalomonSmeke/dotfiles.git
```

**go into the repo:**  
```shell
cd dotfiles
```  

**install the dotfiles on macos:**  
```shell
./setup.sh macos-install
```  

**install the dotfiles elsewhere:**  
```shell
./setup.sh symlink-only
```

**update antigen:**  
```shell
./setup.sh antigen-update
```  

**print usage:**  
```shell
./setup.sh help
```

**print usage but very cryptographically secure:**  
```shell
./setup.sh $RANDOM
```  

## ech

[Copyright (c)](https://github.com/SalomonSmeke/dotfiles/blob/master/LICENSE) 2018 [Salomon Smeke](https://ssmeke.io) with an [MIT License](https://github.com/SalomonSmeke/dotfiles/blob/master/LICENSE)
