set lines=60
set columns=110

" tab -> spaces
set noexpandtab     " expand tabs to equivalent spaces
set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'
set shiftwidth=4    " number of spaces to use for autoindenting
set smarttab        " insert tabs on the start of a line according to shiftwidth, not tabstop
set softtabstop=4   " tab size when insterting/pasting
set tabstop=4       " a tab is N spaces
set autoread		" Auto read when a file is changed on disk

colors ron

autocmd BufWritePost *.tex !latex %

