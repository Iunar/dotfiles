-- the .g is global variables
vim.g.mapleader = " "

-- set({mode}, {lhs}, {rhs}, {opts}) opts -> options
-- rhs -> map lhs to rhs
opts = {} ; remap = {}
remap.full = function(modes, lhs, rhs, opts)
	vim.keymap.set(modes, lhs, rhs, opts)
end

-- remap Normal mode No opts
remap.Nopts= function(lhs, rhs)
	vim.keymap.set('n', lhs, rhs)
end

-- remap normal mode with opts
remap.nopts= function(lhs, rhs, opts)
	vim.keymap.set('n', lhs, rhs, opts)
end

remap.full('n', "<leader>p", ":Ex<CR>", opts)
remap.Nopts("<leader>v", ":vs<CR>")
remap.Nopts("<leader>h", ":split<CR>")
