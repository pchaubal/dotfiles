-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- [[ Basic Keymaps ]]
vim.keymap.set("n", "<S-z><S-z>", vim.cmd.update, {})
--  Keymaps for toggle term
vim.keymap.set("n", "<A-v>", ":1TermExec size=80 direction=vertical cmd='python %' name=vert<CR>")
vim.keymap.set("n", "<A-j>", ":1TermExec size=80 direction=vertical cmd='julia %' name=vert_julia<CR>")
-- Run julia or python in vertical termial splitscreen depending upon filetype
vim.keymap.set("n", "<A-v>", function()
  -- Save only if there are changes
  vim.cmd("update")
  -- Run Julia if the filetype is julia, otherwise run Python
  if vim.bo.filetype == "julia" then
    vim.cmd(":1TermExec size=80 direction=vertical cmd='julia %' name=vert<CR>")
  else
    vim.cmd(":1TermExec size=80 direction=vertical cmd='python %' name=vert<CR>")
  end
end)
-- Run julia or python in vertical termial splitscreen depending upon filetype
vim.keymap.set("n", "<A-r>", function()
  -- Save only if there are changes
  vim.cmd("update")
  -- Run Julia if the filetype is julia, otherwise run Python
  if vim.bo.filetype == "julia" then
    vim.cmd(":1TermExec direction=horizontal cmd='julia %' name=vert<CR>")
  else
    vim.cmd(":1TermExec direction=horizontal cmd='python %' name=vert<CR>")
  end
end)
--
vim.keymap.set("n", "<A-l>", ":ToggleTermSendCurrentLine<CR>")
vim.keymap.set("v", "<A-b>", ":ToggleTermSendVisualLines <CR>")
-- Keymap for insert mode send blocks to terminal
vim.keymap.set({ "i", "n" }, "<A-b>", function()
  -- Exit insert mode, go to visual mode, select the paragraph, and send to terminal
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>vip", true, false, true), "x", true)
  vim.cmd("ToggleTermSendVisualLines")
end, { noremap = true, silent = true })
