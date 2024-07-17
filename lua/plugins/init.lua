local cmp = require("cmp")

return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "mileszs/ack.vim",
    init = function ()
      vim.g.ackpkg = "ag --nogroup --column"
    end
  },
  {
    "junegunn/fzf.vim",
    lazy = false,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    dependencies = "neovim/nvim-lspconfig",
    config = function ()
      require "configs.rustaceanvim"
    end
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    'saecki/crates.nvim',
    ft = {"toml"},
    config = function(_, opts)
      local crates  = require('crates')
      crates.setup(opts)

      require('cmp').setup.buffer({
        sources = { { name = "crates" }}
      })

      crates.show()
      -- require("core.utils").load_mappings("crates")
      vim.keymap.set("n", "<leader>rcu", function() require("crates").upgrade_all_crates() end)
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function(_, _)
      require("nvim-dap-virtual-text").setup()
    end
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp = require "cmp"

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
        }),
        sources = cmp.config.sources({
          { name = "crates" },
        }),
      })
      return M
    end,
  },
  {
    "mg979/vim-visual-multi",
    branch = "master",
    lazy = false,
    init = function()
      vim.g.VM_maps = {
        ["Add Cursor Down"] = '<M-j>',
        ["Add Cursor Up"]   = '<M-k>',
      }
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "Shatur/neovim-session-manager",
    lazy = false,
    init = function()
      local ses = require("session_manager")
      ses.setup({
        autoload_mode = require("session_manager.config").AutoloadMode.CurrentDir,
      })
    end
  }
}
