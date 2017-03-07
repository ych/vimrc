vimrc
=====

ych's vimrc

Quick start
-----------

```
git clone https://github.com/ych/vimrc.git ~/vimrc
ln -s ~/vimrc/.vimrc ~/.vimrc
ln -s ~/vimrc/.vim ~/.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```

Enable extra function of plugins(Instructions for Debian-based system only)
-----------------------------------------------------------------

# YouCompleteMe

```
sudo apt install python-dev cmake build-essential python-dev python3-dev
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
```

or
```
sudo add-apt-repository ppa:jonathonf/vim
sudo apt install vim vim-youcompleteme
```
