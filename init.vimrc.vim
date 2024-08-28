" Added by install-nvim.sh on Sun Oct 16 07:47:23 AM UTC 2022
" check for vim-plug install if needed
" https://github.com/junegunn/vim-plug/issues/739
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
