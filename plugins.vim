" source this from .vimrc for vundle plugin management
"
" set the runtime path; include Vundle + initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-vinegar'
Plugin 'jamessan/vim-gnupg'
Plugin 'tpope/vim-surround'

call vundle#end()               " required
filetype plugin indent on       " required

" GitHub clone plugins... (and uncomment above)
" cd ~/.vim/bundle/
" git clone https://github.com/tpope/vim-vinegar
" git clone https://github.com/scrooloose/nerdtree
" git clone https://github.com/ctrlpvim/ctrlp.vim
" git clone https://github.com/2072/PHP-Indenting-for-VIm
" git clone https://github.com/mattn/emmet-vim
" git clone https://github.com/jamessan/vim-gnupg
" git clone https://github.com/tpope/vim-surround
" or from here,
" git clone https://github.com/tpope/vim-surround bundle/vim-surround

