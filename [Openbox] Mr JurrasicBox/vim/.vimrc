" Plugins will be downloaded under the specified directory.
autocmd VimEnter * NERDTree

nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>


set number
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set expandtab




let g:workspace_create_new_tabs = 0  " enabled = 1 (default), disabled = 0
nnoremap <leader>s :ToggleWorkspace<CR>

let g:workspace_autosave_always = 1


call plug#begin()
Plug 'janko/vim-test'
Plug 'preservim/nerdtree',
Plug 'thaerkh/vim-workspace'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'majutsushi/tagbar'
Plug 'mikelue/vim-maven-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ryanoasis/vim-devicons'


call plug#end()


"" Tagbar
map <C-b> :TagbarToggle<CR>




nmap <C-l> :vertical res-5<CR>
nmap <C-j> :vertical res+5<CR>
nmap <C-i> :res-5<CR>
nmap <C-k> :res+5<CR>


nmap <silent> <C-f> :TestFile<CR>	 "  ctrl + f
nmap <silent> <C-s> :TestSuite<CR>   "  Ctrl+s
nmap <silent> <C-g> :TestVisit<CR>   "  Ctrl+g



if !has('gui_running') && $TERM !~ 'xfce4-terminal' && !has('nvim')
    if $TERM =~ 'rxvt' || $TERM == 'linux'
        execute "set <c-left>=\<esc>Od"
        execute "set <c-right>=\<esc>Oc"
    else
        execute "set <c-left>=\<esc>1;5D"
        execute "set <c-right>=\<esc>1;5C"
    endif
endif
cnoremap <c-left> <s-left>
cnoremap <c-right> <s-right>



if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
