local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

treesitter.setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	autotag = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = false,
		max_file_lines = nil,
	},
	indent = {
		enable = true,
		disable = { "python", "css" },
	},
	contex_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
