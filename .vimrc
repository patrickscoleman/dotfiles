set nocompatible " be iMproved, required
filetype off     " required

call plug#begin('~/.vim/plugged')
  Plug 'sheerun/vim-polyglot'       " Multi-language syntax highlighting
  Plug 'tpope/vim-surround'         " Edit quotes, parens, html tags, etc.
  Plug 'tpope/vim-commentary'       " Edit comments
  Plug 'NLKNguyen/papercolor-theme' " Color scheme
call plug#end()

filetype plugin indent on

" Leader key is SPACE
let mapleader = " "
set showcmd " Show pressed keys in bottom right

" Look and Feel settings
syntax enable
set background=dark
colorscheme PaperColor
set cursorline " highlight horizontally
set cursorcolumn " highlight vertically
set hidden " Open other files if current one is not saved
set nowrap " do not wrap lines

" Set default encoding to utf-8
set encoding=utf-8
set termencoding=utf-8

" Numbers
set number
set relativenumber
set numberwidth=4
set ruler

" Toggle relative line numbers
nnoremap <leader>rn :set relativenumber!<cr>

" Indentation
set autoindent
set cindent
set smartindent
set shiftwidth=2
set tabstop=2
set softtabstop=2 " Number of spaces a tab counts when editing
set expandtab

" Disable all bells and whistles
set noerrorbells visualbell t_vb=

" Paste mode
nnoremap <leader>p :set invpaste paste?<CR>
set showmode

set ignorecase " Ignore case when searching
set smartcase  " When searching try to be smart about cases
set hlsearch   " Highlight search term
set incsearch  " Jumping search
nnoremap <expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

" Set the commands to save in history default number is 20.
set history=1000

" Disable backups and swap files
set nobackup
set nowritebackup
set noswapfile

" Allow copy and paste from system clipboard
set clipboard^=unnamed,unnamedplus

" Faster saving and exiting
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>
