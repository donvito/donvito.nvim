require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Melvin custom config

local set = vim.opt -- set options
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4

-- Disable arrow keys in normal mode
map("n", "<Up>", "<Nop>", { noremap = true, silent = true })
map("n", "<Down>", "<Nop>", { noremap = true, silent = true })
map("n", "<Left>", "<Nop>", { noremap = true, silent = true })
map("n", "<Right>", "<Nop>", { noremap = true, silent = true })

-- Disable arrow keys in insert mode
map("i", "<Up>", "<Nop>", { noremap = true, silent = true })
map("i", "<Down>", "<Nop>", { noremap = true, silent = true })
map("i", "<Left>", "<Nop>", { noremap = true, silent = true })
map("i", "<Right>", "<Nop>", { noremap = true, silent = true })

-- Disable arrow keys in visual mode
map("v", "<Up>", "<Nop>", { noremap = true, silent = true })
map("v", "<Down>", "<Nop>", { noremap = true, silent = true })
map("v", "<Left>", "<Nop>", { noremap = true, silent = true })
map("v", "<Right>", "<Nop>", { noremap = true, silent = true })

map("n", "gf", "<cmd>Telescope lsp_references<cr>", { noremap = true, silent = true })

vim.wo.relativenumber = true

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", {}),
    desc = "Highlight selection on yank",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank { higroup = "IncSearch", timeout = 300 }
    end,
})

map("n", "se", "<cmd>lua vim.diagnostic.open_float()<cr>", { noremap = true, silent = true })

-- Set 'nowrap'
vim.opt.wrap = false

-- Additional mappings
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

