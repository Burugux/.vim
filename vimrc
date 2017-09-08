" load plugins
execute pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on
colorscheme delek

"
" settings
"
set backspace=indent,eol,start  "Makes backspace key more powerful.
set autoread
set autowrite
set number
set showcmd
set nobackup	
set noswapfile  
set t_Co=256
set laststatus=2
let g:airline_powerline_fonts = 1
set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline\ Regular:h20 
set ruler
set ignorecase
set incsearch
set splitright
set encoding=utf-8

" open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L


"text wrap for plain text
autocmd FileType text setlocal textwidth=78

" dont save .netrwhist history
let g:netrw_dirhistmax=0

" Favorite filetypes
set ffs=unix,dos,mac

" spell check for git commits
autocmd FileType gitcommit setlocal spell

" Go settings
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

" terminal emulator
if exists(':tnoremap')
	tnoremap <Esc> <C-\><C-n>
	autocmd BufWinEnter,WinEnter term://* startinsert
	autocmd BufLeave term://* stopinsert
endif

" Use tab and shift-tab to cycle through windows.
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W

" ==================== Fugitive ====================
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gp :Gpush<CR>
vnoremap <leader>gb :Gblame<CR>

" ==================== Vim-go ====================
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

"run :GoBuild or :GoTestCompile based on the go file
 function! s:build_go_files()
   let l:file = expand('%')
     if l:file =~# '^\f\+_test\.go$'
         call go#test#Test(0, 1)
           elseif l:file =~# '^\f\+\.go$'
               call go#cmd#Build(0)
                 endif
                 endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

" ==================== delimitMate ====================
 let g:delimitMate_expand_cr = 1
 let g:delimitMate_expand_space = 1
 let g:delimitMate_smart_quotes = 1
 let g:delimitMate_expand_inside_quotes = 0
 let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'


"==================== NerdTree ====================
" For toggling
nmap <C-n> :NERDTreeToggle<CR>
noremap <Leader>z :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>

let NERDTreeShowHidden=1

let NERDTreeIgnore=['\.vim$', '\~$', '\.git$', '.DS_Store']

" Close nerdtree and vim on close file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
