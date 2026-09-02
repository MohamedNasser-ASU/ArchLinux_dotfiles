return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",

    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },

    keys = {
      {
        "<leader>e",
        "<cmd>Neotree toggle reveal<CR>",
        desc = "Toggle file explorer",
      },
    },

    opts = {
      close_if_last_window = true,
      popup_border_style = "rounded",

      filesystem = {
        follow_current_file = {
          enabled = true,
        },

        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
      },

      window = {
        width = 32,
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",

    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },

    keys = {
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files({
            hidden = true,
          })
        end,
        desc = "Find files",
      },

      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Find text",
      },

      {
        "<leader>fb",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Find buffers",
      },

      {
        "<leader>fr",
        function()
          require("telescope.builtin").oldfiles()
        end,
        desc = "Recent files",
      },

      {
        "<leader>fh",
        function()
          require("telescope.builtin").help_tags()
        end,
        desc = "Search help",
      },
    },

    opts = {
      defaults = {
        prompt_prefix = "   ",
        selection_caret = "➜ ",
        sorting_strategy = "ascending",

        layout_config = {
          prompt_position = "top",
        },
      },
    },
  },
}
