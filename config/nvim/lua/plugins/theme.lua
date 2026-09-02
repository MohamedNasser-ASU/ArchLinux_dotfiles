return {
  {
    "cocopon/iceberg.vim",
    lazy = false,
    priority = 1000,

    config = function()
      vim.opt.background = "dark"
      vim.cmd.colorscheme("iceberg")

      -- Iceberg-style autocomplete colors
      local popup = "#1e2132"
      local selected = "#3e445e"
      local foreground = "#c6c8d1"
      local border = "#6b7089"

      -- Completion menu
      vim.api.nvim_set_hl(0, "BlinkCmpMenu", {
        bg = popup,
        fg = foreground,
      })

      -- Currently selected completion
      vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", {
        bg = selected,
        fg = foreground,
        bold = true,
      })

      -- Completion-menu border
      vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", {
        bg = popup,
        fg = border,
      })

      -- Documentation popup
      vim.api.nvim_set_hl(0, "BlinkCmpDoc", {
        bg = popup,
        fg = foreground,
      })

      vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", {
        bg = popup,
        fg = border,
      })

      -- Signature-help popup
      vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelp", {
        bg = popup,
        fg = foreground,
      })

      vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", {
        bg = popup,
        fg = border,
      })
    end,
  },
}
