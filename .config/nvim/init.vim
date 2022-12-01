" PATRICK COLEMAN'S neovim config
" last updated 2022.11.23

call plug#begin('~/.vim/plugged')

  Plug 'airblade/vim-gitgutter'     " Show git diff of lines edited
  Plug 'tpope/vim-fugitive'         " Git plugin :G more commands
  Plug 'tpope/vim-rhubarb'          " :GBrowse

  Plug 'mileszs/ack.vim'            " Use ack in Vim
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy search
  Plug 'junegunn/fzf.vim'           " Set up fzf and fzf.vim

  Plug 'preservim/nerdtree'         " File explorer
  Plug 'ryanoasis/vim-devicons'     " Filetype icons
  Plug 'Xuyuanp/nerdtree-git-plugin' " Git status in NERDTree

  Plug 'sheerun/vim-polyglot'       " Multi-language syntax highlighting
  Plug 'mattn/emmet-vim'            " HTML & CSS shortcuts
  Plug 'tpope/vim-characterize'     " Shows additional character & emoji data on `ga`

  Plug 'AndrewRadev/tagalong'       " Automatically change closing tags if you edit an opening tag and vice versa
  Plug 'tpope/vim-surround'         " Edit quotes, parens, etc.
  Plug 'tpope/vim-commentary'       " Edit comments
  Plug 'tpope/vim-unimpaired'       " Additional mappings

  Plug 'tpope/vim-dadbod'           " Query databases from any vim buffer
  Plug 'vim-test/vim-test'          " Multi-language testing

  Plug 'neoclide/coc.nvim', { 'branch': 'release' } " Linting and autocomplete

  Plug 'vim-airline/vim-airline'    " Vim powerline
  Plug 'NLKNguyen/papercolor-theme' " Color scheme

call plug#end()              " required

" Leader key is SPACE
let mapleader = " "
set showcmd " Show pressed keys in bottom right

" Look and Feel settings
set background=dark
colorscheme PaperColor
set wildmenu " command line completion with tab
set lazyredraw " buffer screen updates instead of always updating, avoids choppiness when scrolling
set updatetime=300 " time after typing before vim calls plugins, improves speed of CoC, etc.
set cursorline " highlight horizontally
set cursorcolumn " highlight vertically

" Numbers
set number " show line numbers
set numberwidth=4 " number of spaces in the gutter

" Paste mode
nnoremap <leader>p :set invpaste paste?<CR>
set pastetoggle=<Insert>
set showmode

" Folding
set foldmethod=syntax
set foldlevel=99 " open files unfolded by default
" Enable folding with with z key
nmap z za

" Disable all bells and whistles
set noerrorbells visualbell t_vb=

" Ack tricks
let g:ackprg = 'rg --vimgrep --smart-case --hidden'
" Any empty ack search will search for the word the cursor is on
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

" Disable backups and swap files
set nobackup
set nowritebackup
set noswapfile

" Set the commands to save in history default number is 20.
set history=1000

set ignorecase " Ignore case when searching
set smartcase  " If you search with one or more capitalized letters, do not ignore case
set nohlsearch " Don't highlight search term after pressing enter
set incsearch  " Highlight search term as you type

" Always show the status line
set laststatus=2

" Allow copy and paste from system clipboard
set clipboard^=unnamed,unnamedplus

" Spellcheck for markdown
au BufRead,BufNewFile *.md setlocal spell

" Delete characters outside of insert area
set backspace=indent,eol,start

" Only use Emmet in html, css, svelte files
let g:user_emmet_install_global = 0
autocmd FileType html,css,svelte EmmetInstall

" Display messages when tagalong automatically changes tags
let g:tagalong_verbose = 1

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
nnoremap <leader>1 :e ~/.config/nvim/init.vim<CR>
" Source Vim configuration file and update plugins
nnoremap <leader>2 :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>3 :PlugUpdate<CR>
nnoremap <leader>4 :CocUpdate<CR>

" Toggle relative line numbers
nnoremap <leader>rn :set relativenumber!<cr>

" NERDTree
let NERDTreeShowHidden=1 " always show hidden files
nnoremap <leader>t :NERDTreeToggle<CR>

" If fzf installed using git
set rtp+=~/.fzf
" Map fzf search to CTRL P
nnoremap <C-p> :GFiles<Cr>
" Map fzf + ag search to CTRL G
nnoremap <C-g> :Rg <Cr>

" vim-test shortcut for running tests
nnoremap <leader>; :TestNearest<CR>
nnoremap <leader>' :TestFile<CR>

" Open file explorer in current folder. Extra <CR> is for disabling /"Press ENTER or type command to continue/"
nnoremap <silent><leader>e :Exp<CR><CR>

" Easier movement between split windows CTRL + {h, j, k, l}
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" CoC extensions
let g:coc_global_extensions = [  'coc-tsserver', 'coc-json',
                               \ 'coc-svelte',
                               \ 'coc-html', 'coc-css', '@yaegassy/coc-tailwindcss3',
                               \ 'coc-markdownlint',
                               \ '@yaegassy/coc-nginx']

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

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
inoremap <silent><expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

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

" Display CoC documentation
nnoremap K :call CocAction('doHover')<CR>
" Remap keys for applying codeAction to the current buffer.
nmap <leader>c  <Plug>(coc-codeaction)
