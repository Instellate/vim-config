return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons'  },
    event = 'VeryLazy',
    opts = function()
        return {
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename', 'lsp_status' },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progresss' },
                lualine_z = { 'location' }
            },
        }
    end,
}
