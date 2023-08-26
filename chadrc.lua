---@type ChadrcConfig
local M = {}
M.ui = {
	theme = "custom-rosepine",
	nvdash = {
		load_on_startup = true,
		buttons = {
			{ "󰈞  find file", "spc f f", "telescope find_files" },
			{ "󰈚  recent files", "spc f o", "telescope oldfiles" },
			{ "󰈭  find word", "spc f w", "telescope live_grep" },
			{ "  bookmarks", "spc m a", "telescope marks" },
			{ "  themes", "spc t h", "telescope themes" },
			{ "  mappings", "spc c h", "nvcheatsheet" },
		},
		header = {
			"           ▄ ▄                   ",
			"       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
			"       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
			"    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
			"  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
			"  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
			"▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
			"█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
			"    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
		},
	},
	lsp = {
		signature = {
			disabled = true,
		},
	},
	tabufline = {
		enabled = false,
	},
}
M.plugins = "custom.plugins"

M.mappings = require("custom.mappings")
return M
