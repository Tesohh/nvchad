local M = {}

M.lspconfig = {
  plugin = true,
  i = {
    ["<C-s>"] = {
      function()
        vim.lsp.buf.signature_help()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },
  },
}

M.telescope = {
  n = {
    ["<leader>fs"] = {
      function()
        require("telescope.builtin").lsp_document_symbols()
      end,
      "Search document symbols",
    },
    ["<leader>fS"] = {
      function()
        require("telescope.builtin").lsp_dynamic_workspace_symbols()
      end,
      "Search document symbols",
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>dd"] = {
      function()
        require("dap").continue()
        require("dapui").open()
      end,
      "Start",
    },
    ["<leader>dc"] = {
      "<cmd>DapContinue<CR>",
      "Continue",
    },
    ["<leader>dS"] = {
      "<cmd>DapTerminate<CR>",
      "Stop",
    },
    ["<leader>di"] = {
      "<cmd>DapStepInto<CR>",
      "Step Into",
    },
    ["<leader>do"] = {
      "<cmd>DapStepOut<CR>",
      "Step Out",
    },
    ["<leader>dO"] = {
      "<cmd>DapStepOver<CR>",
      "Step Over",
    },
    ["<leader>db"] = {
      "<cmd>DapToggleBreakpoint<CR>",
      "Add breakpoint at line",
    },
    ["<leader>dv"] = {
      function()
        require("dapui").toggle()
      end,
      "Toggle DapUI",
    },
    -- ["<leader>dl"] = {
    --   function()
    --     local widgets = require "dap.ui.widgets"
    --     local sidebar = widgets.sidebar(widgets.scopes)
    --     sidebar.open()
    --   end,
    --   "Open debugging sidebar",
    -- },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug go test",
    },
    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug last go test",
    },
  },
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>ge"] = {
      "<cmd>GoIfErr<CR>",
      "if err",
    },
  },
}

return M
