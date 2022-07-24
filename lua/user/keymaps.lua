local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<leader>b", ":HopWord<cr>", opts)
keymap("n", "<leader>v", ":HopLineStart<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==g", opts)
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==g", opts)

-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>l", opts)
keymap("i", "kl", "<ESC>la", opts)
keymap("i", "hj", "<ESC>i", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "q", "<esc><esc><esc>", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- LSP --
keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "<leaded>a", ":lua vim.lsp.buf.code_action()<cr>", opts)
keymap("n", "<leader>C", ":lua vim.diagnostic.open_float()<cr>", opts)
keymap("n", "<S-k>", ":lua vim.lsp.buf.hover()<cr>", opts)

-- DAP --
keymap("n", "<F5>", ":FlutterRun<cr>", opts)
keymap("n", "<leader><F4>", ":lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("v", "<M-k>", ":lua require('dapui').eval()<CR>", opts)

-- GIT

vim.cmd [[
function GitCommit() abort
  let message = input('Mensagem do commit: ')
  call system("git add .")
  call system("git commit -m '" . message . "'")
endfunction

nnoremap <leader>gg :call GitCommit()<CR>
nnoremap <leader>gp :! git push<CR>
]]


