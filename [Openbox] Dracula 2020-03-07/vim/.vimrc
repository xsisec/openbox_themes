" Plugins will be downloaded under the specified directory.
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

set number
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" Java completion
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java JCEnable


let g:workspace_create_new_tabs = 0  " enabled = 1 (default), disabled = 0
nnoremap <leader>s :ToggleWorkspace<CR>

let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_autosave_always = 1


call plug#begin()
Plug 'preservim/nerdtree',
Plug 'thaerkh/vim-workspace'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'majutsushi/tagbar'
Plug 'mikelue/vim-maven-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()


"" Tagbar
map <C-b> :TagbarToggle<CR>


""Resize the Columns
" noremap <silent> <C-S-Left> :vertical resize +5<CR>
" noremap <silent> <C-S-Right> :vertical resize -5<CR>
noremap <silent> <C-S-Left> :vertical resize +1<CR>
noremap <silent> <C-S-Right> :vertical resize -1<CR>


if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


