"Plug>>>>>
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'tomasr/molokai' 
Plug 'w0rp/ale'
Plug 'liuchengxu/space-vim-dark'
Plug 'scrooloose/nerdcommenter'
"Plug 'Valloric/YouCompleteMe'
Plug 'Chiel92/vim-autoformat'
Plug '~/.vim/plugged/autherinfo'
Plug 'godlygeek/tabular'
call plug#end()

"
let mapleader=";"
set guifont=Hack\ 14
"colorscheme molokai
colorscheme space-vim-dark
" 设置重新载入.vimrc快捷键
map <silent> <leader>ss :source ~/.vimrc<CR>
map <silent> <leader>ee :e ~/.vimrc<cr>

set nocompatible
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on	" required
filetype plugin on	" required
syntax enable
syntax on
set laststatus=2
set ruler
set cmdheight=1
set showtabline=1
"set tabline=%!MyTabLine()
" show tabline function
" each tab label function
set nu
set relativenumber
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
set scrolloff=15
set cursorline
set hlsearch
set incsearch
" 设置禁止光标闪烁
set gcr+=a:blinkon0
" set swapfile dir
set directory=/tmp

" 设置自动补全
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 return a:char
 elseif line[col - 1] == a:char
 return "\<Right>"
 else
 return a:char.a:char."\<Esc>i"
 endif
endf

" 设置编码
set encoding=utf-8
set fileencodings=utf-8,gbk,default,latin1

" 设置缩进
set cindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" 对不同文件类型进行不同的缩进设置
au FileType html,python,vim,javascript,css setl shiftwidth=2
au FileType html,python,vim,javascript,css setl tabstop=2
au FileType html,python,vim,javascript,css setl softtabstop=2
au FileType java,php setl shiftwidth=4
au FileType java,php setl tabstop=4
au FileType java,php setl softtabstop=4

" 设置代码折叠
set foldenable
set foldmethod=syntax
set foldlevel=100    " 启动vim时关闭折叠

" 设置对齐
set ai " 自动对齐
set si
set smarttab
set wrap
set lbr
set tw=0
" No sound on errors.
set noerrorbells
set novisualbell
" smart backspace
set backspace=start,indent,eol
set clipboard=unnamedplus
set selection=inclusive " gvim设置multiple-cursors

" config keymaps
nnoremap <silent><leader>y "+yy
vnoremap <silent><leader>y "+y
nnoremap <silent><leader>p "+p
vnoremap <silent><leader>p "+p

" 标签页快捷键
nnoremap <M-Left> :tabprevious<CR>
nnoremap <M-Right> :tabnext<CR>
nnoremap <M-1> 1gt
nnoremap <M-2> 2gt
nnoremap <M-3> 3gt
nnoremap <M-4> 4gt
nnoremap <M-5> 5gt
nnoremap <M-6> 6gt
nnoremap <M-7> 7gt
nnoremap <M-8> 8gt
nnoremap <M-9> 9gt
nnoremap <M-0> :tablast<CR>


" config vim updatetime
set updatetime=250

" config vim minimap
let g:minimap_toggle='<F4>' "F4 toggle minimap

" config js files
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
" config jsbeautify
"map <C-M-f> :call JsBeautify()<CR>
autocmd FileType javascript noremap <buffer>  <C-M-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <C-M-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <C-M-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <C-M-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <C-M-f> :call CSSBeautify()<cr>
" visual mode
autocmd FileType javascript vnoremap <buffer>  <C-M-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <C-M-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <C-M-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <C-M-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <C-M-f> :call RangeCSSBeautify()<cr>

" set  molokai color scheme
" let g:molokai_original = 1
" let g:rehash256 = 1

" config statusline
"let g:Powerline_symbols = 'fancy'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#exclude_preview = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline_theme='dark'
let g:airline_powerline_fonts=1

" config vim-syntastic
set statusline+=%#warningmsg#
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_go_checkers = ['gofmt','gometalinter','gotype', 'govet']

let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '∆'
let g:syntastic_style_warning_symbol = '≈'
" end vim-syntastic


"tagbar config
map <F3> :TagbarToggle<CR>


"NERDTree config
map <F2> :NERDTreeToggle<CR>
" 关闭vim时，如果没有打开的文件，关闭NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Change the arrow
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
"NERDTree git symbol
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "*",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" YCM settings
" 通过下箭头选择下一个提示，上箭头同样，Ctrl+Space触发提示
"set completeopt-=preview
let g:ycm_key_list_select_completion=['<Down>']
let g:ycm_key_list_previous_completion=['<Up>']
let g:ycm_key_invoke_completion='<C-Space>'
"let g:ycm_completion_confirm_key='<enter>'
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"  "回车即选中当前项
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
set completeopt=longest,menu
"let g:yvm_add_preview_to_completeopt=1
"let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_autoclose_preview_window_after_insertion=1 "离开插入模式后自动关闭预览窗口
let g:ycm_complete_in_comments=1
"let g:ycm_complete_in_strings=1
let g:ycm_min_num_of_chars_for_completion=3
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_confirm_extra_conf=0
let g:ycm_semantic_triggers =  {
  \ 'c': ['->', '.'],
  \ 'cpp': ['->', '.', '::'],
  \ 'php': ['->', '::'],
  \ 'cs,java,javascript,typescript,python,vb,elixir,go' : ['.'],
  \}

" Config neocomplete settings
"set completeopt-=preview  " Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"let g:neocomplete#enable_at_startup = 1 " Use neocomplete.
"let g:neocomplete#enable_smart_case = 1 " Use smartcase.
"let g:neocomplete#sources#syntax#min_keyword_length = 3 " Set minimum syntax keyword length.
"let g:neocomplcache_enable_fuzzy_completion = 1               " 开启模糊匹配
"let g:neocomplcache_fuzzy_completion_start_length = 3         " 3个字母后开启模糊匹配
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"if !exists('g:neocomplete#keyword_patterns')
    "let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default'] = '\h\w*'
"" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()
"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
  "return (pumvisible() ? "\<C-y>" : "\<CR>" )
  "" For no inserting <CR> key.
"endfunction
"" <Down>/<Up>: completion.
"inoremap <expr><Down>  pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr><Up>  pumvisible() ? "\<C-p>" : "\<Up>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1
"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" UltiSnips settings
" 通过tab展开
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"nerdcommenter config
nmap <C-\> <plug>NERDCommenterToggle
vmap <C-\> <plug>NERDCommenterToggle
imap <C-\> <Esc><plug>NERDCommenterToggle :startinsert<CR>

" vim-go settings
let g:go_fmt_command="goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
set mouse=a


" nerdcommenter
" <leader>cs   加注释
"<leader>cu   解开注释
""<leader>c<space>  加上/解开注释, 智能判断
""<leader>cy   先复制, 再注解(p可以进行黏贴)

"autoformat 
"F3自动格式化代码
noremap <F5> :Autoformat<CR>
let g:autoformat_verbosemode=1

"authorinfo
let g:vimrc_author='alpha@ln' 
let g:vimrc_email='1228790403@qq.com' 

nmap <F1> :AuthorInfoDetect<cr> 

"ale
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'


"supertab
let g:SuperTabRetainCompletionType=2
