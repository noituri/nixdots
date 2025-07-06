vim.cmd("language en_US.UTF-8")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.g.mapleader = " "
vim.diagnostic.config({ virtual_text = true })
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

-- TODO(noituri): Temporary fix
vim.api.nvim_create_autocmd("FileType", {
  pattern = "wgsl",
  callback = function()
    vim.bo.commentstring = "// %s"
  end
})
