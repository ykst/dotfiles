" $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
call plug#begin('~/.vim/plugged')
Plug 'yegappan/grep'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'ykst/my.vim'
call plug#end()
