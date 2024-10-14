return {
  -- add onedark colorscheme
  { "navarasu/onedark.nvim", opts = { style = "darker" } },
  -- configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "onedark" },
  },
}
