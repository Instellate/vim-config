return {
    'folke/trouble.nvim',
    opts = true,
    cmd = 'Trouble',
    keys = {
        {
            '<leader>xx',
            '<cmd>Trouble diagnostics toggle<cr>',
            desc = 'Diagnostics tree (Trouble)',
        },
    }
}
