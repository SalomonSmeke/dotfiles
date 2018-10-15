# dotfiles

[dotfiles](https://askubuntu.com/questions/94780/what-are-dot-files), and some scripts to automate macos setup.

inspired by [gmoe](https://github.com/gmoe)'s [dotfiles](https://github.com/gmoe/dotfiles), a 10/10 guy.


## batteries

[Brew](https://brew.sh) - 👌 macos package manager.  
[Zsh](http://www.zsh.org) - 💪 shell.  
[Antigen](http://antigen.sharats.me) - 👏 plugin manager for zsh.  
[Oh My Zsh](https://ohmyz.sh) - 🙏 zsh config framework and all around place-where-zsh-stuff-lives.  

## usage

**go somewhere you dont mind this repo living in:**  
`cd ${FOLDER_WHERE_DOTFILES_WILL_LIVE_FOREVER_PROBABLY_TILDE_IDK_IM_NOT_YOUR_BOSS}`  

**clone the repo:**  
`git clone https://github.com/SalomonSmeke/dotfiles.git`

**go into the repo:**  
`cd dotfiles`  

**install the dotfiles on macos:**  
`./setup.sh macos-install`  

**install the dotfiles elsewhere:**  
`./setup.sh symlink-only`

**update antigen:**  
`./setup.sh antigen-update`  

**print usage:**  
`./setup.sh help`

**print usage but very crypographically secure:**  
`./setup.sh $RANDOM`

## ech

[Copyright (c)](https://github.com/SalomonSmeke/dotfiles/blob/master/LICENSE) 2018 [Salomon Smeke](https://ssmeke.io) with an [MIT License](https://github.com/SalomonSmeke/dotfiles/blob/master/LICENSE)
