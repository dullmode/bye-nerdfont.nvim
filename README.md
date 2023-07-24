# devicons without nerdfont

the plugin for the people who cannot use nerdfont 🤓
![Screenshot](https://i.imgur.com/KEbGvd1.png)

## :sparkles: support

- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)

## :lock: Requirements

- [Neovim 0.7+](https://github.com/neovim/neovim/releases)
- [Nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)

## :package: Installation

### packer.nvim

```lua
use("dullmode/bye-nerdfont.nvim")
```

## :rocket: Usage

### setup

you can choose mode from `emoji` and `simple`

```lua
require("bye-nerdfont").setup({
	mode = "emoji",
})
```

### nvim-web-devicons

overwrite nvim-web-devicons

```lua
local icons = require("bye-nerdfont").get_icons()
local default_icon = require("bye-nerdfont").get_default_icon()
-- overwrite nerdfont
require("nvim-web-devicons").set_icon({
	icons
})
require("nvim-web-devicons").set_default_icon(
	default_icon
)
```

### nvim-tree.lua

overwrite nvim-tree.lua icons

```lua
local nvim_tree_icons = require("bye-nerdfont").get_nvim_tree_icons()

require("nvim-tree").setup({
	on_attach = my_on_attach,
	renderer = nvim_tree_icons.renderer,
	diagnostics = nvim_tree_icons.diagnostics,
})
---------------------------------- or ----------------------------------
require("nvim-tree").setup({
	on_attach = my_on_attach,
 	renderer = {
 		icons = {
 			glyphs = nvim_tree_icons.renderer.icons.glyphs,
 		},
 	},
 	diagnostics = {
 		icons = nvim_tree_icons.diagnostics.icons,
 	},
})
```

### bufferline.lua

overwrite bufferline.lua icons

```lua
require("bufferline").setup({
	options = bufferline_icons.options,
})
---------------------------------- or ----------------------------------
require("bufferline").setup({
	options = {
		buffer_close_icon = bufferline_icons.options.buffer_close_icon,
		modified_icon = bufferline_icons.options.modified_icon,
		close_icon = bufferline_icons.options.modified_icon,
		left_trunc_marker = bufferline_icons.options.left_trunc_marker,
		right_trunc_marker = bufferline_icons.options.right_trunc_marker,
	},
})
```

### lualine.nvim

overwrite lualine icons.

components which have icons are `diff`, `buffers` `diagnostics`, `fileformat`, `filename`,

```lua
local lualine_icons = require("bye-nerdfont").get_lualine_icons()
require("lualine").setup({
	sections = {
		lualine_b = {
			"branch",
			lualine_icons.sections.diff,
			lualine_icons.sections.diagnostics,
		},
		lualine_x = {
			"encoding",
            "filename",
			lualine_icons.sections.fileformat,
		},
	},
})
```

## :sparkles: Contributing

PRs are always welcome!
a lot of icons are created by `Chatgpt`, so there may be some weird icons.
please let me know if you see any

## :pencil2: Acknowledgements

- [vim-emoji-icon-theme](https://github.com/adelarsq/vim-emoji-icon-theme/tree/master)
