" Liempo's Vimrc
set encoding=utf-8

call plug#begin('~/.vim/plugged')
  " Xcode color scheme
  Plug 'ghifarit53/tokyonight-vim'

  " Vanilla vim appearance
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Code editing
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'preservim/nerdtree'
  Plug 'jiangmiao/auto-pairs'
call plug#end()

" Set real terminal colors
set termguicolors
let g:airline_powerline_fonts = 1
colorscheme tokyonight

" I now hate escape, will replace it by jj
inoremap jj <Esc>
cnoremap jj <Esc>

" Space is the leader key
let mapleader=" "

" Shorter tabs because tabs is 4 spaces
set softtabstop=0 tabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Show numbers
set number

" Automatically removing all trailing whitespace
autocmd BufWritePre <buffer> %s/\s\+$//e

" Get off my lawn (disable arrow keys)
nnoremap <Left> :echoe "Use 'h'"<CR>
nnoremap <Right> :echoe "Use 'l'"<CR>
nnoremap <Up> :echoe "Use 'k'"<CR>
nnoremap <Down> :echoe "Use 'j'"<CR>

" Disable indention on switch (C)
set cinoptions=l1
