local download_url_format = 'https://github.com/elixir-lsp/elixir-ls/releases/download/%s/elixir-ls-%s.zip'
local version = 'v0.28.0'

local elixirls = {}

function elixirls.get_start_path()
    if vim.fn.has('win32') == 1 then
        return vim.fn.stdpath('data') .. '/elixirls/language_server.bat'
    else
        return vim.fn.stdpath('data') .. '/elixirls/language_server.sh'
    end
end

function elixirls.setup()
    local elixirls_path = vim.fn.stdpath('data') .. '/elixirls'
    local start_path = elixirls.get_start_path()

    if vim.fn.filereadable(start_path) == 1 then
        return start_path
    end

    local download_url = string.format(download_url_format, version, version)
    local download_path = vim.fn.stdpath('cache') .. '/elixirls.zip'

    if vim.fn.has('win32') == 1 then
        vim.system({ 'curl.exe', '-Lo', download_path, download_url })
        vim.system({ 'Expand-Archive', '-LiteralPath', download_path, elixirls_path })
        vim.system({ 'Remove-Item', '-Confirm', download_path })
    else
        vim.system({ 'curl', '-Lo', download_path, download_url })
        vim.system({ 'unzip', download_path, '-d', elixirls_path })
        vim.system({ 'rm', '-rf', download_path })
    end

    return start_path
end

return elixirls
