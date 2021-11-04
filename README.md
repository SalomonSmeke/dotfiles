# dotfiles

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/f0ffa83475c64736a9c9eb7ab420233e)](https://www.codacy.com/app/ssmeke/dotfiles?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=SalomonSmeke/dotfiles&amp;utm_campaign=Badge_Grade)

[dotfiles](https://askubuntu.com/questions/94780/what-are-dot-files), and some scripts to automate macos setup. Now very fast!

```bash
beep boop
[~] repeat 3 {time zsh -il -c exit}                                                                
zsh -il -c exit  0.01s user 0.01s system 90% cpu 0.027 total
zsh -il -c exit  0.01s user 0.01s system 91% cpu 0.026 total
zsh -il -c exit  0.01s user 0.01s system 91% cpu 0.026 total
```

inspired by [gmoe](https://github.com/gmoe)'s [dotfiles](https://github.com/gmoe/dotfiles), a 🍯🐝/🍯🐝 guy.

## batteries

[Brew](https://brew.sh) - 👌 macos package manager.  
[Zsh](http://www.zsh.org) - 💪 shell.  
[Zgenom](https://github.com/jandamm/zgenom) - 🏎 plugin manager for zsh.  
[Various zsh plugins](https://github.com/SalomonSmeke/dotfiles/blob/master/setup.sh).

## usage

**go somewhere you dont mind this repo living in:**  
```shell
cd ${FOLDER_WHERE_DOTFILES_WILL_LIVE_FOREVER_PROBABLY_TILDE_IDK_IM_NOT_YOUR_BOSS}
```  

**clone the repo:**  
```shell
git clone https://github.com/SalomonSmeke/dotfiles.git .dotfiles
```

**go into the repo:**  
```shell
cd .dotfiles
```  

**install the dotfiles and zsh plugins:**  
```shell
./setup.sh init
```  

**update zsh plugins:**  
```shell
./setup.sh zsh-plugins
```

**install some brew 🍺 packages:**
```shell
cd .dotfiles
brew bundle
```

**print usage:**  
```shell
./setup.sh help
```

**print usage but very [cryptographically secure](https://www.youtube.com/watch?v=KEkrWRHCDQU):**  
```shell
./setup.sh $RANDOM
```  

## ech

[Copyright (c)](https://github.com/SalomonSmeke/dotfiles/blob/master/LICENSE) 2018-2019 [Salomon Smeke Cohen](https://ssmeke.io) with an [MIT License](https://github.com/SalomonSmeke/dotfiles/blob/master/LICENSE)
