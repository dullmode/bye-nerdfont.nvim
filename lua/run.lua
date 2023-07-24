package.loaded["icons"] = nil
package.loaded["icons/emoji_icons"] = nil
package.loaded["icons/simple_icons"] = nil
package.loaded["bye-nerdfont"] = nil

local bye = require("bye-nerdfont")

bye.setup({
	mode = "simple",
})
bye.get_icons()
bye.get_default_icon()
bye.get_nvim_tree_icons()
bye.get_bufferline_icons()
bye.get_lualine_icons()
