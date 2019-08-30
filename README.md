# dotfiles

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/f0ffa83475c64736a9c9eb7ab420233e)](https://www.codacy.com/app/ssmeke/dotfiles?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=SalomonSmeke/dotfiles&amp;utm_campaign=Badge_Grade)

[dotfiles](https://askubuntu.com/questions/94780/what-are-dot-files), and some scripts to automate macos setup.

inspired by [gmoe](https://github.com/gmoe)'s [dotfiles](https://github.com/gmoe/dotfiles), a 🍯🐝/🍯🐝 guy.

## batteries

[Brew](https://brew.sh) - 👌 macos package manager.  
[Zsh](http://www.zsh.org) - 💪 shell.  
[Antibody](https://getantibody.github.io) - 🏎️ plugin manager for zsh.  
[Oh My Zsh](https://ohmyz.sh) - 🙏 zsh config framework and all around place-where-zsh-stuff-lives.  
[Various zsh plugins](https://github.com/SalomonSmeke/dotfiles/blob/master/.zsh_antibody_plugins.txt) - 📖 Look in here for a full list. (Attribution soon!)

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
./setup.sh macos
```  

**install the dotfiles elsewhere:**  
```shell
./setup.sh symlink
```

**update antibody/modules:**  
```shell
./setup.sh antibody-update
```  

**install some brew 🍺 packages:**
<details>
  <summary>these ones</summary>

  ## tap
  [ack](https://github.com/beyondgrep/ack3) - 🧞 Excellent and human search tool.  
  [bat](https://github.com/sharkdp/bat) - 🦇 Who knew you needed a "better `cat`"?  
  [exa](https://github.com/ogham/exa) - 🤖 Same, but for `ls`.  
  [htop](https://github.com/hishamhm/htop) - 📊 Same, but for `top`.  
  [python](https://github.com/python/cpython) - 🐍 A programming/scripting language that ships with everything, but we want a newer version.  
  [sl](https://github.com/mtoyoda/sl) - 🚂 ls(1) backwards don't do it.  
  [tmux](https://github.com/tmux/tmux) - 🎛️ Screen, but better. Look [here for a cheatsheet](http://tmuxcheatsheet.com).  
  [vim](https://www.vim.org) - 👩‍🏫 Text editor of the past and future. [Hey nice another cheatsheet](https://vim.rtorr.com).  
  [asciinema](https://asciinema.org) - 📷 Record your shell and share it! [Get started with this, a guide](https://asciinema.org/docs/how-it-works).  
  [nvm](https://github.com/nvm-sh/nvm) - 🗂️ Manage node versions like a sane person.  
  [tree](http://mama.indstate.edu/users/ice/tree/) - 🌳 ~Look like a l33t hacker~ Print out a directory's structure.  

  ## cask
  [atom](https://github.com/atom) - ⚛️ Speedy, hackable, super well maintained text editor. Like [VSCode](https://github.com/microsoft/vscode) but not ugly and with [tree-sitter](https://github.com/tree-sitter/tree-sitter) (just messing with you).  
  [disk-inventory-x](http://www.derlien.com) - 💽 Neat viz tool that shows you where your storage space went.  
  [firefox](https://www.mozilla.org/en-US/firefox/) - 🦊 The fastest browser that isn't data mining you (yet).  
  [image-optim](https://imageoptim.com/mac) - 🖼️ I think they put it best: "ImageOptim makes images load faster".  
  [onyx](https://www.titanium-software.fr/en/onyx.html) - ⛏️ MacOS toolkit.  
  [vlc](https://www.videolan.org/vlc/index.html) - 📺 Masterful media player (Remember the `codec` days? lol).  

</details>

```shell
./setup.sh brew-packages
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

[Copyright (c)](https://github.com/SalomonSmeke/dotfiles/blob/master/LICENSE) 2018 [Salomon Smeke](https://ssmeke.io) with an [MIT License](https://github.com/SalomonSmeke/dotfiles/blob/master/LICENSE)
