:set number
:set relativenumber

" ==================================================
" Key Mappings
" ==================================================
nnoremap <SPACE> <Nop>
let mapleader=" " " Change the leader to be a space vs slash

" Maps for jj to act as Esc in insert and command modes
ino jj <esc>
cno jj <c-c>

"
" Window navigation
"

" control + vim direction key to navigate windows
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" control + arrow key to navigate windows
noremap <C-Down> <C-W>j
noremap <C-Up> <C-W>k
noremap <C-Left> <C-W>h
noremap <C-Right> <C-W>l

" - and + to resize horizontal splits
map - <C-W>-
map + <C-W>+
