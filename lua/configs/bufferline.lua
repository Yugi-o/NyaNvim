local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

local close_func = function(bufnum)
	local bufdelete_avail, bufdelete = pcall(require, "bufdelete")
	if bufdelete_avail then
		bufdelete.bufdelete(bufnum, true)
	else
		vim.cmd.bdelete({ args = { bufnum }, bang = true })
	end
end

bufferline.setup({
	options = {
		close_command = close_func,
		right_mouse_command = close_func,
		hover = {
			enabled = true,
			delay = 0,
			reveal = { "close" },
		},
		custom_areas = {
			right = function()
				local result = {}
				local seve = vim.diagnostic.severity
				local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
				local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
				local info = #vim.diagnostic.get(0, { severity = seve.INFO })
				local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

				if error ~= 0 then
					table.insert(result, { text = "  " .. error, fg = "#EC5241" })
				end

				if warning ~= 0 then
					table.insert(result, { text = "  " .. warning, fg = "#EFB839" })
				end

				if hint ~= 0 then
					table.insert(result, { text = "  " .. hint, fg = "#7EA9A7" })
				end

				if info ~= 0 then
					table.insert(result, { text = "  " .. info, fg = "#A3BA5E" })
				end
				return result
			end,
		},
	},
})
