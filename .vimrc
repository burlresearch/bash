set dir=/tmp
set backupdir=/tmp
set nobackup
set nowritebackup
set ic

set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab

set guifont=Monospace\ 9
set guioptions=egmrL
set textwidth=256

setl noai nocin nosi inde=

map <F8> A/* XXX */ 
map <F9> :%s/\s\+$//
map <S-F9> :%s/^\n\+/\r/

set number

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

autocmd BufWritePost *.md,*.text,*.rst silent !/home/scott/bin/markdown % > %.html

call pathogen#infect() 
