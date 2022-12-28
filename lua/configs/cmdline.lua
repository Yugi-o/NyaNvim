local status_ok, cmdline = pcall(require, "fine-cmdline")
if not status_ok then
	return
end

cmdline.setup({
	cmdline = {
		prompt = ":",
	},
	popup = {
		position = {
			row = "0%",
			col = "50%",
		},
		size = {
			width = "35%",
		},
		border = {
			style = "rounded",
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
		},
	},
})

vim.api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })
