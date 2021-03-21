" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-fugitive', {'branch': 'master'}
Plug 'tpope/vim-commentary', {'branch': 'master'}
Plug 'yggdroot/indentline'


Plug 'rakr/vim-one'
Plug 'gruvbox-community/gruvbox'
Plug 'jaredgorski/spacecamp'
Plug 'ayu-theme/ayu-vim'
" Plug '~/Documents/projects/Github/basm-vim'
if has('nvim')
    Plug 'neovim/nvim-lspconfig'
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'nvim-lua/completion-nvim'
endif
" Initialize plugin system
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead,BufNewFile *.basm set filetype=basm


let g:spaceline_seperate_style = 'arrow'

" Line numbers
set relativenumber
set nu
set nowrap

set t_Co=256
colorscheme gruvbox
set background=dark

set nohlsearch
" Keep buffer
set hidden

set nobackup
set nowritebackup
set noswapfile

" " Give more space for displaying messages.
set cmdheight=1

syntax on

let g:netrw_browse_split=2
let g:netrw_banner=0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline
"let g:powerline_pycmd="py3"
"set rtp+=/usr/share/powerline/bindings/vim/
" set rtp+=/usr/lib/python3.9/site-packages/powerline/bindings/vim
set laststatus=2
" let g:rehash256 = 1
" let g:Powerline_symbols='unicode'
" let g:Powerline_theme='solarized'

let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

set noshowmode

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set smarttab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Minimap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:minimap_show='<leader>mm'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>mc'
let g:minimap_toggle='<leader>mt'
let g:minimap_highlight='Visual'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi LineNr ctermfg=242
hi CursorLineNr ctermfg=15
hi VertSplit ctermfg=8 ctermbg=0
hi Statement ctermfg=3

" hi Comment guibg=NONE ctermbg=NONE gui=italic cterm=NONE
" hi SpecialComment guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

set splitbelow splitright

set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.
set incsearch                   " highlight while searching
"set smartcase


let g:python_highlight_all = 1
au BufNewFile,BufRead *.md setf markdown
au BufWinEnter * set number
au BufNewFile,BufRead *.tex setf tex


set clipboard=unnamedplus

set backspace=2

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

set mouse=c

let g:indentLine_char_list = ['|', '|', '|', '|']
set tags+=./tags;/
set tags+=/home/john/.vimrc/tags

map <F6> :setlocal spell! spelllang=en_us<CR>
map <F7> :setlocal spell! spelllang=el<CR>



"let mapleader = ","
"set timeoutlen=500

" vim-visual-multi
"let g:VM_leader = ','
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-n>'
let g:VM_maps['Find Subword Under'] = '<C-n>'
let g:VM_maps["Select Cursor Down"] = '<C-j>'
let g:VM_maps["Select Cursor Up"]   = '<C-k>'

" clang-format
if has('python')
    nmap <C-I> :pyf /usr/share/clang/clang-format.py<cr>
    "imap <C-I> <c-o>:pyf /usr/share/clang/clang-format.py<cr>
elseif has('python3')
    nmap <C-I> :py3f /usr/share/clang/clang-format.py<cr>
    "imap <C-I> <c-o>:py3f /usr/share/clang/clang-format.py<cr>
endif

" feel like fugitive
nmap <leader>gs :G<CR>


" fzf
" nnoremap <leader>r :%s/\<<C-r><C-w>\>/
nnoremap <space> :Rg<CR>
nnoremap <C-p> :Files<Cr>
nnoremap <leader>b :Buffers<Cr>
noremap <C-l> :GFiles<Cr>
command! -bang ProjectFiles call fzf#vim#files($PWD, <bang>0)
" fly between buffers
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>D :bd!<CR>


"" LaTeX
autocmd FileType tex inoremap ;beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fr:MultipleCursorsFind<Space>DELRN<Enter>c
autocmd FileType tex inoremap ;eq \begin{equation}<Enter><++><Enter>\end{equation}<Enter><Enter><++><Esc>4k0fr:MultipleCursorsFind<Space>DELRN<Enter>c
autocmd FileType tex inoremap ;sec \section*{DELRN}<Enter><++><Enter>\setcounter{equation}{0}<Enter>%%%%%%%%%%%%%%%%%%%%%%%%%%%<Enter><Enter><++><Esc>4k0fr:MultipleCursorsFind<Space>DELRN<Enter>c
"inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
"vnoremap <Space><Space> <Esc>/<++><Enter>"_c4l
"map      <Space><Space> <Esc>/<++><Enter>"_c4l
