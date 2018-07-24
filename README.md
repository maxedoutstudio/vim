# vimrc + .vim folder

My current vim setup, up to date as of 07/23/2018.

To be used with [neovim](https://github.com/neovim/neovim), running on [WSL terminal emulator](https://github.com/goreliu/wsl-terminal). Colors are hacked to look right under this setup and may appear weird on other terminal emulators. 

## Setup

1. Clone repository

2. Create the following symbolic links:

```ln -s [REPO]/.vimrc ~/.vimrc```

```ln -s [REPO]/.vim ~/vim```

3. In-order to get it to work with _neovim_, you'll also need these two links:

```ln -s ~/.vim ~/.local/share/nvim```

```ln -s ~/.vimrc ~/.vim/init.vim```

This will effectively make you have one vimrc. In-order to keep regular _vim_ functional, you might need to add checks into your _.vimrc_

4. Open neovim, run ex-command: ```:PlugInstall```

## Troubleshooting

* Problem diagnosis --> Run ```:CheckHealth```

* Common problem: 

> ERROR: has("python3") was not succesful

To fix: run ```pip3 install neovim```
