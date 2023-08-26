local plugins = {
  ---------- LSP + DAP + Testing ----------
  { "williamboman/mason.nvim" },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufEnter",
    opts = function()
      return require "custom.configs.null-ls.base"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings "dap"
      require("dap.ext.vscode").load_launchjs(nil, {})
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    opts = require "custom.configs.dapuiopts",
    config = function(_, opts)
      require("dapui").setup(opts)
    end,
  },
  {
    "nvim-neotest/neotest",
    ft = "go",
    dependencies = { "antoinemadec/FixCursorHold.nvim", "nvim-neotest/neotest-go" },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-go",
        },
      }
    end,
    vim.api.nvim_create_user_command("Test", function()
      -- require("neotest").run.run(vim.fn.getcwd())
      vim.cmd [[Neotest summary open]]
    end, {}),
  },

  ---------- GO-SPECIFIC ----------
  {
    "dreamsofcode-io/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings "dap_go"
      -- add launch.json, since dap_go overrides them
      vim.cmd "DapLoadLaunchJSON"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings "gopher"
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  ---------- WEB DEV ----------
  {
    "windwp/nvim-ts-autotag",
    event = "BufEnter",
    config = function(_, opts)
      require("nvim-ts-autotag").setup(opts)
    end,
  },

  ---------- OTHER ----------
  {
    "theprimeagen/harpoon",
    lazy = false,
    config = function(_, _)
      require("core.utils").load_mappings "harpoon"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        prompt_prefix = " 🔎  ",
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      renderer = {
        icons = {
          glyphs = {
            folder = {
              default = "󰉋",
            },
          },
        },
      },
    },
  },
}
return plugins
