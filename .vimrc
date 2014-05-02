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
set noexpandtab
set tabstop=4       " a tab is 2 spaces
set softtabstop=4   " tab size when insterting/pasting
set shiftwidth=4    " number of spaces to use for autoindenting
set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab        " insert tabs on the start of a line according to shiftwidth, not tabstop

" Auto read when a file is changed on disk
set autoread

" scroll buffer when this close to boundary
set scrolloff=2

set guifont=Monospace\ 9
set guioptions=egmrL
set textwidth=256

setl noai nocin nosi inde=

map <F8> A/* XXX */
map <F9> :%s/\s\+$//
map <S-F9> :%s/^\n\+/\r/

set number

nmap <F5> a<C-R>=strftime("%Y.%m.%d %a %I:%M %p")<CR><Esc>
imap <F5> <C-R>=strftime("%Y.%m.%d %a %I:%M %p")<CR>

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
call pathogen#infect()

" auto remove whitespace on buffer save
autocmd! BufWrite * mark ' | silent! %s/\s\+$// | norm ''

au BufRead,BufNewFile *.md set filetype=markdown
