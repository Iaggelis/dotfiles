" => Line numbers
set relativenumber
set nu
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
colorscheme onedark

" Keep buffer 
set hidden

set nobackup
set nowritebackup
set noswapfile

" " Give more space for displaying messages.
set cmdheight=1

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'jaredgorski/spacecamp'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Plug '~/Documents/projects/Github/basm-vim'
" Initialize plugin system
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline
let g:powerline_pycmd="py3"
"set rtp+=/usr/share/powerline/bindings/vim/
" set rtp+=/usr/lib/python3.9/site-packages/powerline/bindings/vim
set laststatus=2


syntax on   

" let g:rehash256 = 1
" let g:Powerline_symbols='unicode'
" let g:Powerline_theme='solarized'

let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set smarttab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment to autostart the NERDTree
"autocmd vimenter * NERDTree
"map <C-n> :NERDTreeToggle<CR>
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'
"let NERDTreeShowLineNumbers=1
"let NERDTreeShowHidden=1
"let NERDTreeMinimalUI = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Minimap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:minimap_show='<leader>mm'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>mc'
let g:minimap_toggle='<leader>mt'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi LineNr ctermfg=242
hi CursorLineNr ctermfg=15
hi VertSplit ctermfg=8 ctermbg=0
hi Statement ctermfg=3

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set mouse=nicr

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.
set incsearch                   " highlight while searching
"set smartcase

let g:minimap_highlight='Visual'

let g:python_highlight_all = 1
au BufNewFile,BufRead *.md setf markdown
au BufWinEnter * set number
au BufNewFile,BufRead *.tex setf tex

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" LaTeX """""""""""""""""
"""""""""""""""""""""""""""""""""

autocmd FileType tex inoremap ;beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fr:MultipleCursorsFind<Space>DELRN<Enter>c
autocmd FileType tex inoremap ;eq \begin{equation}<Enter><++><Enter>\end{equation}<Enter><Enter><++><Esc>4k0fr:MultipleCursorsFind<Space>DELRN<Enter>c
autocmd FileType tex inoremap ;sec \section*{DELRN}<Enter><++><Enter>\setcounter{equation}{0}<Enter>%%%%%%%%%%%%%%%%%%%%%%%%%%%<Enter><Enter><++><Esc>4k0fr:MultipleCursorsFind<Space>DELRN<Enter>c
"inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
"vnoremap <Space><Space> <Esc>/<++><Enter>"_c4l
"map      <Space><Space> <Esc>/<++><Enter>"_c4l



map <F6> :setlocal spell! spelllang=en_us<CR>
map <F7> :setlocal spell! spelllang=el<CR>

set clipboard=unnamedplus

set backspace=2

set colorcolumn=80

" hi Comment guibg=NONE ctermbg=NONE gui=italic cterm=NONE
" hi SpecialComment guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

" nnoremap <leader>r :%s/\<<C-r><C-w>\>/
nnoremap <space> :Rg<CR>
nnoremap <C-p> :Files<Cr>
noremap <C-l> :GFiles<Cr>
command! -bang ProjectFiles call fzf#vim#files($PWD, <bang>0)
autocmd BufRead,BufNewFile *.basm set filetype=basm

"let mapleader = ","
"set timeoutlen=500


"let g:VM_leader = ','
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-n>'
let g:VM_maps['Find Subword Under'] = '<C-n>'
let g:VM_maps["Select Cursor Down"] = '<C-j>'
let g:VM_maps["Select Cursor Up"]   = '<C-k>'


if has('python')
    map <C-I> :pyf /usr/share/clang/clang-format.py<cr>
    imap <C-I> <c-o>:pyf /usr/share/clang/clang-format.py<cr>
elseif has('python3')
    map <C-I> :py3f /usr/share/clang/clang-format.py<cr>
    imap <C-I> <c-o>:py3f /usr/share/clang/clang-format.py<cr>
endif
