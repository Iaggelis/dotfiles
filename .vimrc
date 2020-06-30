" TextEdit might fail if hidden is not set.
set hidden
"
" " Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
"
" " Give more space for displaying messages.
set cmdheight=1

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
""Plug 'christoomey/vim-tmux-navigator'
Plug 'morhetz/gruvbox'
Plug 'jaredgorski/spacecamp'
" Initialize plugin system
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap ESC to ii
:imap ii <Esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline
let g:powerline_pycmd="py3"
"set rtp+=/usr/share/powerline/bindings/vim/
set rtp+=/usr/lib/python3.8/site-packages/powerline/bindings/vim
" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
colorscheme spacecamp_lite 

syntax on   
set relativenumber
let g:rehash256 = 1
let g:Powerline_symbols='unicode'
let g:Powerline_theme='long'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='angr'

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment to autostart the NERDTree
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Minimap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:minimap_show='<Leader>mm'
let g:minimap_update='<Leader>mu'
let g:minimap_close='<Leader>mc'
let g:minimap_toggle='<Leader>mt'


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
"set mouse=nicr

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.
set incsearch
set nobackup
set noswapfile

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

set clipboard+=unnamedplus
"inoremap <silent><expr> <TAB>
"            \ pumvisible() ? "\<C-n>" :
"            \ <SID>check_back_space() ? "\<TAB>" :
"            \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"function! s:check_back_space() abort
"    let col = col('.') - 1
"    return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()
