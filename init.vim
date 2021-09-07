" Enable all colors in neovim
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

" Disable compatibility with older vi
set nocompatible
filetype off

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Langs
Plug 'elixir-editors/vim-elixir'
Plug 'vim-ruby/vim-ruby'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'wlangstroth/vim-racket'
Plug 'ElmCast/elm-vim'
Plug 'hashivim/vim-hashicorp-tools'
Plug 'mracos/mermaid.vim'

" Plugins
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'phaazon/hop.nvim'
Plug 'terryma/vim-multiple-cursors'
Plug 'mhinz/vim-mix-format'
Plug 'farmergreg/vim-lastplace'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tamton-aquib/staline.nvim'
Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
Plug 'blackCauldron7/surround.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'terrortylor/nvim-comment'

" Lang server and diagnostics
" watch out for Elixir LS setup:
" https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#elixirls
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'folke/trouble.nvim'

" Completion
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/completion-treesitter'
Plug 'rafamadriz/friendly-snippets'

" ColorScheme
Plug 'rktjmp/lush.nvim'
Plug 'ellisonleao/gruvbox.nvim'

" Initialize plugin system
call plug#end()

" Toggle past mode
set pastetoggle=<F2>

" Show partial commands in the last line of the screen
set showcmd

set background=dark

let g:gruvbox_italic=1
colorscheme gruvbox

" Enable light line
set laststatus=2

" Enable buffer at status line
set showtabline=2

" A guide column to keep the code to a maximum of 100 chars
set colorcolumn=100

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" USABILITY -------------------------------------

" add some line space for easy reading
set linespace=4

" Use case insensitive search, except when using capital letters
set ignorecase

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" " While this behaviour deviates from that of Vi, it does what most users
" " coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" " line of a window
set ruler

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Enable use of the mouse for all modes
set mouse=a

" Display line numbers on the left
set number

set undofile
set undodir="$HOME/.VIM_UNDO_FILES"

" IDENTATION -----------------------------------

" Indentation settings for using 2 spaces instead of tabs.
set shiftwidth=2
set tabstop=2
set sts=2
set expandtab

" MAPPINGS --------------------------------------

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" " next search
nnoremap <C-L> :nohl<CR><C-L>

" Mapping <tab> to change navigate on tabs
nmap <tab> :tabnext<CR>
" Mapping control + <tab> to go to the previous tab
nmap <S-tab> :tabprevious<CR>

" Open file under cursor in another tab
map gft <C-w>gf<CR>

" Max of open tabs opened
set tabpagemax=100

autocmd BufWinLeave * call clearmatches()

" Run to clean trailing whitespace
command FixSpaces %s/\s\+$/

" Reload the file on changes
set autoread

set clipboard=unnamedplus

" Copy and cut an entire line to clipboard
vmap <C-c> :w !pbcopy<CR><CR>
vmap <C-x> :!pbcopy<CR>

" Linters - JS, SCSS and Ruby
let g:neomake_html_tidy_ignore_errors = ['proprietary attribute "v-']

let g:neomake_error_sign = {'text': 'E>', 'texthl': 'ErrorMsg'}
let g:neomake_warning_sign = {'text': 'W>', 'texthl': 'WarnMsg'}
let g:neomake_info_sign = {'text': 'I>', 'texthl': 'NeomakeInfoSign'}
let g:neomake_highlight_columns = 1

" Prettier linting errors
highlight NeomakeErrorSign ctermfg=124 cterm=bold
highlight NeomakeWarningSign ctermfg=31 cterm=bold

" It executes neomake every save of file
autocmd! BufWritePost * Neomake

" Neovim requires Python paths
let g:python_host_prog = '/usr/local/bin/python'

" Set the path as current directory. It enables search recursively by files in
" this directory.
set path=$PWD/**

" Completion integration with snippets
let g:completion_enable_snippet = 'vim-vsnip'
let g:completion_timer_cycle = 200

" Config LangServer
lua << EOF
local custom_attach = function(client, bufnr)
  -- Helper functions
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)

  require'completion'.on_attach()
  require'lspsaga'.init_lsp_saga()
end

require'lspconfig'.elixirls.setup{
  cmd = { "/home/philip/sandbox/elixir-ls/release/language_server.sh" };
  on_attach = custom_attach;
  elixirLS = {
    dialyzerEnabled = false,
    fetchDeps = false
  };
}

require'nvim-web-devicons'.setup{}
require'staline'.setup{}
require'trouble'.setup{}
require'surround'.setup{ mappings_style = 'surround' }
require'nvim_comment'.setup {
  comment_empty = false,
  line_mapping = "<leader>cc",
  operator_mapping = "<leader>c"
}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
require'hop'.setup()
EOF

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use tab and s-tab for smart completion (besides auto popup)
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

" Show hover doc
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>

" Show actions
nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>

" Show line diagnostic
nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>

" Only show diagnostic if cursor is over the area
" nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>

" Jump diagnostic
nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>

" Hop to some visible part
nnoremap <silent><leader>t <cmd>lua require'hop'.hint_words()<CR>
nnoremap <silent><leader>b <cmd>lua require'hop'.hint_words()<CR>

" Toggle trouble panel
nnoremap <silent>T <cmd>TroubleToggle<CR>

" Find files with telescope 
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
