-- needed to make nvim use terminal colors
vim.o.termguicolors = false
vim.cmd 'colorscheme noctu'

-- set line numbers
vim.opt.number = true

-- sync OS and nvim clipboard
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- prevent nvim from copying what was deleted
vim.keymap.set("x", "p", function()
  return 'pgv"' .. vim.v.register .. "y"
end, { expr = true })
