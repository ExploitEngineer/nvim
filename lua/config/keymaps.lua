-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local discipline = require("craftzdog.discipline")
discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Split windows quickly
keymap.set("n", "ss", "<cmd>split<cr>", opts)
keymap.set("n", "sv", "<cmd>vsplit<cr>", opts)
keymap.set("n", "sh", "<C-w>h", opts)
keymap.set("n", "sj", "<C-w>j", opts)
keymap.set("n", "sk", "<C-w>k", opts)
keymap.set("n", "sl", "<C-w>l", opts)

-- Keep diagnostics navigation close to home row
keymap.set("n", "<C-j>", vim.diagnostic.goto_next, opts)
keymap.set("n", "<C-k>", vim.diagnostic.goto_prev, opts)
