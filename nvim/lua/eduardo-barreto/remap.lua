vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Opens explorer" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next match" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Last match" })

vim.keymap.set("n", "d", '"_d', { desc = "Delete character" })
vim.keymap.set("n", "d", '"_d', { desc = "Delete character" })
vim.keymap.set("v", "D", '"_D', { desc = "Delete line" })
vim.keymap.set("v", "D", '"_D', { desc = "Delete line" })

vim.keymap.set("n", "<leader>s", [[:%s/<C-r><C-w>/<C-r><C-w>/gIc<Left><Left><Left>]], { desc = "Replace current" })
vim.keymap.set("n", "<leader>vs", [[:%s/<C-r>0/<C-r>0/gIc<Left><Left><Left>]], { desc = "Replace current" })

vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { desc = "Resize vertical -2" })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { desc = "Resize vertical +2" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize horizontal -2" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize horizontal +2" })

vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Last buffer" })

vim.keymap.set("n", "<leader>x", ":BufferClose<CR>", { desc = "Close current buffer" })

vim.keymap.set("n", "dd", '"_dd', { desc = "Delete line" })

vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save" })

vim.keymap.set("n", "<leader>h", ":vspl<CR>", { desc = "Horizontal split" })
vim.keymap.set("n", "<leader>v", ":spl<CR>", { desc = "Vertical split" })
