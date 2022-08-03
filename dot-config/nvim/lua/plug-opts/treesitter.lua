require("nvim-treesitter.configs").setup({
	context_commentstring = {
		enable = true,
	},
	ensure_installed = {"lua", "tsx", "astro", "vim", "markdown", "json", "javascript" }, -- , "go", "elixir", "eex", "heex", "prisma", "r", "vue", "sql"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  auto_install = true,
  sync_install = false,

	-- ignore_install = {}, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "html" }, -- FIX: disabled for now https://github.com/nvim-treesitter/nvim-treesitter/issues/1788
	},
	autotag = { enable = true },
	indent = {
		enable = true,
	},
  -- provided by the p00f/nvim-ts-rainbow plugin
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = {
      "#FFFFFF",
      "#eb9e6c",
      "#b5f797",
      "#fa5cf5",
      "#96f1f2",
      "#faf86e",
      "#f283b6",
    }
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  -- provided by the nvim-treesitter/nvim-treesitter-refactor plugin
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

