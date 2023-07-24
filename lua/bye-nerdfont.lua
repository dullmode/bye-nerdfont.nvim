-- Create the module table
local M = {}

-- Load required modules
local emoji_icons = require("icons/emoji_icons")
local simple_icons = require("icons/simple_icons")
local nvim_web = require("nvim-web-devicons")

-- Default configuration
M.defaults = {
	mode = "emoji",
}
M.config = {
	mode = "emoji",
}

-- Setup function to configure the plugin
function M.setup(options)
	M.config = vim.tbl_deep_extend("force", M.defaults, options or {})

	local validModes = { emoji = true, simple = true }
	if not validModes[M.config.mode] then
		error("Invalid 'mode' option. Please choose 'emoji', 'alphabet' or 'kanji'.")
	end
end

function M.hello()
	print("hello")
end

function M.choose_icons()
	local icons

	if M.config.mode == "emoji" then
		icons = emoji_icons
	elseif M.config.mode == "simple" then
		icons = simple_icons
	end

	return icons
end

-- Function to get converted icons
function M.get_icons()
	if not nvim_web then
		print("nvim-web-devicons not found!")
		return
	end

	local icons = nvim_web.get_icons()

	local my_icons = M.choose_icons()

	for filename, e_icon in pairs(my_icons.nvim_web_icons) do
		if icons[filename] then
			icons[filename].icon = e_icon
		end
	end

	return icons
end

function M.get_default_icon()
	local my_icons = M.choose_icons()
	return my_icons.nvim_web_default_icon
end

function M.get_nvim_tree_icons()
	local my_icons = M.choose_icons()
	return my_icons.nvim_tree
end

function M.get_bufferline_icons()
	local my_icons = M.choose_icons()
	return my_icons.bufferline
end

function M.get_lualine_icons()
	local my_icons = M.choose_icons()
	return my_icons.lualine_icons
end

return M
