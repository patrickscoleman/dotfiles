"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sources (modified):
"                     https://github.com/nikolalsvk/dotfiles/blob/master/.vimrc
"                     https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
" About: https://pragmaticpineapple.com/ultimate-vim-typescript-setup/
" Tutorial: https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/

set nocompatible " be iMproved, required
filetype off     " required

" Keep Plug commands between plug#begin() and plug#end().
call plug#begin()

  Plug 'airblade/vim-gitgutter'     " Show git diff of lines edited
  Plug 'tpope/vim-fugitive'         " Git plugin :G more commands: https://github.com/tpope/vim-fugitive
  Plug 'tpope/vim-rhubarb'          " :GBrowse

  Plug 'mileszs/ack.vim'            " Use ack in Vim
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy search
  Plug 'junegunn/fzf.vim'           " Set up fzf and fzf.vim
  Plug 'preservim/nerdtree'         " Filetree viewer

  Plug 'pangloss/vim-javascript'    " JavaScript support
  Plug 'leafgarland/typescript-vim' " TypeScript syntax
"  Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
"  Plug 'peitalin/vim-jsx-typescript' " TSX syntax
"  Plug 'jparise/vim-graphql'        " GraphQL syntax
  Plug 'styled-components/vim-styled-components'
  Plug 'mattn/emmet-vim'            " HTML & CSS shortcuts

  Plug 'tpope/vim-surround'         " Edit quotes, parens, etc.
  Plug 'tpope/vim-commentary'       " Edit comments
  Plug 'tpope/vim-unimpaired'       " Mappings

  Plug 'neoclide/coc.nvim', { 'branch': 'release' } " Linting and autocomplete

  Plug 'vim-airline/vim-airline'    " Vim powerline

  Plug 'psliwka/vim-smoothie'       " Smooth scrolling

" All of your Plugins must be added before the following line
call plug#end()              " required
filetype plugin indent on    " required

" Leader key is SPACE
let mapleader = " "
set showcmd " Show pressed keys in bottom right

" Look and Feel settings
syntax enable
" syntax sync fromstart
set background=dark
set wildmenu " when opening a file with e.g. :e ~/.vim<TAB> there is a graphical menu of all the matches
set ttyfast
set lazyredraw
set updatetime=300
set cursorline " highlight horizontally
set cursorcolumn " highlight vertically
set hidden " Open other files if current one is not saved

" Color scheme -- location: ~/.vim/colors
" PaperColor -- install: curl -o PaperColor.vim https://raw.githubusercontent.com/NLKNguyen/papercolor-theme/master/colors/PaperColor.vim
colorscheme PaperColor

" Numbers
set number
set numberwidth=4
set ruler

" paste mode with INSERT
nnoremap <Insert> :set invpaste paste?<CR>
set pastetoggle=<Insert>
set showmode

" Indentation
set autoindent
set cindent
set smartindent

" Enable folding
set foldmethod=syntax
set foldlevel=99
nmap z za " Enable folding with z key

" Disable all bells and whistles
set noerrorbells visualbell t_vb=

" Ack tricks
let g:ackprg = 'rg --vimgrep --smart-case --hidden'
" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1
nmap <leader>a :Ack!<Space>
nmap <leader>A :Ack! <cword><CR>

" Tab Options
set shiftwidth=2
set tabstop=2
set softtabstop=2 " Number of spaces a tab counts when editing
set expandtab

" Do not wrap lines
set nowrap

" Delete empty space from the end of lines on every save
autocmd BufWritePre * :%s/\s\+$//e

" Set default encoding to utf-8
set encoding=utf-8
set termencoding=utf-8

" Disable backups and swap files
set nobackup
set nowritebackup
set noswapfile

" Set the commands to save in history default number is 20.
set history=1000

set ignorecase " Ignore case when searching
set smartcase  " When searching try to be smart about cases
set nohlsearch " Don't highlight search term
set incsearch  " Jumping search

" Always show the status line
set laststatus=2

" Allow copy and paste from system clipboard
set clipboard=unnamed

" Spellcheck for features and markdown
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.md.erb setlocal spell
au BufRead,BufNewFile *.feature setlocal spell

" Delete characters outside of insert area
set backspace=indent,eol,start

" +++ Shortcuts +++
" Open Buffer
nnoremap <leader>l :Buffers<CR>
" Open test file for a current file
nnoremap <leader>s :A<CR>
" Open test file for a current file in a vertical window
nnoremap <leader>v :AV<CR>
" Vertically split screen
nnoremap <leader>\ :vs<CR>
" Split screen
nnoremap <leader>/ :split<CR>

" Faster saving and exiting
nnoremap <leader>w :w!<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>x :x<CR>
" Open Vim configuration file for editing

nnoremap <leader>1 :e ~/.vimrc<CR>
" Source Vim configuration file and update plugins
nnoremap <leader>2 :source ~/.vimrc<CR>
nnoremap <leader>3 :PlugUpdate<CR>
nnoremap <leader>4 :CocUpdate<CR>

" Toggle relative line numbers
nnoremap <leader>rn :set relativenumber!<cr>

" If fzf installed using git
set rtp+=~/.fzf
" Map fzf search to CTRL P
nnoremap <C-p> :GFiles<Cr>
" Map fzf + ag search to CTRL G
nnoremap <C-g> :Rg <Cr>

" vim-test shortcut for running tests
nnoremap <leader>; :TestNearest<CR>
nnoremap <leader>' :TestFile<CR>

" Extra <CR> is for disabling /"Press ENTER or type command to continue/"
nnoremap <silent><leader>e :Exp<CR><CR>

" Easier movement between split windows CTRL + {h, j, k, l}
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" CoC extensions
let g:coc_global_extensions = [  'coc-tsserver', 'coc-json',
                               \ 'coc-html', 'coc-css', '@yaegassy/coc-tailwindcss3',
                               \ 'coc-markdownlint', '@yaegassy/coc-nginx']

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Use tab for trigger completion with characters ahead and navigate.
" :CocConfig `"suggest.noselect": true` to not select by default
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Tab should behave normally if no suggestions
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)
nmap [g <Plug>(coc-diagnostic-prev)
nmap ]g <Plug>(coc-diagnostic-next)

" Display documentation
nnoremap K :call CocAction('doHover')<CR>
" Remap keys for applying codeAction to the current buffer.
nmap <leader>c  <Plug>(coc-codeaction)

" Fix some weird error with Fugitive
let g:fugitive_pty = 0

" Fix syntax highlight for Coc plugin floating errors
hi CocErrorFloat guifg=Magenta guibg=Magenta
