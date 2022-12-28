local status_ok, neo_tree = pcall(require, "neo-tree")
if not status_ok then
	return
end

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

neo_tree.setup({
	close_if_last_window = true,
	hide_root_node = false,
	enable_diagnostics = false,
	event_handlers = {
		{
			event = "file_opened",
			handler = function(file_path)
				--auto close
				require("neo-tree").close_all()
			end,
		},
	},
	default_component_configs = {
		name = {
			use_git_status_colors = false,
		},
		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "",
			default = "",
		},
		git_status = {
			symbols = {
				-- Change type
				added = "", -- NOTE: you can set any of these to an empty string to not show them
				deleted = "",
				modified = "",
				renamed = "",
				-- Status type
				untracked = "★",
				ignored = "◌",
				unstaged = "✗",
				staged = "✓",
				conflict = "",
			},
			align = "right",
		},
	},
	window = {
		position = "float",
		width = 30,
		popup = {
			position = { col = "0%", row = "2" },
			size = function(state)
				local root_name = vim.fn.fnamemodify(state.path, ":~")
				local root_len = string.len(root_name) + 4
				return {
					width = math.max(root_len, 50),
					height = vim.o.lines - 6,
				}
			end,
		},
	},
	filesystem = {
		filtered_items = {
			visible = false,
			hide_dotfiles = true,
			hide_gitignored = false,
			hide_by_name = {
				".DS_Store",
				"thumbs.db",
				"node_modules",
				"__pycache__",
			},
		},
		follow_current_file = true,
		hijack_netrw_behavior = "open_current",
		use_libuv_file_watcher = true,
	},
})
