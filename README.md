## Preinstall
- (vim-plug)[https://github.com/junegunn/vim-plug]
    ```
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    ```
## Dependency
- neovim
- pynvim
- nodejs >= 12.12
    - for neoclide/coc.nvim
- npm
    - for neoclide/coc.nvim
- clangd
    - for clangd/coc-clangd
- typos
    - for neoclide/coc-typos
- global(gtags, gtags-cscope)
    - for ludovicchabant/vim-gutentags

## Install
- git clone https://github.com/ych/vimrc.git ~/vimrc
- mkdir -p ~/.config/nvim
- ln -s ~/.vimrc ~/.config/nvim/init.vim
- ln -s ~/vimrc/.vimrc ~/.vimrc 
- nvim +PlugInstall

## Plugin
- [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim)
- [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)
- [vim-airline/vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
- [Yggdroot/LeaderF](https://github.com/Yggdroot/LeaderF)
- [ludovicchabant/vim-gutentags](https://github.com/ludovicchabant/vim-gutentags)
- [skywind3000/gutentags_plus](https://github.com/skywind3000/gutentags_plus)
- [inkarkat/vim-mark](https://github.com/inkarkat/vim-mark)
- [majutsushi/tagbar](https://github.com/majutsushi/tagbar)
- [tomasiser/vim-code-dark](https://github.com/tomasiser/vim-code-dark)
