## 1. Config steps

https://realpython.com/vim-and-python-a-match-made-in-heaven/

## 2. Command for new vim from repo 

``` bash
$> cd /usr && sudo git clone https://github.com/vim/vim.git && cd vim

$> sudo ./configure --with-features=huge --enable-multibyte --enable-pythoninterp=yes --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ --enable-python3interp=yes --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu/ --enable-gui=gtk2 --enable-cscope --prefix=/usr/local

$> sudo make 
$> sudo make install
```
## Problems
### <b>For clen start for configuration</b>
``` bash
$> sudo make distclean
```

## 3. With problem Auto-Complete and Valloric/YouCompleteMe 

``` bash
$> cd .vim/bundle/YouCompleteMe
$> ./install.py
```
