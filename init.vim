call plug#begin('~/.vim/plugged')
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'fatih/vim-go'
" Plug 'dracula/vim'
Plug 'lambdalisue/suda.vim'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-commentary'
Plug 'farmergreg/vim-lastplace'
Plug 'mhinz/vim-startify'
Plug 'sbdchd/neoformat'
Plug 'neomake/neomake'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'ianva/vim-youdao-translater'
Plug 'rust-lang/rust.vim'
Plug 'ap/vim-css-color'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-cssomni'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'ncm2/ncm2-racer'
Plug 'ncm2/ncm2-go'
Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim'
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'liuchengxu/vim-which-key'
" Plug 'NLKNguyen/papercolor-theme'
Plug 'nightsense/rusticated'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-html-subscope'
Plug 'fgrsnau/ncm2-aspell'
Plug 'ncm2/ncm2-markdown-subscope'
Plug 'mhinz/vim-grepper'
Plug 'gluon-lang/vim-gluon'
Plug 'tpope/vim-speeddating'
Plug 'rhysd/git-messenger.vim'
Plug 'metakirby5/codi.vim'
call plug#end()

" General settings
set number relativenumber
set hlsearch
syntax on
" color dracula
" set background=light
" colorscheme PaperColor
colorscheme rusticated
set noswapfile
set ts=2 sts=2 sw=2 expandtab

" Nerdtree config
" If the only opening window is nerdtree close vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <F3> :NERDTreeToggle<CR>
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" lightline config
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'Dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" fzf config
map <c-p> :FZF<CR>

" NCM2 config
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Language Server Client Start
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
  \ 'rust': ['rls'],
  \ 'javascript': ['tsserver'],
  \ 'javascript.jsx': ['tsserver'],
  \ 'typescript': ['tsserver'],
  \ 'sh': ['bash-language-server', 'start'],
  \ 'gluon': ['gluon_language-server'],
  \ }
let g:LanguageClient_selectionUI = "fzf"

" vim-go config
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" auto reload after edit vimrc
autocmd! bufwritepost .vimrc source %

" leader key
let mapleader = " " 

" buffer layer
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bn :bnext<CR>

" window layer
nnoremap <leader>w/ :vsplit<CR>
nnoremap <leader>w- :split<CR>
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wl :wincmd l<CR>

" terminal config
nnoremap <leader>' :terminal<CR>
" run python file
nnoremap <leader>pr :!python3 main.py<CR>

" neoformat config
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
let g:neoformat_enabled_go = ['goimports']
let g:neoformat_enabled_javascript = ['prettier']

" Easymotion config
let g:EasyMotion_smartcase = 1

" When writing a buffer.
call neomake#configure#automake('w')

" ale config
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'go': ['goimports'],
\}

" Youdao translate config
vnoremap <silent> <C-T> :<C-u>Ydv<CR>
nnoremap <leader>t :<C-u>Ydc<CR>
noremap <leader>yd :<C-u>Yde<CR>

" Tagbar config
nmap <F8> :TagbarToggle<CR>

" Grep config
nnoremap <leader>g :GrepperRg 

command BuildWasm execute "!cargo web build --release --target=wasm32-unknown-unknown"
command CargoRun execute "!cargo run"
command W execute ":w suda://%"

let g:tagbar_type_rust = {
      \ 'ctagstype' : 'rust',
      \ 'kinds' : [
      \'T:types,type definitions',
      \'f:functions,function definitions',
      \'g:enum,enumeration names',
      \'s:structure names',
      \'m:modules,module names',
      \'c:consts,static constants',
      \'t:traits',
      \'i:impls,trait implementations',
      \]
      \}

let g:tagbar_type_typescript = {                                                  
  \ 'ctagsbin' : 'tstags',                                                        
  \ 'ctagsargs' : '-f-',                                                           
  \ 'kinds': [                                                                     
    \ 'e:enums:0:1',                                                               
    \ 'f:function:0:1',                                                            
    \ 't:typealias:0:1',                                                           
    \ 'M:Module:0:1',                                                              
    \ 'I:import:0:1',                                                              
    \ 'i:interface:0:1',                                                           
    \ 'C:class:0:1',                                                               
    \ 'm:method:0:1',                                                              
    \ 'p:property:0:1',                                                            
    \ 'v:variable:0:1',                                                            
    \ 'c:const:0:1',                                                              
  \ ],                                                                            
  \ 'sort' : 0                                                                    
  \ }

let g:tagbar_type_go = {
    \ 'ctagstype': 'go',
    \ 'kinds' : [
        \'p:package',
        \'f:function',
        \'v:variables',
        \'t:type',
        \'c:const'
    \]
    \}

" vim which key config
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <leader>gm :GitMessenger<CR>
set timeoutlen=500
