-- lua/plugins/neogen.lua
return {
  "danymat/neogen",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "L3MON4D3/LuaSnip", -- Add this line
    -- If you use nvim-cmp, ensure luasnip is also listed there or loaded early
    "hrsh7th/nvim-cmp", -- Example if you use cmp"
  },
  opts = {
    enabled = true,
    snippet_engine = "luasnip", -- Keep using LazyVim's default
    languages = {
      -- Python configuration (keep this from before)
      python = {
        template = {
          annotation_convention = "google_docstrings",
        },
      },

      -- C configuration
      c = {
        template = {
          -- "doxygen" convention aligns well with Google Style recommendations
          -- for block comments (/** ... */) using @param, @return etc.
          annotation_convention = "doxygen",
        },
      },

      -- C++ configuration
      cpp = {
        template = {
          -- Use the same "doxygen" convention for C++
          annotation_convention = "doxygen",
        },
      },

      -- You can configure other languages here too
      -- rust = { ... }
    },
  },
  -- build = ":Neogen build", -- Usually not needed unless fixing parser issues
  cmd = "Neogen",
  keys = {
    -- Keep the same convenient keymap for all supported languages
    {
      "<leader>cc",
      function()
        require("neogen").generate()
      end,
      desc = "Neogen Generate Annotation",
    },
  },
}
