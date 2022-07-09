require("nvim-treesitter.configs").setup({
	context_commentstring = {
		enable = true,
	},
	ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	-- ignore_install = {}, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "html" }, -- FIX: disabled for now https://github.com/nvim-treesitter/nvim-treesitter/issues/1788
	},
	autotag = { enable = true },
	indent = {
		enable = true,
	},
  -- provided by the nvim-treesitter/nvim-treesitter-refactor
  refactor = {
    highlight_definitions = {
      enable = true,
      clear_on_cursor_move = true,
    },
    highlight_current_scope = { enable = true },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        goto_definition_lsp_fallback = "gld",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      },
    },
  },
})

-- FIX: for nvim-autotag - not actually working
local ts_utils = require("nvim-treesitter.ts_utils")
ts_utils.get_node_text = vim.treesitter.query.get_node_text

-- Detect astro files and set filetype
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.astro" },
	callback = function()
		vim.cmd([[ set filetype=astro ]])
	end,
})

