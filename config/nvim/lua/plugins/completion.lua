return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    lazy = false,

    dependencies = {
      "rafamadriz/friendly-snippets",
    },

    opts = {
      keymap = {
        preset = "super-tab",
      },

      completion = {
        menu = {
          auto_show = true,
        },

        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
        },
      },

      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
        },
      },

      signature = {
        enabled = true,
      },

      -- Reliable and requires no Rust binary.
      fuzzy = {
        implementation = "lua",
      },
    },

    opts_extend = {
      "sources.default",
    },
  },
}
