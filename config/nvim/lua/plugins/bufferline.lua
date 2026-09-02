return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    opts = {
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",

        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true,
          },
        },

        separator_style = "slant",
        show_buffer_close_icons = true,
        show_close_icon = true,
        always_show_bufferline = true,
      },
    },

    keys = {
      {
        "<Tab>",
        "<cmd>BufferLineCycleNext<CR>",
        desc = "Next tab",
      },
      {
        "<S-Tab>",
        "<cmd>BufferLineCyclePrev<CR>",
        desc = "Previous tab",
      },
      {
        "<leader>x",
        "<cmd>bdelete<CR>",
        desc = "Close tab",
      },
    },
  },
}
