local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	[[                                                           ]],
	[[--------------------------                                 ]],
	[[███    ██ ██    ██  █████               She                ]],
	[[████   ██  ██  ██  ██   ██              Dont't             ]],
	[[██ ██  ██   ████   ███████              Give               ]],
	[[██  ██ ██    ██    ██   ██              a                  ]],
	[[██   ████    ██    ██   ██              FO                 ]],
	[[-----------------------------------------------------------]],
	--[[                           --------------------------------]]
	--,
	[[           Como            ███    ██ ██    ██ ██ ███    ███]],
	[[           dice            ████   ██ ██    ██ ██ ████  ████]],
	[[           el              ██ ██  ██ ██    ██ ██ ██ ████ ██]],
	[[           duko            ██  ██ ██  ██  ██  ██ ██  ██  ██]],
	[[           OwO             ██   ████   ████   ██ ██      ██]],
	[[                           --------------------------------]],
}
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files<cr>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert<cr>"),
	dashboard.button("l", "  Last Session", ":SessionManager load_last_session<cr>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles<cr>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep<cr>"),
	dashboard.button("c", "  Configuration", ":e $HOME/appdata/local/nvim/init.lua<cr>"),
	dashboard.button("q", "  Quit Neovim", ":qa<cr>"),
}

local function footer()
	local plugins_count = vim.fn.len(vim.fn.globpath("$HOME/appdata/local/nvim-data/site/pack/packer/start", "*", 0, 1))
	return "NyaNvim Loaded " .. plugins_count .. " plugins"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
