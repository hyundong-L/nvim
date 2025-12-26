---@type LazySpec
return {
  {
    "m4xshen/hardtime.nvim",
    opts = {},
    config = function(_, opts)
      require("hardtime").setup(opts)

      local ok, ht = pcall(require, "hardtime")
      if not ok then return end

      vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = "*",
        callback = function()
          local m = vim.api.nvim_get_mode().mode
          -- visual(v, V, Ctrl-v) / select(s, S, Ctrl-s) 에서는 hardtime OFF
          if m:match "[vVsS]" then
            pcall(ht.disable)
          else
            pcall(ht.enable)
          end
        end,
      })
    end,
  },
}
