.vim
====

My vim dot files. the `.vimrc` file is saved to [vimrc](https://github.com/burugux/.vim/blob/master/vimrc).

Just run the following commands via terminal to get perfectly set up:

```console
$ cd ~/
$ git clone --recursive https://github.com/burugux/.vim.git .vim
$ ln -sf $HOME/.vim/vimrc $HOME/.vimrc
$ cd $HOME/.vim
$ git submodule update --init
```
Adding a repo as a submodule.
==============================
```git submodule add https://github.com/user/repo.git bundle/repo```
