bash resource config files
==========================

Some basic config files for linux `$HOME` configs, _a la burl_.

## usage

One way that makes this easy to deploy on a new server:

```bash
$ git clone https://github.com/burlresearch/bash
$ for f in bash/*rc; do RC=`basename $f`; echo $f; rm -f .$RC;  ln -s $f .$RC; done
```

## install vim::zen\_coding

### [pathogen](http://www.vim.org/scripts/script.php?script_id=2332)

```bash
$ mkdir -p ~/.vim/autoload ~/.vim/bundle
$ curl 'www.vim.org/scripts/download_script.php?src_id=19375' > ~/.vim/autoload/pathogen.vim
```

### [emmet](http://emmet.io/)

```bash
$ git clone http://github.com/mattn/emmet-vim.git ~/.vim/bundle/emmet-vim
```

