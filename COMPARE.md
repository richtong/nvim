# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Decomposing the LazyVim
In [LazyVim](https://www.lazyvim.org/configuration/examples):

- [Gruvbox](ellisonleao/gruvbox.nvim) - Theme
- [Trouble](https://github.com/folke/trouble.nvim) - pretty list for all the trouble in your code
- [Nvim-lualine](https://github.com/nvim-lualine/lualine.nvim) - Like airline, this is for status

These feel like the major components
- [Nvim-telescope](https://github.com/nvim-telescope/telescope.nvim) - A fuzzy finder like fzf and has modular components and can use fzf underneath. \fp finds telescope plugins
- [Nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - much smarter highlighting as it understands the abstract symbol tree for code and so coloring works well.


- [Mason](https://github.com/williamboman/mason.nvim) - Manager for LSP, DAP (Debug Adapter Protocol), linters, formatters, it needs plugins to add LSPs, DSPs, Linters and Formatters. so it need Nvim-lspconfig, nvim-dap. In the old days CoC grew into this by adding an LSP plugin system since code completion, linting and formatting are highly related.
- [Nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - configuration helper for the native Language Server Protocol. It adds some standard keystrokes like \-] to goto definition and C-X, C-O to do manual completion. YOu need an autocompletion plugin to do this automatically. [d and ]d is go to previous and next. Use `:LspInfo` to control it. With opts.servers, you can add things like pyright or typescript etc. LSPs provide syntax, they provide linting and other things.
- [nvim-dap](https://github.com/mfussenegger/nvim-dap) - Set breakpoints with [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) - Adds pretty UI

Note sure why this is needed above what mason adds
- [Nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Code completion manager can use LSPs, needs a snippet engine like vsnip, luasnip, ultisnips or snippy and use [cmp-emoji](https://github.com/hrsh7th/cmp-emoji) to add Emoji completions. Source downstream components. This is like CoC in the vim days.

Here are some optional things that are not in LazyVim
- [nvim-lint](https://github.com/mfussenegger/nvim-lint) to add dedicated linters if the ones in LSPs aren't good enough. This is alot like ALE in the old vim days.
- [formatter.nvim](https://github.com/mhartington/formatter.nvim) - not sure whey this is needed with both treesitter and nvim-lspconfig 

## Things that are still missing

- [Codeium](https://github.com/Exafunction/codeium.vim) or other ai thingies which act like big code adders so can conflict with mason tools.
- [Avante](https://github.com/yetone/avante.nvim) - attempts to emulate VS Code cursor

## Comparison with .vimrc as of August 2024

There are two different installations in the `.vimrc`:

Things to merge in:

- I truly hate the space as the LEADER key, so change back to the Backslash
- [vim-colors-solarized](altercation/vim-colors-solarized). Gruvbox is kind of ugly
- [machakann/vim-sandwich](https://github.com/machakann/vim-sandwicht). I use this an incredible about like saW to add quotes around a word
- iamcco/markddown-preview.nvim. I do a lot of markdown and this is useful
- airblade/vim-gitgutter - this is actually very useful
- pdrohdz/vim-yaml-folds - use za and zR to open and close vim-yaml-folds
- ygddroot/indentline - shows small vertical for tabs, great for python and yaml

Things I'm not sure about:

- preservim/nerdcommenter - Note says this is for mypy. Note sure
- preservim/nerdtree - the tree view at the starter
- preservim/nerdtree-git-plugin

The duplicates that I don't need:

- [Vim-airline](https://github.com/vim-airline). I as using powerline, but this broke, so returned

Things that are rarely used and I can drop:

- [preservim/vim-solarized8](https://preservim/vim-solarized8). 24-bit true color got graphical interface versions of vim
- tpope/vim-git-plugin - Let's you do :G commit, but I don't use much
- madox2/vim-ai - :AI gives you chatgpt, use ai plugin instead

### neovim

This is the later installation that uses CoC for the LSP

- exafunction/codeium.vim. Should use this more C-[ and M=] for next suggestion


Thing I don't need which is COC since we are using the native LSP:

- neoclide/coc.nvim
- neclide/coc-ruff


### vim

This uses syntastsic since vim is single threaded and does not allow async. I haven't used this in a while

- vim-syntastic/syntastic
