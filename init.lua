-- https://neovim.substack.com/p/switching-from-vimscript-to-lua
-- https://finnala.dev/blog/a-beginners-guide-to-neovim-configuration
-- if you have init.vim you are using vimscript
-- this is init.lua note that you cannot have both
-- init.vimrc.vim is the legacy script which works for both
-- vim using syntastic since it is single threaded
-- nvim using coc for the language processing
-- lvim uses the lunarvim built in system with LSP etc.
-- https://www.lunarvim.org/docs/beginners-guide/keybinds-overview
-- move to init.lua moves us to the built in language processor

-- https://lazy.folke.io/installation
-- https://neovim.io/doc/user/lua-guide.html
-- put return code into ./lua/plugins
-- https://www.lazyvim.org/configuration/plugins
require("config.lazy")

-- the legacy system is the init.vimrc.vim
-- needs the path and this is not portable but works for now
-- vim.cmd.source("~/.config/nvim/init.vimrc.vim")
