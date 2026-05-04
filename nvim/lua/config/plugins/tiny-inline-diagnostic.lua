return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "ghost",
        options = {
          show_source = { enabled = true, },

          -- multilines = { enabled = true, },
          -- add_messages = { display_count = true, },
          show_related = {
            enabled = true,
            max_count = 5,
          },
          enable_on_insert = true,
          override_open_float = true,
        },
      })

      vim.diagnostic.config({ virtual_text = false })
    end,
  }
}
