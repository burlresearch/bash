set ic
set nobackup
set nowritebackup
set noswapfile 
set dir=/tmp
set backupdir=/tmp

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
" set smarttab

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

