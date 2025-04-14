-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- -- Undercurl
-- vim.cmd([[let &t_Cs = "\e[4:3m"]])
-- vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.opt.termguicolors = true

vim.opt.guicursor = {
  "n-v-c:block",
  "i-ci-ve:ver25",
  "r-cr:hor20",
  "o:hor50",
  -- "a:blinkwait700-blinkon400-blinkoff250",
}

local set_cursor_colors = function()
  -- Set Normal background for better contrast (optional)
  -- vim.cmd([[highlight Normal ctermbg=15]]) -- White background

  -- Set Cursor and TermCursor colors
  vim.cmd([[highlight Cursor guifg=#000000 ctermbg=16]]) -- Black on yellow
  vim.cmd([[highlight TermCursor guifg=0 ctermbg=16]]) -- Black on yellow (cterm colors)
end

-- Use vim.defer_fn for reliable timing
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    vim.defer_fn(set_cursor_colors, 0)
  end,
})
