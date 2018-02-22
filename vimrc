" Vundle Install
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Launch vim and run :PluginInstall
" To install from command line: vim +PluginInstall +qall
so ~/.vim/plugins.vim

set nobackup
set nowritebackup
set noswapfile
set dir=/tmp
set backupdir=/tmp

" Search Settings
set incsearch   " show search matches as you type
set ignorecase  " case insensitive search
set smartcase   " If a capital letter is included in search, make it case-sensitive
set hlsearch    " dont highlight search results

" tab -> spaces
set noexpandtab     " expand tabs to equivalent spaces
set shiftround      " use <shiftwidth> multiples when indenting with '<' and '>'
set shiftwidth=4    " number of spaces to use for autoindenting
set tabstop=4       " a tab is N spaces
set softtabstop=4   " tab size when insterting/pasting
set modeline
set modelines=3

" Auto read when a file is changed on disk
set autoread
set autowriteall		" automatically write file on buffer blur

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
" {imap, nmap}: {insert, normal}-mode

nmap <F5> a<C-R>=strftime("%F %a %H:%M")<CR><Esc> " F5: datestamps
imap <F5> <C-R>=strftime("%F %a %H:%M")<CR> " F5: datestamps
map <F8> :%s;\v(.*/).*;\1; " F8 to strip filenames from directories
map <F9> :%s/\s\+$// " F9 to rtrim('\s')
map <S-F9> :%s/^\n\+/\r/ " S-F9 to collapse newlines
map <C-n> :NERDTreeToggle<CR>

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

" Pathogen
" Pathogen allows autoloading plugins like emmet::zen_coding for vim.
" -- not default --
" call pathogen#infect()

" auto remove whitespace on buffer save
autocmd! BufWrite * mark ' | silent! %s/\s\+$// | norm ''

au BufRead,BufNewFile *.md set filetype=markdown

" Notes and Tips
" <Leader> - '\' until set via `let mapleader=,`
let mapleader=","


let g:php_cs_fixer_path = "~/.composer/vendor/bin/php-cs-fixer"
let g:php_cs_fixer_rules = "@PSR2"

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

