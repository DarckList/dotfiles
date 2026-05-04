return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require"nvim-treesitter.configs".setup {
	-- after added new language run nvim from Developer Command Prompt for Visual Studio ... 
	ensure_installed = {"c", "c_sharp", "json", "typescript", "razor", "lua", "vim", "vimdoc", "query", "markdown", "html" },
	sync_install = false,
	auto_install = true,
	highlight = {
	  enable = true,

	  disable = function(ling, buf)
	    local max_filesize = 100 * 1024 -- 100 KB
	    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
	    if ok and stats and stats.size > max_filesize then
	      return true
	    end
	  end,
	  additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
	  enable = true,
	  keymaps = {
	    init_selection = "<leader>si", -- set to `false` to disable one of the mappings
	    node_incremental = "<leader>si",
	    scope_incremental = "<leader>sc",
	    node_decremental = "<leader>sd",
	  },
	},
      }
    end,
  }
}
