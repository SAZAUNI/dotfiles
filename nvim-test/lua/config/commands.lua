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
