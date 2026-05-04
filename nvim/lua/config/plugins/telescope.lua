return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.0",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "cmake" }
    },
    config = function()
      require("telescope").setup {
        pickers = {
          find_files = {
            theme = "ivy",
          }
        },
        extensions = { fzf = {} }
      }

      local ok, err = pcall(require("telescope").load_extension, "fzf")
      if not ok then
        vim.notify("Telescope FZF extension failed to load! Did you run make?", vim.log.levels.WARN)
      end

      vim.keymap.set("n", "<space>fd", function() require("telescope.builtin").find_files() end)
      vim.keymap.set("n", "<space>fh", function()
        require("telescope.builtin")
            .help_tags(require("telescope.themes").get_ivy())
      end)
      vim.keymap.set("n", "<space>en", function()
        local opts = require("telescope.themes").get_ivy({
          cwd = vim.fn.stdpath("config")
        })
        require("telescope.builtin").find_files(opts)
      end)
      vim.keymap.set("n", "<space>fb", function()
        require("telescope.builtin")
            .current_buffer_fuzzy_find(require("telescope.themes").get_ivy())
      end)
    end
  }
}
