local servers = {
    'lua_ls',
    'pyright',
    'ts_ls',
    'html',
    'cssls',
    'jsonls',
    'bashls',
    'dockerls',
    'gopls',
    'rust_analyzer',
    'jdtls',
}

for _, server in ipairs(servers) do
    local config = {
        on_attach = function(client, bufnr)
            local opts = { buffer = bufnr }
            vim.keymap.set('n', 'ge', vim.diagnostic.open_float, opts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        end,
        flags = {
            debounce_text_changes = 150,
        },
    }

	 if server == 'jdtls' then
        -- Un workspace de jdtls para cada directorio abierto con java:
        local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
        local workspace_dir = vim.fn.stdpath("data") .. "/jdtls/workspaces/" .. project_name
        config.cmd = { "jdtls", "-data", workspace_dir }
    end

    vim.lsp.config(server, config)
end

vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true,
    float = { border = 'rounded', source = true },
})

