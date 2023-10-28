command! Reinit source ~/.config/nvim/init.vim
command! Config edit ~/.config/nvim/init.vim
command! MD4 :%s/^\s*/&&

function! FixMarkdown()
  "fix all the newline breaks in paragraphs
  :%s/\v(.)\n(.)/\1 \2/
  "remove html span tags
  :%s/\v\<span.*\>(.*)\<.span\>/\1/
  "remove double spaces
  :%s/\v[ ]{2,50}/ /g
  " remove spaces at start of line
  :%s/^ //
  " remove excesseive line breaks
  :%s/\v\n{3,50}/\r\r
endfunction

command! FixMarkdown :call FixMarkdown()

"python << enrand
"import vim
"def hello_world():
"  print("hello world")
"def print_vim_things():
"  a = vim.buffers
"  for x in dir(a):
"    print(x)
"enrand
"
"command! Vimpy :python print_vim_things()<CR>

"function! RandomizeLines()
"  " TODO: this doesn't work right-- it's weird
"  "function to randomize a selection of lines using python
"  "exec ":'<,'>!python -c \"import sys, random; l = [x.strip() for x in sys.stdin.read().strip().splitlines()]; random.shuffle(l); print(l)\""
"endfun
"
"

"vnoremap <leader>r :python hello_world()<CR>
"
"vnoremap <leader>n I0. <CR>gv<C-g>a
"

"function! s:wpm() abort
"    " Start!
"    if get(b:, 'wpm_start', 0) is 0
"        let b:wpm_start = [reltime(), wordcount()]
"    " Finish
"    else
"        let l:time = reltime(b:wpm_start[0])
"        let l:words = wordcount()['words'] - b:wpm_start[1]['words']
"        unlet b:wpm_start
"        let l:stat_string = strftime("%Y%m%dT%H%M%S") . "\t" . reltimestr(l:time) . "\t" . l:words . "\t" . &filetype
"        call writefile([l:stat_string], expand("~/wpm.log"), "a")
"    endif
"endfun
"
"command! WPM call s:wpm()
"
"" Optional: automatically do this when starting/leaving insert mode.
"augroup wpm
"    autocmd!
"    autocmd InsertEnter * :WPM
"    autocmd InsertLeave * :WPM
"augroup end


"# PLUGINS
"## Load plugins
" Get Plug from https://github.com/junegunn/vim-plug

call plug#begin()


" Vimwiki
Plug 'vimwiki/vimwiki'

" Markdown
Plug 'plasticboy/vim-markdown'

" edit markdown tables in sc-im
Plug 'mipmip/vim-scimark'

" auto complete suggestions
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


" clever-f
Plug 'rhysd/clever-f.vim'

" Ultisnips
Plug 'SirVer/ultisnips'

" for git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" for session continuation (use in combination with tmux)
" see https://github.com/tmux-plugins/tmux-resurrect/blob/master/docs/restoring_vim_and_neovim_sessions.md
Plug 'tpope/vim-obsession'

" fzf - requires being install with 'brew install fzf 
" Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


" for html:
Plug 'mattn/emmet-vim' " enable emmet plugin for html
Plug 'hail2u/vim-css3-syntax' " CSS3 syntax (and syntax defined in some foreign specifications) support for Vim’s built-in syntax/css.vim

" for Javascript:
Plug 'jelera/vim-javascript-syntax'

" for alignment:
Plug 'junegunn/vim-easy-align'

" for beancount
Plug 'nathangrigg/vim-beancount'

" code live code results in a buffer
Plug 'metakirby5/codi.vim'


" LightLine for status line
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline' " for bufferline support


" get devicons for things
Plug 'ryanoasis/vim-devicons'

" highlighting etc. for python jinja templates
" Plug 'lepture/vim-jinja' <- this one gives me a lot of problems it seems
Plug 'Glench/Vim-Jinja2-Syntax'

" goyo and limelight for focused writing.
Plug 'junegunn/goyo.vim'

" tabular.vim - for aligning stuff easy
Plug 'godlygeek/tabular'



"## THEMES
Plug 'sonph/onehalf', { 'rtp': 'vim' }

call plug#end()



"# COLORSCHEME/THEME
" here for quick scope plugin
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary cterm=underline
augroup END

colorscheme onehalfdark


" find what a text object is with
" echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')

command! SyntaxGroup echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')


set background=dark

"## settings for pencil 
let g:pencil_gutter_color=1 " color for git gutter stuff 
let g:pencil_terminal_italics=1

"## settings for Indent Guides plug 
let g:indentguides_ignorelist = ['text', 'help', 'markdown']
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'

"# BASIC SETTINGS

" Set python3 interpreter path
" this is using pyenv
" see help provider-python
" pip install pynvim
" pyenv which python <- use that path here
let g:python3_host_prog=expand("~")."/.pyenv/versions/3.11.0/bin/python"

" turn off swap files
set noswapfile

" turn on undofile
set undodir=~/.vim/undodir
set undofile   " use with :undolist


" filetype plugins
filetype plugin indent on
" indend in here means it will use custom indentation as determined in the
" ftplugin

" Default Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Fix backspace indent
set backspace=indent,eol,start

" Enable hidden buffers - this is to prevent the case of not being able to
" close nvim if there is a hidden buffer.
set hidden

" Default Tabwidth 4. May be override with autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

set conceallevel=0

" Map leader to comma 
let g:mapleader=','
nnoremap \ ,

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set inccommand=split " split search results  - this gives a preview window for find and replace

" File Formats
set fileformats=unix,dos,mac

" Shell
set shell=/bin/zsh

" auto-read sync with filesystem changes if any
" this is here mainly for beancount
set autoread
au CursorHold * checktime

" setting clipboard to this makes it possible to use y and p universally
set clipboard=unnamed,unnamedplus

" enable the mouse
set mouse=a

" Setting for :grep
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading\ --no-column
    "set grepformat=%f:%l:%c:%m,%f:%l:%m
    set grepformat=%f:%l:%m,%f:%l:%m
endif





"# VISUAL SETTINGS

syntax on " syntax highlighting on
set ruler
set wrap
set number
" relative line numbers
set relativenumber
set rnu

let no_buffers_menu=1

" modeline is for checking the type of vim shebang at top of file
set modeline
set modelines=10

" necessary to use statusbar
set laststatus=2

" set the highlight color of folds
highlight Folded ctermbg=239

"# MAPPINGS
"## ESC in input mode change keyboard to US layout
" needs executable built from github repo: 1dancook/kbswitch 
inoremap <ESC> <ESC>:execute 'silent! !kbswitch com.apple.keylayout.ABC'<CR>:echon ''<CR>

"## Help
autocmd FileType help noremap <buffer><silent> q :q<cr>
autocmd FileType help noremap <buffer><silent> <CR> <C-]> 

"## Visual Mode: use space to toggle sides 
vnoremap <space> o 


"## Search mappings 
" These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv




"## Shortcuts for FZF Files and Buffers
"
" fzf :Files! command
nnoremap <C-p> :Files!<CR>
" fzf :Lines! command - remember like GOTO LINE
nnoremap <leader>g :Lines!<CR>
" fzf :RG! command
nnoremap <leader>r :RG!<CR>
" fzf :Buffers  (use ls since it is similar to :ls)
nnoremap <leader>ls :Buffers!<CR> 
" buffer delete command for FZF
nnoremap <leader>D :BD<CR>

"## Move around Windows
nnoremap <C-j> <C-w>j " go to window below
nnoremap <C-k> <C-w>k " go to window above
nnoremap <C-h> <C-w>h " go to window left
nnoremap <C-l> <C-w>l " go to window right


"## Keep selection after indent/outdent
vnoremap < < gv
vnoremap > > gv
nnoremap < <<
nnoremap > >>

"## Insertions
" insert date:
nmap <silent> <leader>id :put =strftime('%Y-%m-%d ')<CR>A

" enter insert, then jump to expression register to insert a caculation
nmap <leader>ic i<C-r>=

" replace selection with calculated result using expression register
" Change Selection / Calculate Selection
vmap <silent> <leader>cs c<C-r>=<C-r>"<CR><ESC>

" 'clear' search by turning off search highlighting until next search 
nmap <silent> <leader>/ :noh<CR>:echo "Search highlight off"<CR>

"## Open File with macos 'open'
"note: this doesn't work for files with a space
nnoremap gO !open <cfile><cr>


"## Use Ripgrep for searching wiki

function! VimwikiTodo()
  let l:currentpath = getcwd()
  execute "silent cd! ~/Dropbox/wiki"
  execute 'silent grep! -e "TODO" -e "- \[ \]" '
  execute "copen"
  execute "silent cd! ".l:currentpath
endfunction

nnoremap <silent> <leader>wt :call VimwikiTodo()<cr>

"## Close Quick Fix Window 
autocmd FileType qf nnoremap <buffer><silent> <ESC> :ccl<cr>
autocmd FileType qf nnoremap <buffer><silent> q :ccl<cr>



"# PLUGIN SETTINGS and SCRIPTS
" this should go after basic settings so as to use 
" some things like the redefined leader key etc.

"## Vim Markdown
let g:vim_markdown_follow_anchor = 1 "follow anchor - use ge
let g:vim_markdown_new_list_item_indent = 0 "or 2?
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite = 1 "auto write when following link
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_folding_level = 1
let g:vim_markdown_frontmatter = 1

"## Clever-F
let g:clever_f_smart_case = 1
let g:clever_f_mark_direct = 1
let g:clever_f_use_migemo = 1
let g:clever_f_across_no_line = 1
map ; <Plug>(clever-f-repeat-forward)
map , <Plug>(clever-f-repeat-back)





"## Vimwiki 

" Change the default directory and filetype for vimwiki
" I want to use markdown
let g:vimwiki_list = [{'path': '~/Dropbox/wiki',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_conceallevel = 0
let g:vimwiki_global_ext = 0
let g:vimwiki_key_mappings = {
            \ 'all_maps': 1,
            \ 'global': 1,
            \ 'headers': 1,
            \ 'text_objs': 1,
            \ 'table_format': 1,
            \ 'table_mappings': 0,
            \ 'lists': 1,
            \ 'links': 1,
            \ 'html': 1,
            \ 'mouse': 0,
            \ }
function! CheckVimWiki(filepath)
  for wiki in g:vimwiki_list
    if match(a:filepath, wiki.path)
      set filetype="vimwiki"
      return
    endif
  endfor
endfunction

function! RemoveTabMap()
  iunmap <buffer> <tab>
endfunction



autocmd FileType markdown :call CheckVimWiki(expand("<afile>"))

"## Deoplete 
"### Enable Deoplete and initial setup
let g:deoplete#enable_at_startup = 1
call g:deoplete#custom#option('ignore_case', v:true)




"### Toggle Deoplete with :DEO  
command! DEO call deoplete#toggle() | if deoplete#is_enabled() | echo "Deoplete is Enabled" | else | echo "Deoplete is Disabled" | endif




"## LightLine

set showtabline=2
let g:lightline = {
      \ 'colorscheme': 'onehalfdark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [], ['lightlinepath'] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'filetype', 'wordcount' ] ] 
      \     },
      \ 'tabline': {
      \  'left': [ ['modifiedFile'], ['buffers'] ],
      \  'right': [ ['fugitive'], ['gitgutterSummary'] ]
      \     },
      \ 'component': { 
      \   'lineinfo': '%l:%c%<', 
      \   'relativepath': '%f',
      \ }, 
      \ 'component_function': {  
      \   'wordcount': 'LightlineWordCount', 
      \   'readonly': 'LightlineReadonly', 
      \   'fugitive': 'LightlineFugitive',
      \   'gitgutterSummary': 'LightlineGitGutter',
    \     'lightlinepath': 'LightlinePath',
      \  },
      \ 'component_expand': {'buffers': 'lightline#bufferline#buffers', 'modifiedFile': 'LightlineModified'},
      \ 'component_type': {'buffers': 'tabsel', 'modifiedFile': 'error'},
      \ 'subseparator': { 'left': '|', 'right': '|' } 
      \ }
   


function! LightlinePath()
  let home = expand('$HOME')
  let path = expand('%:p:h')
  let trimmedPath = substitute(path, home, '~', 'g') 
  return ' '.pathshorten(trimmedPath)
endfunction

function! LightlineGitGutter()
  if exists('b:gitgutter.summary')
    let l:summary = b:gitgutter.summary
  else
    let l:summary = [0, 0, 0]
  endif
  if max(l:summary) > 0
    return ' +'.l:summary[0].' ~'.l:summary[1].' -'.l:summary[2].' '
  endif
  return ''
endfunction

function! LightlineModified()
  return &modified ? "●" : ""
endfunction

function! LightlineReadonly() 
  return &readonly ? '' : '' 
endfunction 

function! LightlineFugitive() 

  if exists('*FugitiveHead') 
    let branch = FugitiveHead() 
    return branch !=# '' ? ' '.branch : '' 
  endif 
  return '' 
endfunction 

function! LightlineWordCount() abort
  return &filetype =~# '\v(vimwiki|tex|markdown|txt|text)' ? wordcount().words . 'w' : ''
endfunction

" Bufferline provides support for going to and delete buffers with mappings
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#margin_left = 1
let g:lightline#bufferline#margin_right = 1
let g:lightline#bufferline#modified = ' ●'
let g:lightline#bufferline#read_only = ' '
let g:lightline#bufferline#unnamed = 'unnamed'


nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
"could add delete buffer mappings for lightline buffer like this:
"nmap <Leader>bd1 <Plug>lightline#bufferline#delete(1)



"## Floaterm

" map escape to close it
"autocmd FileType floaterm tnoremap <buffer><silent> <ESC> <C-\><C-n> :q<CR> 
"tnoremap <silent> <ESC> <C-\><C-n> :FloatermToggle<CR> 

" float term stuff
"nnoremap <silent> <leader>t :FloatermToggle --cwd=<root><CR>
"
"let g:floaterm_wintype = 'split' " or float
"let g:floaterm_position = 'bottom'
"let g:floaterm_width = 1.0 " use float for percent
"let g:floaterm_height = 0.4 " use float for percent 
"let g:floaterm_borderchars = '─   ──  '
"let g:floaterm_opener = 'edit'  " default is split




"## fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --color=always -E .git -E __pycache__ -E .vscode'
let $FZF_DEFAULT_OPTS="--ansi --reverse --cycle --info=inline --prompt='❱ ' --pointer='❱' --marker='❱' --color='pointer:2,marker:2,prompt:8,header:8,hl:6,info:8,hl+:5,query:6'"

" escape to close fzf pop up windows
autocmd! FileType fzf tnoremap <buffer> <silent> <ESC> <C-q>

" disable lines numbers for fzf window
autocmd! FileType fzf set nornu | set nonu

let g:fzf_preview_window = ['down:60%:noborder', 'ctrl-/']
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Always use fullscreen for all fzf commands
"command! Files Files!
"command! GFiles GFiles!
"command! Buffers Buffers!
"command! Colors Colors!
"command! Ag Ag!
"command! Rg Rg!
"command! Lines Lines!
"command! BLines BLines!
"command! Tags Tags!
"command! BTags BTags!
"command! Marks Marks!
"command! Windows Windows!
"command! Locate Locate!
"command! History History!
"command! Snippets Snippets!
"command! Commits Commits!
"command! BCommits BCommits!
"command! Commands Commands!
"command! Maps Maps!
"command! Helptags Helptags!
"command! Filetypes Filetypes!

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --bind ctrl-a:select-all+accept'
\ }))

" this is full screen interactive ripgrep with preview
" taken from fzf.vim readme
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)


"## gitgutter 
let g:gitgutter_sign_added = '│'
let g:gitgutter_sign_modified = '│'
let g:gitgutter_sign_removed = '╷'
let g:gitgutter_sign_removed_first_line = '╵'
let g:gitgutter_sign_removed_above_and_below = '│'
let g:gitgutter_sign_modified_removed = '├'

"## Ultisnips



let g:UltisnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
"let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsListSnippets = "<c-tab>"
"let g:UltiSnipsJumpForwardTrigger = "<c-j>"
"let g:UltiSnipsJumpBackwardTrigger = "<c-k>"




"# AUTOCMD RULES
"## For Markdown
augroup Markdown
    autocmd!
    " set line wrap
    autocmd FileType markdown set wrap
    " Indents word-wrapped lines as much as the 'parent' line
    autocmd FileType markdown set breakindent
    " Ensures word-wrap does not split words
    autocmd FileType markdown set formatoptions=l
    autocmd FileType markdown set linebreak
    autocmd FileType markdown set conceallevel=0
augroup END

"## syntax highlight syncing
" see :he syn-sync
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"## Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"## Custom Tabs per filetype
autocmd! Filetype html setlocal ts=2 sw=2 expandtab
autocmd! Filetype javascript setlocal ts=2 sw=2 expandtab softtabstop=2
autocmd! FileType text set tw=50000
autocmd! FileType beancount setlocal ts=2 sw=2 expandtab
autocmd! FileType markdown setlocal ts=4 sw=4 expandtab
autocmd! FileType vimwiki setlocal ts=4 sw=4 expandtab
autocmd! FileType python setlocal ts=4 sw=4 expandtab 
autocmd! FileType vim setlocal ts=2 sw=2 expandtab 
autocmd! FileType yaml setlocal ts=2 sw=2 expandtab 
autocmd! FileType jinja setlocal ts=2 sw=2 expandtab 
autocmd! FileType tsv setlocal expandtab!


"## Beancount Auto Formatting
augroup mm_buf_cmds
  " after saving a beancount file, run bean-format
  autocmd bufwritepost *.beancount silent !bean-format % -o %
augroup END



"## Filetype detection
" for TSV files
au BufRead,BufNewFile *.tsv setfiletype tsv
"# SCRIPTS 
"## Fix Quotes


command! FixQuotes execute ':%s/[“”]/"/g' | execute ":%s/[’‘]/'/g"




"## Autofolding Vim Scripts 
" see http://vimcasts.org/episodes/writing-a-custom-fold-expression/
" modified version of https://vi.stackexchange.com/a/6608
"
" defines a foldlevel for each line of code
function! VimFolds(lnum)
  let s:thisline = getline(a:lnum)
  if match(s:thisline, '^"# ') >= 0
    return '>1'
  endif
  if match(s:thisline, '^"## ') >= 0
    return '>2'
  endif
  if match(s:thisline, '^"### ') >= 0
    return '>3'
  endif
  return '='
endfunction


" defines a foldtext
function! VimFoldText()
  " handle special case of normal comment first
  let s:info = '('.string(v:foldend-v:foldstart).' l)'
  if v:foldlevel == 1
    let s:line = '❱'.getline(v:foldstart)[2:]
  elseif v:foldlevel == 2
    let s:line = '❯❱'.getline(v:foldstart)[3:]
  elseif v:foldlevel == 3
    let s:line = '❯❯❱'.getline(v:foldstart)[4:]
  endif
  return s:line
  "if strwidth(s:line) > 80 - len(s:info) - 3
  "  return s:line[:79-len(s:info)-3+len(s:line)-strwidth(s:line)].'...'.s:info
  "else
  "  return s:line.repeat(' ', 80 - strwidth(s:line) - len(s:info)).s:info
  "endif
endfunction

"### set foldsettings automatically for vim files
augroup fold_vimrc
  autocmd!
  autocmd FileType vim 
                   \ setlocal foldmethod=expr |
                   \ setlocal foldexpr=VimFolds(v:lnum) |
                   \ setlocal foldtext=VimFoldText() |
augroup END


"
"# TODO/IDEAS/TESTING
"TODO: add a nerd comment plug and use leader+/ to toggle comments
"## a cheat sheet
"-  file in nvim config?
"- binding to open it in readonly mode, split (:splitview)
nnoremap <leader>ch :new<CR>:view ~/.config/nvim/docs/vim-cheatsheet.txt<CR>

"- binding to close it quickly (just q)
"- binding to open it for editing
"
"
"## TODO: add a shortcut for session saving?
"change default load to use session if available
"shortcut to close and save session (like command+shift+w in vscode)
"
"
"
"
"## TODO: syntax matching headings for vim file and maybe same-line comments as well
"`syntax match nameIWant "regex"`
"hi nameIWant ctermfg=#
"https://vi.stackexchange.com/a/9917
"



