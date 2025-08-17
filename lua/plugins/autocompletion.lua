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
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local lspconfig = require('lspconfig')
        local elixirls = require('utility.elixirls').setup()

        local languages = {
            ['clangd'] = {},
            ['ts_ls'] = {},
            ['bashls'] = {},
            ['csharp_ls'] = {},
            ['rust_analyzer'] = {
                diagnostic = true,
                inlay_hints = {
                    enabled = true,
                }
            },
            ['lua_ls'] = {},
            ['elixirls'] = {
                cmd = { elixirls }
            },
            ['cmake'] = {},
            ['qmlls'] = {
                cmd = { 'qmlls6' }
            },
            ['docker_language_server'] = {},
        }

        vim.lsp.inlay_hint.enable(true)
        for lang, config in pairs(languages) do
            config['capabilities'] = capabilities
            lspconfig[lang].setup(config)
        end
    end
}
