local status_ok, barbecue = pcall(require, "barbecue")
if not status_ok then
	return
end

barbecue.setup({
	symbols = {
		separator = "",
	},
	kinds = {
		Module = "",
		Namespace = "",
		Package = "",
		Class = "",
		Method = "",
		Property = "",
		Field = "",
		Constructor = " ",
		Enum = "練",
		Interface = "練",
		Function = "",
		Variable = "",
		Constant = "",
		String = "",
		Number = "",
		Boolean = "◩",
		Array = "",
		Object = "",
		Key = "",
		Null = "ﳠ",
		EnumMember = "",
		Struct = "",
		Event = "",
		Operator = "",
		TypeParameter = "",
		Macro = "",
	},
	exclude_filetypes = {
		"toggleterm",
		"help",
		"startify",
		"dashboard",
		"packer",
		"neogitstatus",
		"NvimTree",
		"Trouble",
		"alpha",
		"lir",
		"Outline",
		"spectre_panel",
		"qf",
		"neo-tree",
	},
})
