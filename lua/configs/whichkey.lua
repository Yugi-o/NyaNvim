local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

which_key.setup({
	plugins = {
		spelling = {
			enabled = true,
		},
		presets = {
			operators = false,
		},
	},
	window = {
		border = "rounded",
		margin = { 1, 0, 1, 0 },
		padding = { 2, 2, 2, 2 },
	},
	disable = {
		filetypes = {
			"TelescopePrompt",
		},
	},
})

which_key.register({
	["a"] = { "<cmd>Alpha<cr>", "Alpha" },
	["q"] = { "<cmd>q<cr>", "Quit" },
	["e"] = { "<cmd>Neotree toggle<cr>", "Explorer" },
	["c"] = { "<cmd>Bdelete<cr>", "Close buffer" },
	["f"] = { "<cmd>Telescope find_files<cr>", "Find files" },
	["F"] = { "<cmd>Telescope live_grep<cr>", "Find text" },
	["w"] = { "<cmd>set wrap!<cr>", "Wrap" },
	["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
	s = {
		name = "Search",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
	},
	m = {
		name = "Session",
		s = { "<cmd>SessionManager save_current_session<cr>", "Save session" },
		d = { "<cmd>SessionManager delete_session<cr>", "Delete session" },
		l = { "<cmd>SessionManager load_session<cr>", "Load session" },
		L = { "<cmd>SessionManager load_last_session<cr>", "Load last session" },
	},
	g = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Lazygit" },
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
	},
	t = {
		name = "Terminal",
		b = { "<cmd>lua _BTM_TOGGLE()<cr>", "btm" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=60 direction=vertical<cr>", "Vertical" },
		p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
		n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
	},
	p = {
		name = "Packer",
		c = { "<cmd>PackerClean<cr>", "Clean" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
		o = { "<cmd>PackerCompile<cr>", "Compile" },
	},
	l = {
		name = "Lsp",
		c = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
		w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
		f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
		j = { "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", "Next Diagnostic" },
		k = { "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "Prev Diagnostic" },
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		m = { "<cmd>Mason<cr>", "Mason" },
	},
	E = {
		name = "Extra",
		m = { "<cmd>MarkdownPreviewToggle<cr>", "Markdown Preview" },
	},
}, {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true,
})
