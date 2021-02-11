" VUNDLE START
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " Package manager (Outdated, should switch)
Plugin 'morhetz/gruvbox' " Colorscheme
Plugin 'junegunn/fzf.vim' " I don't really use fzf... 
Plugin 'francoiscabrol/ranger.vim' " It's Ranger!
Plugin 'scrooloose/nerdcommenter' " Quick (un)commenting
Plugin 'junegunn/goyo.vim' " Reading mode (:Goyo)
Plugin 'itchyny/lightline.vim' " Improved statusbar
Plugin 'lervag/vimtex' " Latex compilation in vim
Plugin 'SirVer/ultisnips' " Snippets with tab completion
Plugin 'arcticicestudio/nord-vim' " Colorscheme
Plugin 'tikhomirov/vim-glsl' "GLSL syntax highlighting
Plugin 'xolox/vim-misc' " IDK?
Plugin 'octol/vim-cpp-enhanced-highlight' " cpp syntax highlighting
Plugin 'rafi/awesome-vim-colorschemes' " Bunch of different colorschemes
Plugin 'peitalin/vim-jsx-typescript' "typescript syntax highlighting
Plugin 'Yggdroot/indentLine' " Indendation visualization
Plugin 'sheerun/vim-polyglot'
Plugin 'Vimjas/vim-python-pep8-indent' " pep8 autoindentation
Plugin 'tpope/vim-fireplace' " Clojure nRepl Integration
Plugin 'guns/vim-sexp' " S-expression editing (Clojure)
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'tpope/vim-surround' " Modify surrounding elems (parens, quotes etc)
Plugin 'tpope/vim-repeat' " Improved repeat (.)
Plugin 'luochen1990/rainbow' " Rainbox parens
Plugin 'dense-analysis/ale' " LSP Async Linting
Plugin 'majutsushi/tagbar' " ctags browser
" Plugin 'shougo/deoplete.nvim' " LSP Async Completion
" Plugin 'roxma/nvim-yarp' " Deoplete Dependency
" Plugin 'roxma/vim-hug-neovim-rpc' " Deoplete Dependency
call vundle#end()
" VUNDLE END

filetype plugin indent on
set nocompatible
set linebreak
set breakindent
set autoindent
syntax on
set number
set mouse=a
set autochdir
colorscheme hybrid_material
let g:rainbow_active = 1
set enc=utf-8
set fileencoding=utf-8
let mapleader = "\<Space>"


" CTAGS settings
nmap <F8> :TagbarToggle<CR>
nnoremap <leader>a <C-]>

" Swap Dir
set directory^=$HOME/.vim/tmp//

" Turn off that stupid beep
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" SHORTCUTS
cnoreabbrev W w
cnoreabbrev qq qa

" PYTHON FUNCTIONS
com! FormatXML  :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"
com! FormatJSON :%!python -m json.tool

inoremap jk <ESC>
inoremap JK <ESC>
inoremap jj <ESC>
inoremap JJ <ESC>

"Proper comment highlighting for Coc
autocmd FileType json syntax match Comment +\/\/.\+$+

" Insert character
:nnoremap <Space> i<Space><Esc>r

nnoremap <silent> <leader>wd :tabe %<CR>

" Binds Enter to newline.
noremap <CR> o<Esc>

"sets cursorline in focused window
augroup CursorLine
  au!
  au VimEnter * setlocal cursorline
  au WinEnter * setlocal cursorline
  au BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

hi clear CursorLine
augroup CLClear
  autocmd! ColorScheme * hi clear CursorLine
augroup END

hi CursorLineNR cterm=bold
augroup CLNRSet
  autocmd! ColorScheme * hi CursorLineNR cterm=bold
augroup END
set cursorline

" binds edit/reload .vimrc to \ev and \sv
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

"TAB SETTINGS
   " show existing tab with 2 spaces width
   set tabstop=2
   " when indenting with '>', use 2 spaces width
   set shiftwidth=2
   " On pressing tab, insert 2 spaces
   set expandtab


" SPLIT SETTINGS
  " rebind split navigation
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>
  "new split opens below or to the right
  set splitbelow
  set splitright
  " maps Shift-[h,j,k,l] to resizing a window split
  " map <silent> <S-h> <C-w><
  " " map <silent> <S-j> <C-W>-
  " map <silent> <S-k> <C-W>+
  " map <silent> <S-l> <C-w>>

" NERDComment SETTINGS
  " Add spaces after comment delimiters by default
  let g:NERDSpaceDelims = 1

  " Use compact syntax for prettified multi-line comments
  let g:NERDCompactSexyComs = 1

  " Align line-wise comment delimiters flush left instead of following code indentation
  let g:NERDDefaultAlign = 'left'
  nnoremap <leader>sc :call NERDComment(0,"toggle")<CR>
  " For visual (multiline)
  vnoremap <leader>sc :call NERDComment(0,"toggle")<CR>

" Gruvbox day/night mode toggle bound to F9
let g:bg_flag = 0
function! ToggleDayNight()
  if (!g:bg_flag)
    set background=light
    let g:bg_flag = 1
      else
        set background=dark
        let g:bg_flag = 0
  endif
endfunction
nnoremap <silent> <F9> :call ToggleDayNight()<CR>


" LIGHTLINE
  set laststatus=1
  let g:lightline = {
        \ 'colorscheme': 'jellybeans',
        \ }

" Unbreaks vim-markdown folding + It looks better
let g:vim_markdown_folding_style_pythonic = 1
" Open markdown files with Chromium
autocmd BufEnter *.md exe 'noremap <F5> :!/usr/bin/chromium %:p<CR>'

" VIMTEX
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
" set conceallevel=1
" let g:tex_conceal='abdmg'

" ULTISNIPS
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"Make vim transparent
" hi NonText ctermbg=none
" hi Normal guibg=NONE ctermbg=NONE

set conceallevel=0

" Highlight non-ascii characters in red
syntax match nonascii "[^\x00-\x7F]"
highlight nonascii guibg=Red ctermbg=2

" FZF

nnoremap <C-s> :Files<CR>
