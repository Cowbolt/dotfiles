set nocompatible
execute pathogen#infect()
colorscheme gruvbox
set background=dark
filetype plugin indent on
set linebreak
set breakindent
set autoindent
syntax on
:set number
set guioptions -=T
set mouse=a


" Insert character
:nnoremap <Space> i_<Esc>r


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

nmap <CR> o<Esc>

" sets cursorline in focused window
augroup CursorLine
    au!
    au VimEnter * setlocal cursorline
    au WinEnter * setlocal cursorline
    au BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" maps edit/reload .vimrc to \ev and \sv
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>


"TAB SETTINGS
    " show existing tab with 4 spaces width
    set tabstop=4
    " when indenting with '>', use 4 spaces width
    set shiftwidth=4
    " On pressing tab, insert 4 spaces
    set expandtab

" NERDTree SETTINGS
    " open NERDTree on startup
    " autocmd vimenter * NERDTree
    " maps toggle to ctrl + n
     map <C-n> :NERDTreeToggle<CR>
     " close NERDTree if only remaining window
     autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
     " focus main window on launch
    " augroup NERD
    "au!
    "autocmd VimEnter * NERDTree
    "autocmd VimEnter * wincmd p
    "augroup END
    " maps focus NERDTree to F2
    noremap <F2> :NERDTreeFocus<CR>

" TAGBAR SETTINGS
    "maps toggle to F8
    nmap <F8> :TagbarToggle<CR>

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
    map <silent> <S-h> <C-w><
    map <silent> <S-j> <C-W>-
    map <silent> <S-k> <C-W>+
    map <silent> <S-l> <C-w>>

    " enables window swapping and binds it to ø and æ
    function! MarkWindowSwap()
        let g:markedWinNum = winnr()
    endfunction

    function! DoWindowSwap()
        "Mark destination
        let curNum = winnr()
        let curBuf = bufnr( "%" )
        exe g:markedWinNum . "wincmd w"
        "Switch to source and shuffle dest->source
        let markedBuf = bufnr( "%" )
        "Hide and open so that we aren't prompted and keep history
        exe 'hide buf' curBuf
        "Switch to dest and shuffle source->dest
        exe curNum . "wincmd w"
        "Hide and open so that we aren't prompted and keep history
        exe 'hide buf' markedBuf
    endfunction

    nmap <silent> ø :call MarkWindowSwap()<CR>
    nmap <silent> æ :call DoWindowSwap()<CR>

" SYNTASTIC SETTINGS
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 0 " Don't auto open/close location list
    let g:syntastic_check_on_open = 0
    let g:syntastic_check_on_wq = 0
    let g:syntastic_mode="passive"
    let g:syntastic_enable_signs=1
    let g:syn_flag = 0
    function! ToggleSyntastic()
        if (!g:syn_flag)
            execute "SyntasticCheck | :lopen"
            let g:syn_flag = 1
        else
            execute "lclose"
            let g:syn_flag = 0
        endif
    endfunction
    nnoremap <F7> :call ToggleSyntastic()<CR>

" AIRLINE SETTINGS
    let g:airline_theme='gruvbox'
    let g:airline_powerline_fonts = 1

"Tab navigation, honestly gt gT is better
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1

    " Use compact syntax for prettified multi-line comments
    let g:NERDCompactSexyComs = 1

    " Align line-wise comment delimiters flush left instead of following code indentation
    let g:NERDDefaultAlign = 'left'
    nnoremap <leader>sc :call NERDComment(0,"toggle")<CR>

    vnoremap <leader>sc :call NERDComment(0,"toggle")<CR>
