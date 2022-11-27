## Preinstall
- (vim-plug)[https://github.com/junegunn/vim-plug]
    ```
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    ```
## Dependency
- neovim
- pynvim
- nodejs >= 14.14
    - for neoclide/coc.nvim
- npm
    - for neoclide/coc.nvim
- clangd
    - for clangd/coc-clangd
- typos
    - for neoclide/coc-typos
- fzf
    - for ibhagwan/fzf-lua

## Install
- git clone https://github.com/ych/vimrc.git ~/vimrc
- mkdir -p ~/.config/nvim
- ln -s ~/vimrc/.vimrc ~/.config/nvim/init.vim
- nvim +PlugInstall

## Plugin
- [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim)
- [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)
- [vim-airline/vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
- [ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua)
- [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
- [inkarkat/vim-mark](https://github.com/inkarkat/vim-mark)
- [inkarkat/vim-ingo-library](https://github.com/inkarkat/vim-ingo-library)
- [majutsushi/tagbar](https://github.com/majutsushi/tagbar)
- [tomasiser/vim-code-dark](https://github.com/tomasiser/vim-code-dark)
- [Yggdroot/indentLine](https://github.com/Yggdroot/indentLine)
- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
