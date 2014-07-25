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
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
```

Install extra packages(Instructions for Debian-based system Only)
-----------
# YouCompleteMe

```
sudo aptitude install python-dev cmake build-essential
```

# powerline
```
sudo aptitude install python-pip python-psutil
wget https://github.com/libgit2/libgit2/archive/v0.21.0.tar.gz
tar xf v0.21.0.tar.gz
cd libgit2-0.21.0/
cmake .
make
sudo make install
cd ..
rm -rf v0.21.0.tar.gz libgit2-0.21.0
sudo ldconfig
pip install cffi
pip install pygit2

```
