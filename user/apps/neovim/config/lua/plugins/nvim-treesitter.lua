return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			vim.filetype.add({ extension = { wgsl = "wgsl" } })

			local configs = require("nvim-treesitter.configs")
			configs.setup({
				auto_install = true,
				ensure_installed = {
					"lua",
					"rust",
					"c",
					"cpp",
					"cmake",
					"css",
					"csv",
					"dart",
					"diff",
					"dockerfile",
					"elixir",
					"erlang",
					"gitignore",
					"glsl",
					"go",
					"html",
					"java",
					"javascript",
					"json",
					"latex",
					"llvm",
					"make",
					"python",
					"sql",
					"svelte",
					"tsx",
					"toml",
					"typescript",
					"wgsl",
					"zig",
					"yaml",
					"nix",
				},
				highlight = { enable = true },
				indent = { enable = true },
			})

			vim.filetype.add({ extension = { vert = "glsl" } })
			vim.filetype.add({ extension = { frag = "glsl" } })
		end,
	},
	{
		"davidmh/mdx.nvim",
		config = true,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
}
