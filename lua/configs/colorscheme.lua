require("material").setup({

	contrast = {
		terminal = true, -- Enable contrast for the built-in terminal
		sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
		floating_windows = true, -- Enable contrast for floating windows
		cursor_line = false, -- Enable darker background for the cursor line
		non_current_windows = false, -- Enable darker background for non-current windows
		filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
	},

	styles = { -- Give comments style such as bold, italic, underline etc.
		comments = { --[[ italic = true ]]
		},
		strings = { --[[ bold = true ]]
		},
		keywords = { --[[ underline = true ]]
		},
		functions = { --[[ bold = true, undercurl = true ]]
		},
		variables = {},
		operators = {},
		types = {},
	},

	plugins = { -- Uncomment the plugins that you use to highlight them
		-- Available plugins:
		-- "dap",
		-- "dashboard",
		"gitsigns",
		-- "hop",
		-- "indent-blankline",
		-- "lspsaga",
		-- "mini",
		-- "neogit",
		"nvim-cmp",
		-- -- "nvim-navic",
		"nvim-tree",
		"nvim-web-devicons",
		-- "sneak",
		"telescope",
		-- "trouble",
		"which-key",
	},

	disable = {
		colored_cursor = false, -- Disable the colored cursor
		borders = false, -- Disable borders between verticaly split windows
		background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
		term_colors = false, -- Prevent the theme from setting terminal colors
		eob_lines = false, -- Hide the end-of-buffer lines
	},

	high_visibility = {
		lighter = false, -- Enable higher contrast text for lighter style
		darker = false, -- Enable higher contrast text for darker style
	},

	async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

	custom_highlights = {
		NeoTreeNormal = { bg = "#08090E" },
		NeoTreeNormalNC = { bg = "#08090E" },
		NeoTreeTitleBar = { bg = "#08090E" },
		TelescopeNormal = { bg = "#08090E" },
		TelescopePromptNormal = { bg = "#08090E" },
		TelescopePromptBorder = { fg = "#08090E", bg = "#08090E" },
		TelescopePromptTitle = { fg = "#08090E", bg = "#08090E" },
		TelescopePreviewBorder = { fg = "#08090E", bg = "#08090E" },
		TelescopeResultsBorder = { fg = "#08090E", bg = "#08090E" },
		TelescopeResultsTitle = { fg = "#08090E", bg = "#08090E" },
		TelescopePreviewTitle = { fg = "#08090E", bg = "#08090E" },
	}, -- Overwrite highlights with your own
})
vim.g.material_style = "deep ocean"

vim.cmd("colorscheme material")
