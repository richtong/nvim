scriptencoding utf-8
" Added by install-neovim.sh on Sat Sep 12 12:49:21 PDT 2020
" check for vim-plug install if needed
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
" https://github.com/junegunn/vim-plug/issues/739
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
"let plug_install=0
"let autoload_plug_path = stdpath('config') . '/site/autoload/plug.vim'
"if ! filereadable(autoload_plug_path)
"    silent execute '!curl -fL --create-dirs -o '
"        \ . autoload_plug_path .
"        \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"    execute 'source ' . fnameescape(autoload_plug_path)
"    let plug_install = 1
"endif
let g:data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(g:data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.g:data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  augroup VPLUG
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif

" Allow ALE and coc.nvim to work together
" https://github.com/dense-analysis/ale
" coc.settings.json add diagnostic.displayByAle
" let g:ale_disable_lsp = 1

" https://github.com/junegunn/vim-plug
call plug#begin(stdpath('data') . '/plugged')

" https://github.com/Shougo/deoplete.nvim
if has('nvim')
    Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
" Syntax highlights for Solidity
" unmaintained Plug 'tomlion/vim-solidity'
Plug 'thesis/vim-solidity'

" https://protofire.github.io/solhint/
" Solhint as solc does not syntax check
Plug 'sohkai/syntastic-local-solhint'

" GitHub Copilot does not run in vim only neovim and vscode
Plug 'github/copilot.vim'

" you can find things around quotes with text-object try va"
" cs"'  - change surrounding double quote to single quote
" cst"  - change the surrounding html tag to double quotes
" ds" - delete surround double quotes
" ysis[ - insert brackets around the current sentence
" ysiw" - inserts double quotes around a word (fail randomly some interaction)
" vf.S[ - go to visual mode, find the next period, Subsitute around it brackets
"Plug 'tpope/vim-surround'
" alternative to vim-surround
" sa{motion/textobject}{addtion} - saiw( sandwich add insert word ()
" sdb - delete surround character
" sd{deletion} - deletion a specific surround character
" srb{addition} - sandwich replace the surrounding - srb( replaces parensd
" sr{deletion}{addition} - sandwidth replace around the movement
Plug 'machakann/vim-sandwich'

" Using mermaid for sequence and viewing markdown
" Thanks to Wowchemy for pointer
" https://github.com/xavierchow/vim-sequence-diagram
" enabled with .seq files, start with <leader>t
" Supports mermaid syntax based on vim-sequaence-diagram
" this does not seem to work so cannot get mermaid preview in .seqa
"Plug 'zhaozg/vim-diagram'
" This only handles sequecne diagrams in UML
" https://github.com/bramp/js-sequence-diagrams
" :Graphviz! jpg create the jpg and open it for the corresponding dot file
Plug 'liuchengxu/graphviz.vim'

" https://junegunn.kr/2014/06/emoji-completion-in-vim/
" C-X/C-U to get the gitmoji :boom: and see how it translates
" So you get text and works when UTF-8 is not available.
Plug 'junegunn/vim-emoji'
" <C-X><C-E> For directly entering emojis where you want the Unicode character
Plug 'kyuhi/vim-emoji-complete'

Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
" in a .md file Ctrl-p will preview which looks really ugly use iamcco instead
"Plug 'jamshedvesuna/vim-markdown-preview'
" https://github.com/iamcco/markdown-preview.nvim
" :MarkdownPreview starts and then :MarkdownPreviewStop to end
" can visualize katex, mermaid, js-sequence-diagms, flowchart
" does not work and says mkdp#util#install does not exist
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" This runs works with vim and test by comment then :source % :PlugInstall
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'pwd && yarn install && yarn upgrade'  }

" colorscheme tuned for Mac Terminal
Plug 'altercation/vim-colors-solarized'
" Use this for xterm2
Plug 'lifepillar/vim-solarized8'

" Using Powerline instead but then it broke so back again to vim-airline
" https://www.tecmint.com/powerline-adds-powerful-statuslines-and-prompts-to-vim-and-bash/
" better status line that is vim only
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" fzf - fuzzy find with auto update of fzf
" :Files [PATH] all files from PATH
" :GFiles git ls-files
" :Rg [PATTERN] run ripgrep
" :Marks :Windows
" Ctrl-t for new tab, Ctrl-x new split Ctrl-v vertical split
Plug 'junegunn/fzf', { 'do' : {-> fzf#install() }}
Plug 'junegunn/fzf.vim'

" https://github.com/zhaozg/vim-diagram
" for .seq files then \t brings up a windo and shows you the diagram
" doe not seem to and not enough files
"Plug 'zhaozg/vim-diagram'
" Navigate directory tree
Plug 'preservim/nerdtree'
" shows git status in nerdtree
" :NERDTree to start
Plug 'xuyuanp/nerdtree-git-plugin'

" 5\ci inverts a comment for next 5 lines
" 5\cc comment out 5 lines
" 5\c<space> togles, so if top is commented, all the rest are uncommented
" 5\cn comment out with nexting the next 5 lines
" 5\cm comment out the next 5 lines with multi part deliminator
" 5\cs sexy comment that is as a block comment
" \c space inverts the entire block
" Need let g:NERDDefaultAlign = 'left' so mypy likes the comments
Plug 'preservim/nerdcommenter'

" Tagbar that learns from LSP servers
Plug 'liuchengxu/vista.vim'

" Python specific text objects, classes, functions
Plug 'jeetsukumaran/vim-pythonsense'

" No longer maintained switched to a fork
" Plug 'jiangmiao/auto-pairs'
" <CR> return inserts a new indented line with indenting for {}
" <BS> Backspace deletes the pair of brackets or parents
" default is the first since cannot get <M-p> to work on a Mac
" <C-p><C-t> or <M-p> Toggle autopairs.
" <C-f> and not <M-e> Fast wrap when in insert mode, wraps word that follow
" <C-p><C-s> and not <M-n> Jump to next closed pair
" <C-p><C-b> or <M-m> back inserts not used if flymode is off recommended
" https://github.com/LunarWatcher/auto-pairs
Plug 'LunarWatcher/auto-pairs', { 'tag' : '*' }

" Ugly! Atom inspired color scheme or junngunn/seoul256.vim
" "Plug 'joshdick/onedark.vim'
" does not work
" Plug 'frankmer/neovim-colors-solarized-truecolors'
Plug 'overcache/neosolarized'

" syntax highlighting (can also use sheerun/vim-polyglot)
" https://github.com/numirias/semshi/issues/59
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" Python indenting
Plug 'vimjas/vim-python-pep8-indent'

" Asychronous (the point of neovim) multi-language linting
" :ALEInfo for available linters :ALEFix to let YAPF fix it
" ALE, Syntastic and Coc all compete, have overlapping features
" So use ALE for shellcheck, but Coc for languages
Plug 'dense-analysis/ale'

" Interface to jedi (use coc instead) for command completion
" Note that this duplicates what coc does with gd, gr
" \d to definition, \g to assignment, \s goto stub, K for documentation
" \r to rename variable, \n all name usages
" https://stackoverflow.com/questions/1764263/what-is-the-leader-in-a-vimrc-file
" Plug 'davidhalter/jedi'

" Completion using a floating window, neovim only
" https://stackoverflow.com/questions/69295405/nvim-with-coc-and-formatting-for-python
" must manally run :CocInstall coc-jedi coc-json
" All these need to be manually enabled all bindings below

"Plug 'neoclide/coc.nvim', {'branch': 'release'}


" directory level version of vimdiff or vim -d <file1> <file2>
" https://www.tutorialspoint.com/vim/vim_diff.htm
" https://github.com/will133/vim-dirdiff
" :DirDiff <dir1> <dir2>
" vi -c "DifDiff dir1 dir2""
Plug 'will133/vim-dirdiff'

" Shell formatting run with :Shfmt
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }

" Git in vi with :G commit,:G diff, :G difftool, :Gdiffsplit
Plug 'tpope/vim-fugitive'
" Git signs in the gutter
Plug 'airblade/vim-gitgutter'

" https://www.arthurkoziel.com/setting-up-vim-for-yaml/
" Show a thin line for indents
Plug 'yggdroot/indentline'


" This is not needed with neovim and coc.nvim
" Python folding
" http://vimdoc.sourceforge.net/htmldoc/fold.html#zf
" zo: Open a fold at cursor
" zc: Close a fold at cussor
" za: toggle folding at cursor
" zO: Open all folds at cursor
" zC: Close all folds at curosr
" zA: Toggle all folds at curosr
"
" zr: reduce folds by one (that is open) in entire buffer
" zm: more folding (that is closed) in entire buffer
" zR: Reduce all folds (that is completely open) in entire buffer
" zM: Most folds (that is totally closed) in entire buffer
"
" zn: no folding
" zN: normal folding (turn it on)
" zi: invert folding
"
" [z: go to previous open fold
" ]z: next open fold
" zk: move up a fold
" zj: move down a fold
Plug 'kalekundert/vim-coiled-snake'
Plug 'konfekt/fastfold'
" :Black to run the python reformatter
" If you get a black not found, rm ~/.vim/black and do a BlackUpgrade
" there is no more stable branch
"Plug 'psf/black', {'branch': 'stable'}
Plug 'psf/black'

" za toggle fold, zR expand all folds, zo open fold,
" zM close all folds
Plug 'tmhedberg/simpylfold'

" yaml folds are special because you need to fold above the line
" do not run in neovim
"Plug 'pedrohdz/vim-yaml-folds'

call plug#end()

let g:deoplete#enable_at_startup = 1


syntax enable

" modelines are a security hole but worthwhile for css files that like 2 indents
" Tuned for python
" For indentLine
" this does not work because indentLine overwrites the conceal
" if you want to see what is actually happening then
" you don't expand in normal mode when scrolling but you do when insert
" this means that you have to be in insert mode to fix markdown
" If you want to edit markdown, the set conceallevel=0
set autoread
set background=dark
set concealcursor=nc
set conceallevel=2
set expandtab
set foldlevelstart=20
set incsearch
set modeline
set number relativenumber  " numbers are ugly  but needed for Python
set shiftwidth=4
set showmatch
set spell spelllang=en_us " Turn on spell check for text files
set tabstop=4
set textwidth=79

let g:indentLine_concealcursor = 'nc'

colorscheme NeoSolarized
" F5 will switch from dark to white
call togglebg#map('<F5>')
"
" https://github.com/overcache/NeoSolarized
" get a lighter char for looking at indent
let g:indentLine_char = '⦙'

" enable images preview with markdown  on Ctrl-P
let vim_markdown_preview_toggle=1
"set t_Co=256

" https://stackoverflow.com/questions/34428944/how-to-enable-gx-in-vim-mine-doesnt-work-anymore
" https://github.com/vim/vim/issues/4738
" https://stackoverflow.com/questions/9458294/open-url-under-cursor-in-vim-with-browser
" This is broken right now as of Jan 7 2021 waiting for a PR but it downloads
" the URL contents and then runs the default editor for gx
" gx - opens the link under the cursor (not the default gx opens a brownser)
" https://vim.fandom.com/wiki/Open_file_under_cursor
" gf - open the filename under the cursor in vim itself
" <c-w>f - open filename in a new window
" <c-w>gf opens in a new tab
let g:netrw_browser_viewer ='open'
let g:netrw_browsex_viewer ='open'
"
"so mypy likes the comments
let g:NERDDefaultAlign = 'left'

" Enable latest in markdown file
let g:vim_markdown_math = 1
let g:vim_markdown_strikethrough = 1
" Used by hugo
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_frontmatter = 1


" Setup file specific stuff
" https://vi.stackexchange.com/questions/6950/how-to-enable-spell-check-for-certain-file-types
augroup FILE
  autocmd BufRead COMMIT_EDITMSG setlocal spell spelllang=en_us
  autocmd FileType md,markdown,txt setlocal spell spelllang=en_us
  " https://www.arthurkoziel.com/setting-up-vim-for-yaml/
  autocmd FileType yaml setlocal tabstop=2 sts=2 shiftwidth=2 expandtab
  " something is etting this to yaml
  autocmd FileType sh setlocal tabstop=4 sts=2 shiftwidth=4 expandtab
augroup END

" Turn on NERDTree if there are no files open
let NERDTreeQuitOnOpen = 1
augroup NERD
  autocmd!
  autocmd StdinReadPre * let s:std_in=1
  " Open nerdtree if no file is opening
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree
augroup END

" https://duseev.com/articles/vim-python-pipenv/
" switch environments depending on pipenv
let pipenv_venv = system('pipenv --venv')
if v:shell_error == 0
   let venv_path = substitute(pipenv_venv, '\n', '', '')
   let g:python3_host_prog = venv_path . '/bin/python'
else
   let g:python3_host_prog = 'python'
endif

" let coc do this
"    \ 'python' : ['mypy', 'flake8', 'pydocstyle', 'pylint'],
let g:ale_linters = {
    \ 'javascript' : ['eslint', 'jshint'],
    \ 'yaml' : ['yamllint'],
    \ 'python' : [],
    \ 'sh' : ['shellcheck']
\ }
" actually change code with linter
let g:ale_fixers = {
    \ 'python': ['yapf'],
\}
" ALE status line
let g:airline#extensions#ale#enabled = 1

" https://github.com/neoclide/coc.nvim/issues/560
" coc-highlight - highlight sysmbol when there is no language server
" coc-vimtex - Latex completions
" coc-github-ussers - completion for github commits
" https://github.com/iamcco/coc-diagnostic
" coc-diagnostic - for linters not included by default like markdown
" set in coc-settings.json
let g:coc_global_extensions = [
    \ 'coc-markdownlint',
    \ 'coc-python',
    \ 'coc-flutter',
    \ 'coc-json',
    \ 'coc-yaml',
    \ 'coc-html',
    \ 'coc-vimtex',
    \ 'coc-github-users',
    \ 'coc-python',
    \ 'coc-diagnostic',
    \ 'coc-git']
" https://github.com/neoclide/coc.nvim/issues/353
"call coc#add_extension(coc_global_extensions)

" To use in a virtual environment need to create a .vim
" https://github.com/neoclide/coc-python/issues/20
" The default global configuration
" https://www.reddit.com/r/neovim/comments/ffnil1/help_configuri ng_cocnvim_extension_settings/
" Access with :CocConfig or the directory specific at :CocLocalConfig
" config.path('config') . 'coc-settings.json'

" Now the huge list of CoC commands from here on
" Note you need a coc-setting.json here
" And for python, need to set a .env with PYTHONPATH=.
" and then add the search for it
" https://github.com/neoclide/coc-python/issues/108
" https://vi.stackexchange.com/questions/25076/coc-python-reports-unresolved-import-in-git-subfolder
augroup COC
  autocmd FileType python let b:coc_root_patterns = ['.git', '.env', '.hg']
augroup END
" <tab> - move down the completion list, <shift-tab> to move up
" <cr> - confirm the completion, after you select it
" ctrl-<space> - list completions (also happens by default after 300ms)
" ]g  - Go to next lint error
" ]g  - Go to previous lint error
" gd  - Go to where variable is first defined
" gi  - Go to the implementation of a call
" gr - Go to all references of a variable
" To run the Microsoft Python Language Server
" in coc-setting.json { "python.jediEnabled" : false}
" Add these are are in a separate file
"execute 'source ' . stdpath('config') . '/coc.vim'

" light color for limelight
let g:limelight_conceal_ctermfg = 240
