return {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'VeryLazy', -- Or `LspAttach`
    priority = 1000,    -- needs to be loaded in first
    config = function()
        require('tiny-inline-diagnostic').setup({
            preset = 'simple',
            transparent_bg = true,
            options = {
                throttle = 0,
                enable_on_insert = true,
                enable_on_select = true,
            }
        })

        vim.diagnostic.config({
            virtual_text = false,
            update_in_insert = true,
        })
    end
}
