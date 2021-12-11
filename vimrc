" VIM SETTINGS ----------------------------------------------------------- {{{
    
    " Vim settings goes here.
    
    " Set internal encoding of vim, not needed on neovim, since coc.nvim using some
    " unicode characters in the file autoload/float.vim
    set encoding=utf-8
    
    " Give more space for displaying messages.
    set cmdheight=2
    
    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300

    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    if has("nvim-0.5.0") || has("patch-8.1.1564")
        " Recently vim can merge signcolumn and number column into one
        set signcolumn=number
    else
        set signcolumn=yes
    endif

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
           \ pumvisible() ? "\<C-n>" :
           \ <SID>check_back_space() ? "\<TAB>" :
           \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    if has('nvim')
        inoremap <silent><expr> <c-space> coc#refresh()
    else
        inoremap <silent><expr> <c-@> coc#refresh()
    endif
    
    " Make <CR> auto-select the first completion item and notify coc.nvim to
    " format on enter, <cr> could be remapped by other vim plugin
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    
    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        elseif (coc#rpc#ready())
            call CocActionAsync('doHover')
        else
            execute '!' . &keywordprg . " " . expand('<cword>')
        endif
    endfunction

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Disable compatibility with vi which can cause unexpected issues.
    set nocompatible

    " Enable type file detection. Vim will be able to try to detect the type of file in use.
    filetype on

    " Enable plugins and load plugin for the detected file type.
    filetype plugin on

    " Load an indent file for the detected file type.
    filetype indent on

    " Turn syntax highlighting on.
    syntax on

    " Add numbers to each line on the left-hand side.
    set number

    " Highlight cursor line underneath the cursor horizontally.
    set cursorline

    " Highlight cursor line underneath the cursor vertically.
    set cursorcolumn

    " Set shift width to 4 spaces.
    set shiftwidth=4

    " Set tab width to 4 columns.
    set tabstop=4

    " Use space characters instead of tabs.
    set expandtab

    " Do not save backup files.
    set nobackup

    " Do not let cursor scroll below or above N number of lines when scrolling.
    set scrolloff=10

    " Do not wrap lines. Allow long lines to extend as far as the line goes.
    set nowrap

    " While searching though a file incrementally highlight matching characters as you type.
    set incsearch

    " Ignore capital letters during search.
    set ignorecase

    " Override the ignorecase option if searching for capital letters.
    " This will allow you to search specifically for capital letters.
    set smartcase

    " Show partial command you type in the last line of the screen.
    set showcmd

    " Show the mode you are on the last line.
    set showmode

    " Show matching words during a search.
    set showmatch

    " Use highlighting when doing a search.
    set hlsearch

    " Set the commands to save in history default number is 20.
    set history=1000

    " Enable auto completion menu after pressing TAB.
    set wildmenu

    " Make wildmenu behave like similar to Bash completion.
    set wildmode=list:longest

    " There are certain files that we would never want to edit with Vim.
    " Wildmenu will ignore files with these extensions.
    set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

    " Use new regular expression engine
    set re=0
" }}}


" PLUGINS ---------------------------------------------------------------- {{{

    " Plugin code goes here.

    call plug#begin('~/.vim/plugged')

    Plug 'dense-analysis/ale'
    Plug 'preservim/nerdtree'
    Plug 'herrbischoff/cobalt2.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    call plug#end()

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

    " Mappings code goes here.

    " Type jj to exit insert mode quickly.
    inoremap jj <Esc>

    " Press the space bar to type the : character in command mode.
    nnoremap <space> :

    " Pressing the letter o will open a new line below the current one.
    " Exit insert mode after creating a new line above or below the current line.
    nnoremap o o<esc>
    nnoremap O O<esc>

    " Center the cursor vertically when moving to the next word during a search.
    nnoremap n nzz
    nnoremap N Nzz

    " Yank from cursor to the end of line.
    nnoremap Y y$

    " You can split the window in Vim by typing :split or :vsplit.
    " Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
    nnoremap <c-j> <c-w>j
    nnoremap <c-k> <c-w>k
    nnoremap <c-h> <c-w>h
    nnoremap <c-l> <c-w>l

    " Resize split windows using arrow keys by pressing:
    " CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
    noremap <c-up> <c-w>+
    noremap <c-down> <c-w>-
    noremap <c-left> <c-w>>
    noremap <c-right> <c-w><

    " NERDTree specific mappings.
    " Map the F3 key to toggle NERDTree open and close.
    nnoremap <F3> :NERDTreeToggle<cr>
    nnoremap <F4> :NERDTreeFocus<cr>


    " Have nerdtree ignore certain files and directories.
    let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

    " Vimscripts code goes here.
    
    " This will enable code folding.
    " Enable the marker method of folding.
    augroup filetype_vim
        autocmd!
        autocmd FileType vim setlocal foldmethod=marker
    augroup END

    " If the current file type is HTML, set indentation to 2 spaces.
    autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

    " If Vim version is equal to or greater than 7.3 enable undofile.
    " This allows you to undo changes to a file even after saving it.
    if version >= 703
        set undodir=~/.vim/backup
        set undofile
        set undoreload=10000
    endif

    " You can split a window into sections by typing `:split` or `:vsplit`.
    " Display cursorline and cursorcolumn ONLY in active window.
    augroup cursor_off
        autocmd!
        autocmd WinLeave * set nocursorline nocursorcolumn
        autocmd WinEnter * set cursorline cursorcolumn
    augroup END

    " Start NERDTree when Vim is started without file arguments.
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

    " Exit Vim if NERDTree is the only window remaining in the only tab.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

    " If GUI version of Vim is running set these options.
    if has('gui_running')

        " Set the background tone.
        set background=dark

        " Set the color scheme.
        colorscheme molokai

        " Set a custom font you have installed on your computer.
        " Syntax: set guifont=<font_name>\ <font_weight>\ <size>
        set guifont=Monospace\ Regular\ 12

        " Display more of the file by default.
        " Hide the toolbar.
        set guioptions-=T

        " Hide the the left-side scroll bar.
        set guioptions-=L

        " Hide the the right-side scroll bar.
        set guioptions-=r

        " Hide the the menu bar.
        set guioptions-=m

        " Hide the the bottom scroll bar.
        set guioptions-=b

        " Map the F4 key to toggle the menu, toolbar, and scroll bar.
        " <Bar> is the pipe character.
        " <CR> is the enter key.
        nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
            \set guioptions-=mTr<Bar>
            \else<Bar>
            \set guioptions+=mTr<Bar>
            \endif<CR>

    endif

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

    " Status bar code goes here.

    " Clear status line when vimrc is reloaded.
    set statusline=

    " Status line left side.
    set statusline+=\ %F\ %M\ %Y\ %R

    " Use a divider to separate the left side from the right side.
    set statusline+=%=

    " Status line right side.
    set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

    " Show the status on the second to last line.
    set laststatus=2

" }}}
