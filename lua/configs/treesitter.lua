return {
	ensure_installed = {
		"lua",
		"luadoc",
		"printf",
		"vim",
		"vimdoc",
		"javascript",
		"typescript",
		"vue",
		"css",
		"scss",
		"rust",
		"prisma",
		"graphql",
		"yaml",
		"bash",
		"tsx",
	},
	sync_install = false,
	highlight = {
		enable = true,
		use_languagetree = true,
	},
	indent = {
		enable = true,
	},
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
}
