set nocompatible	" be iMproved, required

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

setl noai nocin nosi inde=
set splitbelow
set splitright
set number			" line numbering


"----------Mappings----------"

nmap <Leader>ev :e ~/.vimrc<cr>
nmap <D-1> :NERDTreeToggle<cr>

map <F8> A/* XXX */
map <F9> :%s/\s\+$//
map <S-F9> :%s/^\n\+/\r/
nmap <F5> a<C-R>=strftime("%Y.%m.%d %a %I:%M %p")<CR><Esc>
imap <F5> <C-R>=strftime("%Y.%m.%d %a %I:%M %p")<CR>

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

