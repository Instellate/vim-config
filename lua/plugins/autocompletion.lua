return {
    'hrsh7th/nvim-cmp',
    version = false,
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
    },
    opts = function()
        local cmp = require('cmp')

        return {
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.close(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                -- ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'}),
                -- ['<S-Tab'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'}),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['C-d'] = cmp.mapping.scroll_docs(-4)
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' }
            }, {
                { name = 'buffer' }
            }, {
                { name = 'lazydev', group_index = 0 }
            })
        }
    end,
    init = function()
        require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        vim.lsp.config('*', {
            capabilities = capabilities
        })
        vim.lsp.inlay_hint.enable(true)

        -- local languages = {
        --     ['rust_analyzer'] = {
        --         diagnostic = true,
        --         inlay_hints = {
        --             enabled = true,
        --         }
        --     },
        -- }
        --
        -- for lang, config in pairs(languages) do
        --     vim.lsp.config(lang, config)
        --     vim.lsp.enable(lang)
        -- end
    end
}
