return {
    dir = vim.fn.stdpath('config') .. '/lua/renamer_nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        keymap = {
            rename = '<leader>gv'
        }
    }
}
