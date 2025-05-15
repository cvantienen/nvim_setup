require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
---- General options
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 4 -- Indentation size
vim.opt.tabstop = 4 -- Tab size
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.number = true -- Show absolute line number for current line
vim.opt.wrap = false -- Disable line wrapping

-- Python-specific options
-- vim.g.python3_host_prog = "/usr/bin/python3" -- Ensure the correct Python interpreter is used

-- Enable Treesitter folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
--

vim.api.nvim_create_autocmd("BufDelete", {
  callback = function()
    local bufs = vim.t.bufs
    if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
      vim.cmd "Nvdash"
    end
  end,
})
