# Neovim configuration files
This is a directory that contains a bunch of configuration files for my neovim setup.
This configuration is currently configured and tested for linux wayland.  

If you want to use this configuration yourself, you might need to change some of the configuration.  
If you are on linux wayland. You will need to install `wl-clipboard` (some distributions calls it `wl-paste`).
If you are not on wayland or linux. Change the clipboard manager (`vim.g.clipboard`) specified at `init.lua` to a clipboard manager supported by your platform or disable `unnamedplus`.  
Neovim specifies supported clipboard managers at `:help clipboard`.

This also contains a plugin I made by myself for a window that provides renaming in a way I like.

## 3rd party plugins used
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp): Autocompletion support
- [Autopairs](https://github.com/windwp/nvim-autopairs): Automatic pair completion
- [Comment](https.//github.com/numToStr/Comment.nvim): Keymaps to comment selected lines
- [Inline Diagnostics](https://github.com/rachartier/tiny-inline-diagnostic.nvim): Better inline diagnostic messages
- [File explorer](https://github.com/nvim-neo-tree/neo-tree.nvim): A nice file explorer if I ever need to access to a file quickly
- [Git](https://github.com/NeogitOrg/neogit): A VSC for git
- [Symbol previews](https://github.com/rmagatti/goto-preview): Provides previews for declarations, references and etc.
- [Markdown previews](https://github.com/OXY2DEV/markview.nvim): Provides previews for markdowns and other languages.
- [Wakatime](https://github.com/wakatime/vim-wakatime): Provides wakatime statistics
- [Zephyr](https://github.com/glepnir/zephyr-nvim): A colorscheme
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

