"------------------------------
" Vundle and bundles config
"------------------------------
"source ~/.vim/bundles.vim

" Use neobundle to automatically build vimproc
"------------------------------
" NeoBundle and bundles config
"------------------------------
source ~/.vim/neobundles.vim

" zsh not do correct path setting in OSX
set shell=/bin/bash

"------------------------------
" for windows vim with ruby1.9
"------------------------------
"let g:ruby_path = "C:\Ruby192\bin"

"----------------------------
" enbale file type detection
"----------------------------
filetype plugin indent on
syntax on
"set foldmethod=syntax
"set foldlevel=1

"--------------------
" colorscheme
"--------------------
color desert

"let g:solarized_termtrans = 1
"color solarized

"--------------------
" encoding
"--------------------
set fencs=utf-8,cp936,sjis
set enc=utf-8

"--------------------
" normal setting
"--------------------
set number
"set relativenumber
set autoindent
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" This means that you can have unwritten changes to a file and open a new file
" using :e, without being forced to write or undo your changes first.
set hidden

" show command menu, work great with snapmate-snippets
set wildmenu

" do not wrap line
"set nowrap
set wrap

" do not create backup, swap file, use git for version managment
set nobackup
set noswapfile

if has('mac')
  source $HOME/vimfiles/mvimrc
endif

"-----------------------
" status line setting
"-----------------------
set laststatus=2
" comment out since using airline
"set statusline=%<%f\ %h%m%r%=[TYPE=%Y]\ [FORMAT=%{&ff}]\ [ENC=%{&enc}]\ [FENC=%{&fenc}]\ %-14.(%l,%c%V%)\ %P

"--------------------------------
" invisible character setting
"--------------------------------
"unicode for \u25b8 for `▸', \u00ac for `¬'
"set listchars=tab:▸\ ,eol:¬
set listchars=tab:▸\ 
set list
" nnoremap toggle, or use F4
nnoremap <leader>l :set list!<cr>
" trim trailing whitespace
nnoremap <leader>W :%s/\s\+$//c<cr>

"------------------------------------
" highlight trailing space
"------------------------------------
" comment out lines below to unhighlight trailing space
"let no_trailing_space_error = 1
if !exists('no_trailing_space_error')
  au BufWinEnter * hi link TrailingSpace Error
  au BufWinEnter * syn match TrailingSpace /\s\+$/ display
endif

"--------------------------------------------------------
" highline current line & column
" DOES NOT WORK with colorscheme solarized and blackboard
"--------------------------------------------------------
set cursorline
set cursorcolumn
highlight cursorline term=underline cterm=underline ctermbg=0 gui=underline guibg=NONE guisp=grey40
highlight cursorcolumn guibg=grey25
if has("autocmd")
  "au WinEnter * set cursorline cursorcolumn
  au BufEnter * set cursorline cursorcolumn
endif

nnoremap <silent> <leader>cur :set cursorline! cursorcolumn!<cr>

" hightlight search
set incsearch
set hlsearch
nnoremap <silent> <esc><esc> :noh<cr>

"------------------------
" for quick load vimrc
"------------------------
noremap <leader>vc :tabedit $MYVIMRC<cr>
noremap <leader>ve :tabedit $HOME/vimfiles/vimrc<cr>
noremap <leader>vg :tabedit $HOME/vimfiles/gvimrc<cr>
noremap <leader>vm :tabedit $HOME/vimfiles/mvimrc<cr>

" filetype detection
if has("autocmd")
  " set rxls filetype to ruby
  autocmd bufnewfile,bufread *.rxls set filetype=ruby

  " set thor filetype to ruby
  autocmd bufnewfile,bufread *.thor,*.ru,Gemfile,Gemfile.lock set filetype=ruby

  " set god filetype to ruby
  autocmd bufnewfile,bufread *.god set filetype=ruby
endif

"-----------------------
" Shortcut keys mappings
"-----------------------
" search & replace current word under cursor
nnoremap <F3> /<c-r><c-w><cr>
nnoremap <C-F3> /<c-r><c-w><cr>N:%s/<c-r><c-w>//gc<left><left><left>
nnoremap <D-F3> /<c-r><c-w><cr>N:%s/<c-r><c-w>//gc<left><left><left>
" search & current selection, support new-line
vnoremap <F3> "sy/<c-r>=substitute(@s,'\n','\\n','g')<cr>/<cr>
vnoremap <C-F3> "sy/<c-r>=substitute(@s,'\n','\\n','g')<cr>/<cr>N:%s/<c-r>=substitute(@s,'\n','\\n','g')<cr>//gc<left><left><left>
vnoremap <D-F3> "sy/<c-r>=substitute(@s,'\n','\\n','g')<cr>/<cr>N:%s/<c-r>=substitute(@s,'\n','\\n','g')<cr>//gc<left><left><left>

" F4 toggle for paste, Insert Mode
set pastetoggle=<F4>
" toggle for copy & paste, Normal Mode
nnoremap <silent> <F4> :set nu!<CR>:set rnu!<CR>:set list!<CR>
" toggle mouse with F12, for selection be copied to system clipboard
set mouse=a
" set windows only
nnoremap <silent> <F11> :on<cr>

"--------------------------------
" copyed from junas vim config
"--------------------------------
" format the entire file
nmap <leader>fef ggVG=

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" Some helpers to edit mode
" http://vimcasts.org/e/14
nmap <leader>ew :e <C-R>=expand('%:h').'/'<cr>
nmap <leader>es :sp <C-R>=expand('%:h').'/'<cr>
nmap <leader>ev :vsp <C-R>=expand('%:h').'/'<cr>
nmap <leader>et :tabe <C-R>=expand('%:h').'/'<cr>

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='
nmap <silent> <leader>ul :t.<CR>Vr=

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" use tjump instead of tag
nnoremap <C-]> g<C-]>
vnoremap <C-]> g<C-]>

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" Adjust viewports to the same size
map <Leader>= <C-w>=

"-------------------------------
" Windows switch with Ctrl+↑↓←→
"-------------------------------
noremap <silent> <C-left> <esc><C-W><left>
noremap <silent> <C-right> <esc><C-W><right>
noremap <silent> <C-up> <esc><C-W><up>
noremap <silent> <C-down> <esc><C-W><down>

"----------------------------
" Tab navigation
"----------------------------
noremap <silent> tf :tabfirst<cr>
noremap <silent> tl :tablast<cr>
noremap <silent> tp :tabprevious<cr>
noremap <silent> tn :tabnext<cr>
noremap <silent> tc :tabclose<cr>
noremap <silent> ts :tab split<cr>
noremap te :tabedit<space>
noremap tm :tabmove<space>


"---------------------------
" Rails map
"---------------------------
nnoremap <silent> rdm :Rake db:migrate<cr>
nnoremap <silent> rds :Rake db:seed<cr>

"---------------------------
" Git map
"---------------------------
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gi :Git<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>ge :Gedit<CR>

"----------------------------
" Abbreviation
"----------------------------

"----------------------------
" Filter
"----------------------------
autocmd filetype html setlocal equalprg=html-beautify\ -f\ -\ -s\ 2
autocmd filetype css setlocal equalprg=css-beautify\ -f\ -\ -s\ 2
autocmd filetype js setlocal equalprg=js-beautify\ -f\ -\ -s\ 2

if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif
"
