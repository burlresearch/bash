" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
set nocompatible              " be iMproved, required
filetype off                  " required

" Launch vim and run :PluginInstall
" To install from command line: vim +PluginInstall +qall
"
so ~/.vim/plugins.vim

" :filetype on

set nobackup
set nowritebackup
set noswapfile
set dir=/tmp
set backupdir=/tmp

" Search Settings
set incsearch   " show search matches as you type
set ignorecase  " case insensitive search
set smartcase   " If a capital letter is included in search, make it case-sensitive
set nohlsearch  " dont highlight search results

" tab -> spaces
set expandtab		" expand tabs to equivalent spaces
set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'
set shiftwidth=2    " number of spaces to use for autoindenting
set tabstop=2       " a tab is N spaces
set softtabstop=2   " tab size when insterting/pasting

" Auto read when a file is changed on disk
set autoread

" scroll buffer when this close to boundary
set scrolloff=2
set guifont=Monospace\ 9
set guioptions=egmrL
set textwidth=0
set wrapmargin=0
set noai
set nocin
set nosi
set inde=
set splitbelow
set splitright
set number			" line numbering


"----------Mappings----------"
" F5 for datestamps
" F8 to strip filenames from directories
" F9 to rtrim('\s')
" S-F9 to collapse newlines
" fdm4 change line token map: <F8> A/* XXX */
nmap <F5> a<C-R>=strftime("%F %a %H:%M")<CR><Esc>
imap <F5> <C-R>=strftime("%F %a %H:%M")<CR>
map <F8> :%s;\v(.*/).*;\1;
map <F9> :%s/\s\+$//
map <S-F9> :%s/^\n\+/\r/

"----------Laravel----------"

nmap <Leader>lr :e app/Http/routes.php<cr>


"----------Functions----------"

function! WordFrequency() range
  let all = split(join(getline(a:firstline, a:lastline)), '\A\+')
  let frequencies = {}
  for word in all
    let frequencies[word] = get(frequencies, word, 0) + 1
  endfor
  new
  setlocal buftype=nofile bufhidden=hide noswapfile tabstop=20
  for [key,value] in items(frequencies)
    call append('$', key."\t".value)
  endfor
  sort i
endfunction
command! -range=% WordFrequency <line1>,<line2>call WordFrequency()

" Automatically processes
" markdown files on bufwrite.
"autocmd BufWritePost *.md,*.text,*.rst silent !/home/scott/bin/markdown % > %.html
" latex compile
"autocmd BufWritePost *.tex !latex %

" Pathogen allows autoloading plugins like emmet::zen_coding for vim.
" -- not default --
" call pathogen#infect()

" auto remove whitespace on buffer save
autocmd! BufWrite * mark ' | silent! %s/\s\+$// | norm ''

au BufRead,BufNewFile *.md set filetype=markdown


" Notes and Tips
" <Leader> - '\' until set via `let mapleader=,`
" zz - center the line under the curson
" imap - napping in insert-mode
" nmap - mapping in normal-mode

