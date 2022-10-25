"general settings
let mapleader=" "
set clipboard+=unnamedplus
syntax on
set noerrorbells
set smartindent
set smartindent
set formatoptions-=ro
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=$HOME/.config/nvim/undo
set undofile
set incsearch
set mouse=a
set textwidth=0
set wrap
set wildmode=longest,list,full
nnoremap <expr> G line('.') == line('$') ? 'gg' : 'G'
map <leader>s :setlocal spell! spelllang=en_gb<CR>
map <leader>i :setlocal autoindent<CR>
map <leader>I :setlocal noautoindent<CR>

"tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"plugins
call plug#begin()
"Plug 'andweeb/presence.nvim'
"Plug 'itchyny/lightline.vim'
"Plug 'bluz71/vim-moonfly-statusline'
Plug 'nvim-lualine/lualine.nvim'
Plug 'tomasiser/vim-code-dark'
Plug '4513ECHO/vim-colors-hatsunemiku'
Plug 'szw/vim-dict'
Plug 'norcalli/nvim-colorizer.lua'
"Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'udalov/kotlin-vim'
call plug#end()

"themeing
set cursorline
set cursorcolumn
set number
set relativenumber
set gcr=a:blinkon0
highlight CursorLine ctermbg=Yellow cterm=bold guibg=#2b2b2b
highlight CursorColumn ctermbg=Yellow cterm=bold guibg=#2b2b2b
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
autocmd BufWritePre * %s/\s\+$//e
colorscheme codedark
set termguicolors
"set noshowmode

"split
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <leader>h :split<Space>
nnoremap <leader>v :vsplit<Space>
set splitbelow splitright

"netrw
let g:netrw_banner=0
let g:netrw_winsize = 15
let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Ex
    endif
endfunction
map <leader>e :call ToggleNetrw()<CR>

"Discord RPC
"let g:presence_neovim_image_text   = "Text Editor"
"let g:presence_main_image          = "file"

"keybinding
:tnoremap <Esc> <C-\><C-n>
:nnoremap <leader>w <C-w>
nnoremap <leader>t :split<Space>\| res 10 \| terminal<CR>
command Py :split | res 10 | terminal python3 %
command Gcc :split | res 10 | terminal gcc -static % -o %:r
command Rc :split | res 10 | terminal ./%:r
command GCC :split | res 10 | terminal gcc -static % -o %:r && ./%:r
command Kt :split | res 10 | terminal kotlinc-jvm % -d %:r.jar
command KT :split | res 10 | terminal kotlinc-jvm % -d %:r.jar && kotlin %:r.jar

command Kts :split | res 10 | terminal kotlinc-jvm -script %
" Compile and open output
map <leader>g :w! \| !pandoc --wrap=preserve -s % -o %:r.pdf<CR>
map <leader>o :!zathura %:r.pdf &disown && exit<CR>
vmap < <gv
vmap > >gv

"lualine
lua << END
require('lualine').setup{
    options = { theme = 'wombat',icons_enabled = false,section_separators = '', component_separators = ''},
}
END
"colour
lua require'colorizer'.setup()

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
