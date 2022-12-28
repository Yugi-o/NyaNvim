local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
	impatient.enable_profile()
end

require("core.options")
require("core.keybindings")
require("core.plugins")
require("core.autocommands")
require("configs.lsp")
