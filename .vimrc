
set nonumber
" set relativenumber
" 设置 Tab 为 4 个空格

set tabstop=4          " Tab 的宽度为 4
set shiftwidth=4       " 自动缩进的宽度为 4
set softtabstop=4      " Tab 键对应 4 个空格
set expandtab          " 使用空格代替 Tab
set smartindent        " 启用智能缩进
set autoindent         " 启用自动缩进
    

set clipboard=unnamed      " Vim -> 系统剪切版
" set clipboard=unnamedplus    " 使用系统剪切版 -> Vim



" 搜索相关设置
set ignorecase         " 搜索时忽略大小写
set smartcase          " 含大写字母时，启用大小写敏感搜索

" 超时设置
set notimeout          " 禁用超时（适用于某些命令）
" set mouse=a

let mapleader = "," " defualt ,

" 映射 H 到行首
nnoremap H ^

" 映射 L 到行尾
nnoremap L $

" =======================
" ===  plugins  begin ===
" =======================
call plug#begin('~/.vim/plugged')

	Plug 'preservim/nerdtree'  " 文件树
	Plug 'vim-airline/vim-airline' " 状态栏
	" terminal
	Plug 'skywind3000/vim-terminal-help'

    " 语法高亮
    Plug 'sheerun/vim-polyglot'

    " 主题
    Plug 'morhetz/gruvbox' 
	" lsp
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'voldikss/vim-floaterm'
call plug#end()
" =======================
" ===   plugins  end  ===
" =======================


" =================================
" ===   plugins  configuration  ===
" =================================

" ==== preservim/nerdtree ====
nnoremap <LEADER>e :NERDTreeToggle<CR>

let g:airline_theme = 'gruvbox'
let g:airline#extensions#default#enabled = 0
let g:airline#extensions#whitespace#enabled = 0 
"let g:airline_section_c = '%f'
let g:airline_section_x = '%y'             " 只显示文件类型（如 [Vim]）
let g:airline_section_z = '%l/%L'          " 只显示当前行/总行数（如 10/100）
let g:airline_section_error = ''           " 隐藏错误提示
let g:airline_section_warning = ''         " 隐藏警告提示

" set termguicolors
" let g:vsdark_style = "dark"
set background=dark 
colorscheme gruvbox 
hi Normal guibg=#000000 ctermbg=0
" ==== neoclide/coc.nvim ====
" coc extensions
let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-vimlsp',
      \ 'coc-cmake',
      \ ]

" floatter 快捷键
nnoremap <silent> <leader>t :FloatermToggle<CR>
tnoremap <silent> <leader>t <C-\><C-n>:FloatermToggle<CR>

" set signcolumn=number
" set signcolumn=yes
set signcolumn=no
" set signcolumn=auto 
highlight SignColumn guibg=#000000 ctermbg=0
highlight GruvboxRedSign guibg=#000000 ctermbg=0 
highlight GruvboxBlueSign ctermbg=0 guibg=#000000 
highlight pythonSpaceError ctermbg=0 guibg=#000000


" -------------------------- coc.nvim ------------------
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f <Plug>(coc-format-selected)
command! -nargs=0 Format :call CocAction('format')

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" diagnostic info
nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<CR>
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
nmap <LEADER>qf <Plug>(coc-fix-current)

" statusline support
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}  "TODO GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


function! s:generate_compile_commands()
  if empty(glob('CMakeLists.txt'))
    echo "Can't find CMakeLists.txt"
    return
  endif
  if empty(glob('.vscode'))
    execute 'silent !mkdir .vscode'
  endif
  execute '!cmake -DCMAKE_BUILD_TYPE=debug
      \ -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -S . -B .vscode'
endfunction
command! -nargs=0 Gcmake :call s:generate_compile_commands()

" ==== puremourning/vimspector ====
let g:vimspector_enable_mappings = 'HUMAN'

function! s:generate_vimspector_conf()
  if empty(glob( '.vimspector.json' ))
    if &filetype == 'c' || 'cpp' 
      !cp ~/.config/nvim/vimspector_conf/c.json ./.vimspector.json
    elseif &filetype == 'python'
      !cp ~/.config/nvim/vimspector_conf/python.json ./.vimspector.json
    endif
  endif
  e .vimspector.json
endfunction

command! -nargs=0 Gvimspector :call s:generate_vimspector_conf()

nmap <Leader>v <Plug>VimspectorBalloonEval
xmap <Leader>v <Plug>vimspectorBalloonEval
