<<<<<<< HEAD
filetype off                  " required

=======
" source this from .vimrc for vundle plugin management
"
>>>>>>> 3dc4d900fef9120ea127da486c89b0b2d5275145
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()            " required
filetype plugin indent on    " required
