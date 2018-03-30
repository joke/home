"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$ZPLUG_REPOS/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.vim/plugins')
  call dein#begin('$HOME/.vim/plugins')

  " Let dein manage dein
  " Required:
  call dein#add('$ZPLUG_REPOS/Shougo/dein.vim')

  call dein#add('tpope/vim-fugitive')
  call dein#add('itchyny/lightline.vim')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('lambdalisue/vim-manpager')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

set hidden
