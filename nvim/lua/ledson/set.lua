-- This line allow us to set the cursor, for eg always in insert mode theme 
vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- no wrapping lines.
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

-- Define the highlights for floating windows
local set_hl_for_floating_window = function()
    -- Set the highlight for the floating window itself
    vim.api.nvim_set_hl(0, 'NormalFloat', {
        link = 'Normal',
    })

    -- Set the highlight for the floating window border
    vim.api.nvim_set_hl(0, 'FloatBorder', {
        bg = 'none',
        fg = '#ffffff',  -- Color del borde
    })
end

set_hl_for_floating_window()

-- Set the border for floating windows
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",  -- También puede ser 'single', 'double', 'solid', 'shadow', etc.
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

vim.o.winblend = 10
vim.o.pumblend = 10

-- disabling new comment lines after writing a comment.
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

-- Cursor line.
vim.opt.cursorline = false

-- increase and decrement.
