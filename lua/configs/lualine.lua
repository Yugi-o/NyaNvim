local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local colors = {
	bg = "#08090E",
	fg = "#bbc2cf",
	yellow = "#ECBE7B",
	cyan = "#008080",
	green = "#98be65",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	blue = "#51afef",
	red = "#ec5f67",
	black = "#000000",
}

local config = {
	options = {
		component_separators = "",
		section_separators = "",
		theme = {
			normal = { c = { fg = colors.fg, bg = colors.bg } },
			inactive = { c = { fg = colors.fg, bg = colors.bg } },
		},
		disabled_filetypes = {
			statusline = { "DiffviewFiles", "alpha", "dashboard", "NvimTree", "Outline", "toggleterm" },
			winbar = {},
		},
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

ins_left({
	function()
		return "▊"
	end,
	color = { fg = colors.blue },
	padding = { left = 0, right = 1 },
})

ins_left({
	"mode",
	fmt = function(str)
		return str:lower():gsub("^%l", string.upper)
	end,
	-- color = { fg = "#000000", bg = colors.magenta, gui = "bold" },
	color = function()
		-- auto change color according to neovims mode
		local mode_color_bg = {
			n = colors.magenta,
			i = colors.red,
			v = colors.yellow,
			V = colors.yellow,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			ic = colors.yellow,
			R = colors.violet,
			Rv = colors.violet,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			["!"] = colors.red,
			t = colors.red,
		}
		local mode_color_fg = {
			n = colors.black,
			i = colors.black,
			v = colors.black,
			V = colors.black,
			c = colors.black,
			no = colors.black,
			s = colors.black,
			S = colors.black,
			ic = colors.black,
			R = colors.black,
			Rv = colors.black,
			cv = colors.black,
			ce = colors.black,
			r = colors.black,
			rm = colors.black,
			["r?"] = colors.black,
			["!"] = colors.black,
			t = colors.black,
		}
		return { fg = mode_color_fg[vim.fn.mode()], bg = mode_color_bg[vim.fn.mode()] }
	end,
})

ins_left({
	"branch",
	color = { fg = colors.violet, gui = "bold" },
})

ins_left({
	"diff",
	symbols = { added = " ", modified = " ", removed = " " },
	diff_color = {
		added = { fg = colors.yellow },
		modified = { fg = colors.green },
		removed = { fg = colors.red },
	},
	cond = conditions.hide_in_width,
})

ins_left({
	function()
		local msg = "No Lsp"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = "",
	color = { fg = colors.fg, gui = "bold" },
	cond = conditions.hide_in_width,
})

ins_left({
	function()
		return "%="
	end,
})

ins_left({
	function()
		return "NyaNvim"
	end,
	-- color = { fg = colors.magenta, gui = "bold" },
	color = function()
		local mode_color_fg = {
			n = colors.magenta,
			i = colors.red,
			v = colors.yellow,
			V = colors.yellow,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			ic = colors.yellow,
			R = colors.violet,
			Rv = colors.violet,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			["!"] = colors.red,
			t = colors.red,
		}
		return { fg = mode_color_fg[vim.fn.mode()] }
	end,
})

ins_right({
	"filetype",
	color = { fg = colors.fg, gui = "bold" },
	cond = conditions.hide_in_width,
})

ins_right({
	"filename",
	cond = conditions.buffer_not_empty,
	color = { fg = colors.fg, gui = "bold" },
})

ins_right({
	'os.date("%H:%M")',
	icon = "",
	color = { fg = colors.yellow, gui = "bold" },
	cond = conditions.hide_in_width,
})

ins_right({
	"progress",
	color = function()
		-- auto change color according to neovims mode
		local mode_color_bg = {
			n = colors.magenta,
			i = colors.red,
			v = colors.yellow,
			V = colors.yellow,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			ic = colors.yellow,
			R = colors.violet,
			Rv = colors.violet,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			["!"] = colors.red,
			t = colors.red,
		}
		local mode_color_fg = {
			n = colors.black,
			i = colors.black,
			v = colors.black,
			V = colors.black,
			c = colors.black,
			no = colors.black,
			s = colors.black,
			S = colors.black,
			ic = colors.black,
			R = colors.black,
			Rv = colors.black,
			cv = colors.black,
			ce = colors.black,
			r = colors.black,
			rm = colors.black,
			["r?"] = colors.black,
			["!"] = colors.black,
			t = colors.black,
		}
		return { fg = mode_color_fg[vim.fn.mode()], bg = mode_color_bg[vim.fn.mode()] }
	end,
})

ins_right({
	function()
		return "▊"
	end,
	color = { fg = colors.blue },
	padding = { left = 1 },
})

lualine.setup(config)
