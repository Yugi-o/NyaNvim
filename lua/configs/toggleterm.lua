local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 10,
	open_mapping = [[<F7>]],
	shadde_terminals = true,
	start_in_insert = true,
	direction = "float",
	float_opts = {
		border = "curved",
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

local Terminal = require("toggleterm.terminal").Terminal

local node = Terminal:new({
	cmd = "node",
	hidden = true,
	direction = true,
})

function _NODE_TOGGLE()
	node:toggle()
end

local python = Terminal:new({
	cmd = "python",
	hidden = true,
	direction = true,
})

function _PYTHON_TOGGLE()
	python:toggle()
end

local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	direction = "float",
})

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

local btm = Terminal:new({
	cmd = "btm",
	hidden = true,
	direction = "float",
})

function _BTM_TOGGLE()
	btm:toggle()
end
