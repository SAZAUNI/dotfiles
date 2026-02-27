vim.api.nvim_create_user_command(
  'FocusToggle',
  function()
    local dim = require("snacks").dim
    if dim.enabled then
      dim.disable()
    else
      dim.enable()
    end
  end,
  {}
)

-- Cambia el cwd solo al abrir Neovim
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local path = vim.fn.argv(0)  -- primer argumento pasado a nvim
        if path == "" then
            path = vim.loop.cwd()    -- fallback si no se pasó ruta
        end

        if vim.fn.isdirectory(path) == 1 then
            vim.cmd("cd " .. path)   -- cambiar cwd al directorio
        else
            vim.cmd("cd " .. vim.fn.fnamemodify(path, ":h")) -- si es archivo, usa su carpeta
        end
    end
})
