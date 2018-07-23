# vimrc + .vim folder

My current vim setup, up to date as of 07/23/2018.

To be used with [neovim](https://github.com/neovim/neovim).

## Setup

1. Clone repository

2. Create the following symbolic links:

```ln -s [REPO]/.vimrc ~/.vimrc```
```ln -s [REPO]/.vim ~/vim```

3. In-order to get it to work with _neovim_, you'll also need these two links:

```ln -s ~/.local/share/nvim ~/.vim```
```ln -s ~/.vim/init.vim ~/.vimrc```

This will effectively make you have one vimrc. In-order to keep regular _vim_ functional, you might need to add checks into your _.vimrc_
