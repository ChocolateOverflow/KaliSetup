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
	" General extentions
	Plug 'easymotion/vim-easymotion'
	Plug 'scrooloose/nerdcommenter'
	Plug 'tpope/vim-surround'
	Plug 'andymass/vim-matchup'
	Plug 'tpope/vim-repeat'
	Plug 'majutsushi/tagbar'
	" Lint
	Plug 'scrooloose/syntastic'
	" Formatting
	Plug 'godlygeek/tabular'
	" Autocomplete
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" git
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
	" External files
	Plug 'scrooloose/nerdtree'
	" Debugging
	Plug 'joonty/vdebug', {'for': ['c', 'cpp', 'python']}
	" C/C++
	Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp']}
	" Python
	Plug 'davidhalter/jedi-vim', {'for': 'python'}
	Plug 'davidhalter/jedi', {'for': 'python'}
call plug#end()



""""""""""""""""""""""""""""""""""""""""
" Themes and Background
""""""""""""""""""""""""""""""""""""""""

colorscheme onedark



""""""""""""""""""""""""""""""""""""""""
" autocmd
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
" Programming
""""""""""""""""""""""""""""""""""""""""

" C/C++
autocmd BufNewFile,BufRead *.c,*.cpp,*.h let g:cpp_class_scope_highlight = 1
autocmd BufNewFile,BufRead *.c,*.cpp,*.h let g:cpp_member_variable_highlight = 1
autocmd BufNewFile,BufRead *.c,*.cpp,*.h let g:cpp_class_decl_highlight = 1
autocmd BufNewFile,BufRead *.c,*.cpp,*.h let g:cpp_concepts_highlight = 1

" Python
" python-mode
autocmd BufNewFile,BufRead *.py let g:pymode_lint_on_write = 1
autocmd BufNewFile,BufRead *.py let g:pymode_run_bind = '<C-c>r'
autocmd BufNewFile,BufRead *.py let g:pymode_rope_goto_definition_bind = '<C-c>g'
autocmd BufNewFile,BufRead *.py let g:pymode_breakpoint_bind = '<C-c>b'
autocmd BufNewFile,BufRead *.py let g:pymode_rename_bind = '<C-c>n'

" Javascript

" HTML

" json
autocmd FileType json syntax match Comment +\/\/.\+$+

" XML




""""""""""""""""""""""""""""""""""""""""
" General Writing
""""""""""""""""""""""""""""""""""""""""

" Highlight code inside Markdown
let g:markdown_fenced_languages = ['bash', 'c', 'cpp', 'python', 'sh']


""""""""""""""""""""""""""""""""""""""""
" Linguistics
""""""""""""""""""""""""""""""""""""""""

" Spell check
" map (some key) :setlocal spell! spelllang=en_us<CR>


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

""""""""""""""""""""""""""""""""""""""""
" Snippets
""""""""""""""""""""""""""""""""""""""""

"let g:coc_snippet_next = '<C-l>'
"let g:coc_snippet_prev = '<C-h>'

"" <CR> confirms snippet
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
                                           "\"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"inoremap <silent><expr> <TAB>
	"\ pumvisible() ? coc#_select_confirm() :
	"\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
	"\ <SID>check_back_space() ? "\<TAB>" :
	"\ coc#refresh()

"function! s:check_back_space() abort
	"let col = col('.') - 1
	"return !col || getline('.')[col - 1]  =~# '\s'
"endfunction


""""""""""""""""""""""""""""""""""""""""
" Custom Key Bindings
""""""""""""""""""""""""""""""""""""""""

" ctrl-S now saves file
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>a
vnoremap <c-s> <Esc>:w<CR>

" Cursor stays in the middle
nnoremap j jzz
nnoremap k kzz
nnoremap n nzz
nnoremap N Nzz
nnoremap # #zz
nnoremap * *zz
cnoremap <CR> <CR>zz

" Reload .vimrc
autocmd BufNewFile,BufRead *vimrc noremap <F5> :source ~/.vimrc<CR>

" Moving between multiple files/windows
noremap <C-S-h> <C-w>h
noremap <C-S-j> <C-w>j
noremap <C-S-k> <C-w>k
noremap <C-S-l> <C-w>l
noremap <C-n> :next<CR>
inoremap <C-n> <Esc>:next<CR>
noremap <C-b> :previous<CR>
inoremap <C-b> <Esc>:previous<CR>

" ctrl-q to quit
nnoremap <C-q> :q<CR>
inoremap <C-q> <Esc>:q<CR>
vnoremap <C-q> <Esc>:q<CR>

" easy-motion
" nnoremap <C-f>*

" Tagbar
nnoremap <C-w>t :TagbarToggle<CR>

" NERD tree
nnoremap <C-w>f :NERDTreeToggle<CR>

" Tabular
nnoremap <Leader>t= :Tabularize /=<CR>
nnoremap <Leader>t: :Tabularize /:\zs<CR>
nnoremap <Leader>t< :Tabularize /<<CR>
nnoremap <Leader>t<< :Tabularize /<<<CR>
nnoremap <Leader>t> :Tabularize /><CR>
nnoremap <Leader>t>> :Tabularize />><CR>

