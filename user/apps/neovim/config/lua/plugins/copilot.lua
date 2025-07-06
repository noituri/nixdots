return {
	"github/copilot.vim",
	config = function()
		vim.cmd("Copilot disable")
		vim.keymap.set("n", "<leader>cc", ":Copilot enable<CR>", {})
		vim.keymap.set("n", "<leader>cd", ":Copilot disable<CR>", {})
	end,
}
