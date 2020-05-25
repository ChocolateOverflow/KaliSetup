" <F1>*
"		Toggle info stuff (Tagbar; NERDTree)
" <F3>
"		Beaufity/Autoformat
" <F5>
"		Run/Compile
"
" <Leader>g
"		git commands
"
" markdown renders at localhost:4444



""""""""""""""""""""""""""""""""""""""""
" General settings
""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype plugin on


" Movement and Searching
set incsearch
set smartcase


" Displaying Text
set wrap
set rnu nu


" Syntax, Highlighting and Spelling
syntax on
set bg=dark


" Multiple Windows
set splitbelow splitright


" Terminal
set title


" Message and Info
set showcmd
set ruler
set visualbell


" Selecting Text
set clipboard+=unnamedplus


" Tabs & Indentation
set autoindent
set breakindent
set shiftwidth=3
set tabstop=3
set vartabstop=3
set varsofttabstop=3
set smarttab
set shiftround
set noexpandtab
set smartindent


" Folding
set nofoldenable
set foldmethod=indent
set foldminlines=1


" Command Line Editting
set history=100
set wildmode=longest,list,full
set wildmenu


" Encoding
set encoding=utf-8


" Search through all sub-directories (tab-completion)
set path+=**



""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""

call plug#begin('$HOME/.vim/plugged')
	" General GUI
	Plug 'vim-airline/vim-airline'
	Plug 'w0rp/ale'
	Plug 'joshdick/onedark.vim'
	Plug 'chrisbra/colorizer'
	" Motion
	Plug 'easymotion/vim-easymotion'
	Plug 'andymass/vim-matchup'
	" Searching
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
	" Tags
	Plug 'majutsushi/tagbar'
	" Automation
	Plug 'scrooloose/nerdcommenter'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-repeat'
	" Languages
	Plug 'sheerun/vim-polyglot'
	" Lint
	Plug 'scrooloose/syntastic'
	" Formatting
	Plug 'godlygeek/tabular'
	Plug 'rhysd/vim-clang-format', {'for': ['c', 'cpp']}
	Plug 'kana/vim-operator-user', {'for': ['c', 'cpp']} " for vim-clang-format
	Plug 'psf/black', { 'for': 'python', 'branch': 'stable' }
	Plug 'maksimr/vim-jsbeautify', {'for': ['javascript', 'html', 'css']}
	" Autocomplete
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" git
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
	" External files
	Plug 'scrooloose/nerdtree'
	" Building
	Plug 'tpope/vim-dispatch'
	" C/C++
	Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp']}
	" Python
	Plug 'davidhalter/jedi-vim', {'for': 'python'}
	Plug 'davidhalter/jedi', {'for': 'python'}
	Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
	" Markdown
	Plug 'mzlogin/vim-markdown-toc', {'for': 'markdown'}
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()



""""""""""""""""""""""""""""""""""""""""
" Themes and Background
""""""""""""""""""""""""""""""""""""""""

colorscheme onedark



""""""""""""""""""""""""""""""""""""""""
" Basic autocmd
""""""""""""""""""""""""""""""""""""""""

" Disable auto-commenting on new-line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically delete trailing white spaces on save
autocmd BufWritePre * %s/\s\+$//e

let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	map <leader>v :VimwikiIndex
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex



""""""""""""""""""""""""""""""""""""""""
" C/C++
""""""""""""""""""""""""""""""""""""""""

" vim-cpp-enhanced-highlight
autocmd BufNewFile,BufRead *.c,*.cpp,*.h let g:cpp_class_scope_highlight = 1
autocmd BufNewFile,BufRead *.c,*.cpp,*.h let g:cpp_member_variable_highlight = 1
autocmd BufNewFile,BufRead *.c,*.cpp,*.h let g:cpp_class_decl_highlight = 1
autocmd BufNewFile,BufRead *.c,*.cpp,*.h let g:cpp_concepts_highlight = 1

" Dispatch
autocmd BufNewFile,BufRead *.c,*.cpp map <F5> :Make<CR>

" vim-clang-format
autocmd BufNewFile,BufRead *.c,*.cpp map <F3> :ClangFormat<CR>
let g:clang_format#style_options = {
				\ "AccessModifierOffset": 3,
				\ "AlignAfterOpenBracket": "Align",
				\ "AlignConsecutiveAssignments": "true",
				\ "AlignConsecutiveDeclarations": "true",
				\ "AlignConsecutiveMacros": "true",
				\ "AlignEscapedNewlines": "Left",
				\ "AlignTrailingComments": "true",
				\ "AllowAllArgumentsOnNextLine": "true",
				\ "AllowAllConstructorInitializersOnNextLine": "true",
				\ "AllowAllParametersOfDeclarationOnNextLine": "true",
				\ "AllowShortBlocksOnASingleLine": "Never",
				\ "AllowShortCaseLabelsOnASingleLine": "false",
				\ "AllowShortFunctionsOnASingleLine": "None",
				\ "AllowShortIfStatementsOnASingleLine": "Never",
				\ "AllowShortLambdasOnASingleLine": "Inline",
				\ "AllowShortLoopsOnASingleLine": "false",
				\ "AlwaysBreakAfterReturnType": "None",
				\ "AlwaysBreakBeforeMultilineStrings": "false",
				\ "AlwaysBreakTemplateDeclarations": "Yes",
				\ "BinPackArguments": "false",
				\ "BinPackParameters": "false",
				\ "BreakBeforeBinaryOperators": "None",
				\ "BreakBeforeBraces": "Whitesmiths",
				\ "BreakConstructorInitializers": "AfterColon",
				\ "BreakInheritanceList": "AfterColon",
				\ "BreakStringLiterals": "true",
				\ "ColumnLimit": 0,
				\ "CompactNamespaces": "false",
				\ "ConstructorInitializerAllOnOneLineOrOnePerLine": "false",
				\ "ConstructorInitializerIndentWidth": 3,
				\ "ContinuationIndentWidth": 3,
				\ "Cpp11BracedListStyle": "false",
				\ "DerivePointerAlignment": "true",
				\ "FixNamespaceComments": "false",
				\ "IncludeBlocks": "Regroup",
				\ "IndentGotoLabels": "true",
				\ "IndentPPDirectives": "BeforeHash",
				\ "IndentWidth": 3,
				\ "IndentWrappedFunctionNames": "false",
				\ "KeepEmptyLinesAtTheStartOfBlocks": "false",
				\ "Language": "Cpp",
				\ "NamespaceIndentation": "All",
				\ "PointerAlignment": "Left",
				\ "ReflowComments": "true",
				\ "SortIncludes": "true",
				\ "SortUsingDeclarations": "true",
				\ "SpaceAfterCStyleCast": "true",
				\ "SpaceAfterLogicalNot": "false",
				\ "SpaceAfterTemplateKeyword": "true",
				\ "SpaceBeforeAssignmentOperators": "true",
				\ "SpaceBeforeCpp11BracedList": "true",
				\ "SpaceBeforeCtorInitializerColon": "false",
				\ "SpaceBeforeInheritanceColon": "false",
				\ "SpaceBeforeParens": "Never",
				\ "SpaceBeforeRangeBasedForLoopColon": "false",
				\ "SpaceBeforeSquareBrackets": "false",
				\ "SpaceInEmptyBlock": "false",
				\ "SpaceInEmptyParentheses": "false",
				\ "SpacesBeforeTrailingComments": 3,
				\ "UseCRLF": "false",
				\ "UseTab": "Always"
				\ }
let g:clang_format#auto_format = 0
let g:clang_format#auto_format_on_insert_leave = 0



""""""""""""""""""""""""""""""""""""""""
" Python
""""""""""""""""""""""""""""""""""""""""

" python-mode
autocmd BufNewFile,BufRead *.py let g:pymode_trim_whitespaces = 1
autocmd BufNewFile,BufRead *.py let g:pymode_indent = 1
autocmd BufNewFile,BufRead *.py let g:pymode_motion = 1
autocmd BufNewFile,BufRead *.py let g:pymode_virtualenv = 1
autocmd BufNewFile,BufRead *.py let g:pymode_run = 1
autocmd BufNewFile,BufRead *.py let g:pymode_run_bind = '<F5>'
autocmd BufNewFile,BufRead *.py let g:pymode_breakpoint = 1
autocmd BufNewFile,BufRead *.py let g:pymode_breakpoint_bind = '<leader>b'
autocmd BufNewFile,BufRead *.py let g:pymode_lint = 1
autocmd BufNewFile,BufRead *.py let g:pymode_lint_on_write = 1
autocmd BufNewFile,BufRead *.py let g:pymode_lint_cwindow = 1
autocmd BufNewFile,BufRead *.py let g:pymode_lint_signs = 1
autocmd BufNewFile,BufRead *.py let g:pymode_rope = 1
autocmd BufNewFile,BufRead *.py let g:pymode_rope_regenerate_on_write = 1
autocmd BufNewFile,BufRead *.py let g:pymode_rope_completion = 1
autocmd BufNewFile,BufRead *.py let g:pymode_rope_autoimport = 0
autocmd BufNewFile,BufRead *.py let g:pymode_rope_goto_definition_bind = 'gd'
autocmd BufNewFile,BufRead *.py let g:pymode_rename_bind = '<C-c>rr'
autocmd BufNewFile,BufRead *.py let g:pymode_syntax = 1
autocmd BufNewFile,BufRead *.py let g:pymode_syntax_all = 1

" Black
autocmd BufWritePre *.py execute ':Black'
nnoremap <F3> :Black<CR>



""""""""""""""""""""""""""""""""""""""""
" HTML/Javascript
""""""""""""""""""""""""""""""""""""""""

" vim-jsbeautify
autocmd FileType javascript noremap <buffer>  <F3> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <F3> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <F3> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <F3> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <F3> :call CSSBeautify()<cr>

" json
autocmd FileType json syntax match Comment +\/\/.\+$+

" XML

" Host files
autocmd FileType html noremap <F5> :!python2 -m SimpleHTTPServer<CR>



""""""""""""""""""""""""""""""""""""""""
" Markdown
""""""""""""""""""""""""""""""""""""""""

" vim-markdown-toc
let g:vmt_auto_update_on_save = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '\TOC'
let g:vmt_cycle_list_item_markers = 1

" markdown-preview.nvim
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = 'localhost'
let g:mkdp_port = 4444
let g:mkdp_browser = 'firefox'
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false
    \ }
let g:mkdp_page_title = '「${name}」'
autocmd BufNewFile,BufRead *.md nmap <F5> <Plug>MarkdownPreviewToggle



""""""""""""""""""""""""""""""""""""""""
" General Writing
""""""""""""""""""""""""""""""""""""""""

" Highlight code inside Markdown
let g:markdown_fenced_languages = ['bash', 'c', 'cpp', 'python', 'sh']



""""""""""""""""""""""""""""""""""""""""
" coc.nvim
""""""""""""""""""""""""""""""""""""""""

" coc.nvim
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
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
		imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

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
else
		call CocAction('doHover')
	endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
autocmd!
" Setup formatexpr specified filetype(s).
autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" coc-snippets
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-Space> <Plug>(coc-snippets-expand)
imap <C-j> <Plug>(coc-snippets-expand-jump)



""""""""""""""""""""""""""""""""""""""""
" easymotion
""""""""""""""""""""""""""""""""""""""""

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 1
map f <Plug>(easymotion-f)
map F <Plug>(easymotion-F)
map t <Plug>(easymotion-t)
map T <Plug>(easymotion-T)
map sw <Plug>(easymotion-w)
map sW <Plug>(easymotion-W)
map se <Plug>(easymotion-bd-e)
map sE <Plug>(easymotion-bd-E)
map sb <Plug>(easymotion-b)
map sB <Plug>(easymotion-B)
map sf <Plug>(easymotion-s)
map st <Plug>(easymotion-bd-t)
map S <Plug>(easymotion-repeat)
map <C-f> <Plug>(easymotion-next)
map <C-F> <Plug>(easymotion-prev)
map sj <Plug>(easymotion-sol-j)
map sk <Plug>(easymotion-sol-k)



""""""""""""""""""""""""""""""""""""""""
" git
""""""""""""""""""""""""""""""""""""""""

" gitgutter
" let g:gitgutter_highlight_lines = 1

noremap <leader>gf :GFiles<CR>
noremap <leader>gs :G<CR>
noremap <leader>gc :Gcommit<CR>
noremap <leader>gp :Gpush<CR>



""""""""""""""""""""""""""""""""""""""""
" Files
""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""
" Custom Key Bindings
""""""""""""""""""""""""""""""""""""""""

" ctrl-S now saves file
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>a
vnoremap <c-s> <Esc>:w<CR>

" Cursor stays in the middle
noremap j jzz
noremap k kzz
noremap n nzz
noremap N Nzz
noremap # #zz
noremap * *zz
noremap <C-u> <C-u>zz
noremap <C-d> <C-d>zz
cnoremap <CR> <CR>zz

" Reload .vimrc
autocmd BufNewFile,BufRead *vimrc noremap <F5> :source ~/.vimrc<CR>

" Moving between multiple files/windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-n> :next<CR>
inoremap <C-n> <Esc>:next<CR>
noremap <C-b> :previous<CR>
inoremap <C-b> <Esc>:previous<CR>

" ctrl-q to quit
nnoremap <C-q> :q<CR>
inoremap <C-q> <Esc>:q<CR>
vnoremap <C-q> <Esc>:q<CR>

" copy line to system clipboard
noremap <C-y> "+yy

" Tagbar
nnoremap <F1>t :TagbarToggle<CR>

" NERD tree
nnoremap <F1>f :NERDTreeToggle<CR>

" Tabular
nnoremap <Leader>t= :Tabularize /=<CR>
nnoremap <Leader>t: :Tabularize /:\zs<CR>
nnoremap <Leader>t< :Tabularize /<<CR>
nnoremap <Leader>t<< :Tabularize /<<<CR>
nnoremap <Leader>t> :Tabularize /><CR>
nnoremap <Leader>t>> :Tabularize />><CR>

" Formatting
nnoremap <F8> :AutoFormat<CR>
