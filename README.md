bash resource config files
===

Some basic config files for linux `$HOME` configs, _a la Scott_.

## usage

One way that makes this easy to deploy on a new server:

```bash
$ git clone https://github.com/burlresearch/bash
$ ln -s bash/.bashrc .
$ ln -s bash/…

$ # or do link all at once:
$ for f in bash/.[a-z]*; do echo $f; rm -f `basename $f`; ln -s $f .; done
$
```
