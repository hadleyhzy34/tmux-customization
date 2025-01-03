return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local group = vim.api.nvim_create_augroup("TreesitterCustom", { clear = true })
      
      -- Disable treesitter for specific filetypes
      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = { "Avante", "markdown" },
        callback = function(ev)
          vim.schedule(function()
            if vim.api.nvim_buf_is_valid(ev.buf) then
              pcall(vim.cmd, "TSBufDisable highlight")
              pcall(vim.cmd, "TSBufDisable indent")
              pcall(vim.cmd, "TSBufDisable incremental_selection")
            end
          end)
        end,
      })
      
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
          disable = function(_, bufnr)
            local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
            return ft == "Avante" or ft == "markdown"
          end,
        },
        indent = { 
          enable = true,
          disable = { "Avante", "markdown" },
        },
      })
    end,
  },
} 