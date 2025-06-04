local popup = require('plenary.popup')

local renamer_nvim = {}

---@type { [integer]: fun() }
renamer_nvim._callbacks = {}

---@class Config
---@field keymap ConfigKeymap

---@class ConfigKeymap
---@field rename string

function get_or_default(table, name, value)
    if table[name] then
        return table[name]
    else
        return value
    end
end

---@param opts Config
function renamer_nvim.setup(opts)
    local rename_keymap = get_or_default(opts.keymap, 'rename', '<leader>gv')

    vim.api.nvim_set_keymap('n', rename_keymap, '<cmd>lua require("renamer_nvim").create_window()<CR>',
        { noremap = true })
end

function renamer_nvim.create_window()
    local cword = vim.fn.expand('<cword>')
    local height = 1
    local width = 30
    local borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' }

    popup.create(cword, {
        title = 'Rename',
        highlight = 'RenameWindow',
        line = math.floor(((vim.o.lines - height) / 2) - 1),
        col = math.floor((vim.o.columns - width) / 2),
        minwidth = width,
        minheight = height,
        borderchars = borderchars,
        callback = renamer_nvim._confirm,
        finalize_callback = function(win_id, bufnr)
            vim.cmd('startinsert')
            vim.cmd('normal $')

            renamer_nvim._callbacks[bufnr] = function()
                vim.api.nvim_win_close(win_id, true)
            end

            vim.api.nvim_buf_set_keymap(bufnr, 'i', '<CR>',
                '<cmd>lua require("plenary.popup").execute_callback(' .. bufnr .. ')<CR>', { noremap = true })
            vim.api.nvim_buf_set_keymap(bufnr, 'i', '<Esc>',
                '<cmd>lua require("renamer_nvim").cancel_rename(' .. bufnr .. ')<CR>', { noremap = true })
        end

    })
end

function renamer_nvim.cancel_rename(bufnr)
    local wrapper = renamer_nvim._callbacks[bufnr]
    if wrapper then
        wrapper()
    end
end

---@param win_id integer
---@param _ string
function renamer_nvim._confirm(win_id, _)
    local bufnr = vim.api.nvim_win_get_buf(win_id)

    local values = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)
    local value = values[1]

    vim.defer_fn(function()
        vim.lsp.buf.rename(value)
        vim.cmd('stopinsert')
    end, 0)
end

return renamer_nvim
