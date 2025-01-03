return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      -- Disable treesitter and sidebar completely
      vim.g.avante_disable_treesitter = true
      vim.g.avante_disable_sidebar = true

      -- Create an autocommand group
      local group = vim.api.nvim_create_augroup("AvanteCustom", { clear = true })

      -- Handle filetype changes safely
      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = "Avante",
        callback = function(ev)
          vim.schedule(function()
            if vim.api.nvim_buf_is_valid(ev.buf) then
              pcall(vim.api.nvim_buf_set_option, ev.buf, "filetype", "markdown")
            end
          end)
        end,
      })
    end,
    opts = {
      provider = "ollama",
      vendors = {
        ollama = {
          __inherited_from = "openai",
          api_key_name = "",
          endpoint = "http://127.0.0.1:11434/v1",
          model = "qwen2.5-coder:7b",
          options = {
            temperature = 0.1,
            top_p = 0.8,
            max_tokens = 800,
            frequency_penalty = 0.0,
            presence_penalty = 0.0,
            stop = "\n\n",
          },
          models = {
            code = "qwen2.5-coder:7b",
            explain = "qwen2.5-coder:7b",
            review = "qwen2.5-coder:7b",
          },
        },
      },
      sidebar = {
        enable = false,
      },
      treesitter = {
        enable = false,
      },
      buffer = {
        options = {
          filetype = "markdown",
        },
      },
      keymaps = {
        explain = "<leader>ae",
        ask = "<leader>aa",
        chat = "<leader>ac",
        reset = "<leader>ar",
        accept = "<leader>ay",
        reject = "<leader>an",
      },
      commands = {
        explain = "AvanteExplain",
        ask = "AvanteAsk",
        chat = "AvanteChat",
        reset = "AvanteReset",
      },
      chat = {
        welcome_message = "How can I help you today?",
        loading_text = "Thinking...",
      },
    },
    config = function(_, opts)
      -- Ensure the plugin is loaded after all options are set
      vim.schedule(function()
        require("avante").setup(opts)
      end)
    end,
    build = "make",
    BUILD_FROM_SOURCE = true,
  },
}
