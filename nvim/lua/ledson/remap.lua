vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Changing between buffers
vim.keymap.set("n", "<C-h>", "<C-w>h", {silent = false})
vim.keymap.set("n", "<C-l>", "<C-w>l", {silent = false})
vim.keymap.set("n", "<C-j>", "<C-w>j", {silent = false})
vim.keymap.set("n", "<C-k>", "<C-w>k", {silent = false})

vim.keymap.set("n", "<leader>pv", ":Ex<CR>")
vim.keymap.set("n", "<leader>u", ":UndotreeShow<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "Y", "y&$")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
  require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
  require("vim-with-me").StopVimWithMe()
end)

-- greates remap ever (maintaining a copied information without replacing it).
vim.keymap.set("x", "<leader>p", "\"_dP")

-- next greatest remap ever: asbjornHaland
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- this is going to get me cancelled (theprimeagen words)
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end)
vim.keymap.set("n", "<leader>if", function()
  vim.lsp.buf.hover()
end)

vim.keymap.set("n", "<C-x>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-z>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace the word that the cursor is on
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
-- Make a file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = false })

-- Formatter using prettier
vim.keymap.set("n", "<leader>fp", ":Neoformat prettier<CR>")
vim.keymap.set("n", "<leader>nf", ":Neoformat<CR>")

-- Custom maps to save and quit
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>so", ":so<CR>")

-- Chadtree
vim.keymap.set("n", "<leader>co", ":CHADopen<CR>")

-- Resizing buffers
vim.keymap.set("n", "<leader>v>", ":vertical res -10<CR>")
vim.keymap.set("n", "<leader>v<", ":vertical res +10<CR>")
vim.keymap.set("n", "<leader>h<", ":horizontal res -10<CR>")
vim.keymap.set("n", "<leader>h>", ":horizontal res +10<CR>")

-- bufferline config
vim.keymap.set("n", "<leader>br", ":BufferLineCloseLeft<CR>")
vim.keymap.set("n", "<leader>bl", ":BufferLineCloseRight<CR>")
--vim.keymap.set("n", "<leader>bc", ":BufferLinePickClose<CR>")
vim.keymap.set("n", "<leader>bs", ":BufferLinePick<CR>")

-- configure bufDel
vim.keymap.set("n", "<leader>bc", ":BufDel<CR>")

-- configuring zen-mode
vim.keymap.set("n", "<leader>zm", ":ZenMode<CR>", { silent = true })
