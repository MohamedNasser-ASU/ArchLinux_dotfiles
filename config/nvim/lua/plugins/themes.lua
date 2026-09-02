vim.opt.background = "dark"

return {
  -- ============================================================
  -- Themes
  -- ============================================================

  {
    "cocopon/iceberg.vim",
    lazy = false,
    priority = 1000,
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
  },

  -- Mostly monochrome
  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
  },

  -- Includes the grayscale Zenwritten theme
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = {
      "rktjmp/lush.nvim",
    },
    lazy = false,
    priority = 1000,
  },

  -- Includes Carbonfox
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
  },

  -- VS Code Dark
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,

    opts = {
      transparent = false,
      italic_comments = true,
    },
  },

  -- Neutral near-black background
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,

    opts = {
      transparent = false,
    },
  },

  -- IBM Carbon-inspired theme
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = false,
    priority = 1000,
  },

  -- ============================================================
  -- Theme selection menu
  -- ============================================================

  {
    "zaldih/themery.nvim",
    lazy = false,

    opts = {
      themes = {
        -- Iceberg
        "iceberg",

        -- Tokyo Night dark variants
        "tokyonight",
        "tokyonight-night",
        "tokyonight-moon",
        "tokyonight-storm",

        -- Kanagawa dark variants
        "kanagawa",
        "kanagawa-wave",
        "kanagawa-dragon",

        -- Catppuccin dark variants
        "catppuccin",
        "catppuccin-frappe",
        "catppuccin-macchiato",
        "catppuccin-mocha",

        -- Neutral and monochrome themes
        "lackluster",
        "lackluster-hack",
        "lackluster-mint",
        "zenwritten",
        "carbonfox",
        "vscode",
        "cyberdream",
        "oxocarbon",
      },

      livePreview = true,
    },

    keys = {
      {
        "<leader>t",
        "<cmd>Themery<CR>",
        desc = "Choose theme",
      },
    },
  },
}
