return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,

    config = function()
      -- Enable C and C++ language support
      vim.lsp.enable("clangd")

      -- LSP shortcuts
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local options = {
            buffer = event.buf,
          }

          vim.keymap.set("n", "K", vim.lsp.buf.hover, options)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, options)
          vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, options)
        end,
      })
    end,
  },
}
