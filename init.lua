vim.g.mapleader = '<Space>'
require('config.lazy')

-- Indentions
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

-- Auto indent detections
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true

-- Others
vim.opt.number = true
vim.opt.clipboard = 'unnamedplus'
vim.g.clipboard = 'wl-copy'

-- Keymap
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-Up>', ':m .-2<CR>==', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-Down>', ':m .+1<CR>==', { noremap = true })

-- LSP Keymaps
vim.api.nvim_set_keymap('n', 'grf', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true })

vim.defer_fn(function()
    vim.api.nvim_set_keymap('i', '<C-h>', '<C-w>', { noremap = true })
end, 1000)

vim.cmd('colorscheme zephyr')
vim.cmd('tnoremap <Esc> <C-\\><C-n>')

-- User commands 
vim.api.nvim_create_user_command('OpenTerm', function()
    vim.cmd('rightbelow split')
    vim.cmd('resize 15')
    vim.cmd('terminal')
end, {})

vim.api.nvim_create_user_command('DiffOrig',
    'vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis | wincmd p | diffthis', {})

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
