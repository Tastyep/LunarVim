-- https://github.com/wbthomason/packer.nvim#specifying-plugins
return {
  -- Packer can manage itself as an optional plugin
  { "wbthomason/packer.nvim" },
  -- Quickstart LSP client configurations
  { "neovim/nvim-lspconfig" },
  -- LspInstall command
  { "kabouzeid/nvim-lspinstall", event = "VimEnter" },
  -- Telescope
  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "tjdevries/astronauta.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    config = [[require('lv-telescope')]],
    --event = "BufEnter",
  },
  -- Autocomplete
  {
    "hrsh7th/nvim-compe",
    event = "InsertEnter",
    config = function()
      require("lv-compe").config()
    end,
  },
  -- Snippets
  { "hrsh7th/vim-vsnip", event = "InsertEnter" },
  { "rafamadriz/friendly-snippets", event = "InsertEnter" },
  -- Treesitter
  { "nvim-treesitter/nvim-treesitter" },
  -- Formatter
  {
    "sbdchd/neoformat",
    config = function()
      require "lv-neoformat"
    end,
    event = "BufRead",
  },
  -- File explorer tree
  {
    "kyazdani42/nvim-tree.lua",
    -- event = "BufEnter",
    -- cmd = "NvimTreeToggle",
    commit = "fd7f60e242205ea9efc9649101c81a07d5f458bb",
    config = function()
      require("lv-nvimtree").config()
    end,
  },
  -- Git signs
  {
    "lewis6991/gitsigns.nvim",

    config = function()
      require("lv-gitsigns").config()
    end,
    event = "BufRead",
  },

  -- Keybindings popup
  {
    "folke/which-key.nvim",
    config = function()
      require "lv-which-key"
    end,
    event = "BufWinEnter",
  },
  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    after = { "telescope.nvim" },
    config = function()
      require "lv-autopairs"
    end,
  },
  -- Comment toggler
  {
    "terrortylor/nvim-comment",
    event = "BufWinEnter",
    config = function()
      local status_ok, nvim_comment = pcall(require, "nvim_comment")
      if not status_ok then
        return
      end
      nvim_comment.setup()
    end,
  },
  -- Color scheme
  { "christianchiarulli/nvcode-color-schemes.vim", opt = true },
  -- Icons
  { "kyazdani42/nvim-web-devicons" },
  -- Status line
  {
    "glepnir/galaxyline.nvim",
    config = function()
      require "lv-galaxyline"
    end,
    -- event = "VimEnter",
  },
  -- Buffer line
  {
    "romgrk/barbar.nvim",
    config = function()
      require "lv-barbar"
    end,
    event = "BufWinEnter",
  },

  -- [ Builtins ]
  -- These do not load by default

  -- Dashboard
  {
    "ChristianChiarulli/dashboard-nvim",
    event = "BufWinEnter",
    -- cmd = { "Dashboard", "DashboardNewFile", "DashboardJumpMarks" },
    -- config = function()
    --   require("lv-dashboard").config()
    -- end,
    disable = not O.plugin.dashboard.active,
    -- opt = true,
  },
  -- Zen mode
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    -- event = "BufRead",
    config = function()
      require("lv-zen").config()
    end,
    disable = not O.plugin.zen.active,
  },
  -- Color code colorizer
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufWinEnter",
    config = function()
      require "lv-colorizer"
      -- vim.cmd "ColorizerReloadAllBuffers"
    end,
    disable = not O.plugin.colorizer.active,
  },
  -- Treesitter playground

  {
    "nvim-treesitter/playground",
    event = "BufRead",
    disable = not O.plugin.ts_playground.active,
  },
  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    setup = function()
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char = "▏"

      vim.g.indent_blankline_filetype_exclude = {
        "help",
        "terminal",
        "dashboard",
      }
      vim.g.indent_blankline_buftype_exclude = { "terminal" }

      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = true
    end,
    disable = not O.plugin.indent_line.active,
  },
  -- Comments in context
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufRead",
    disable = not O.plugin.ts_context_commentstring.active,
  },
  -- Symbols tree view
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    disable = not O.plugin.symbol_outline.active,
  },
  -- Diagnostics
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    disable = not O.plugin.trouble.active,
  },
  -- Debugging
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "lv-dap"
    end,
    disable = not O.plugin.debug.active,
  },
  -- Floating terminal
  {
    "numToStr/FTerm.nvim",
    event = "BufRead",
    config = function()
      require("lv-floatterm").config()
    end,
    disable = not O.plugin.floatterm.active,
  },
  -- Use fzy for telescope
  {
    "nvim-telescope/telescope-fzy-native.nvim",
    event = "BufRead",
    disable = not O.plugin.telescope_fzy.active,
  },
  -- Use project for telescope
  {
    "nvim-telescope/telescope-project.nvim",
    event = "BufRead",
    setup = function()
      vim.cmd [[packadd telescope.nvim]]
    end,
    disable = not O.plugin.telescope_project.active,
  },
  -- Sane gx for netrw_gx bug
  {
    "felipec/vim-sanegx",
    event = "BufRead",
    disable = not O.plugin.sanegx.active,
  },
  -- Git diff view
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
    disable = not O.plugin.diffview.active,
  },
  -- Color scheme creation
  {
    "rktjmp/lush.nvim",
    -- cmd = {"LushRunQuickstart", "LushRunTutorial", "Lushify"},
    disable = not O.plugin.lush.active,
  },
  -- Debugger management
  {
    "Pocco81/DAPInstall.nvim",
    -- event = "BufRead",
    disable = not O.plugin.dap_install.active,
  },
  -- Pretty parentheses
  {
    "p00f/nvim-ts-rainbow",
    disable = not O.plugin.ts_rainbow.active,
  },
  -- Autotags <div>|</div>
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    disable = not O.plugin.ts_autotag.active,
  },
  -- Custom semantic text objects
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    disable = not O.plugin.ts_textobjects.active,
  },
  -- Smart text objects
  {
    "RRethy/nvim-treesitter-textsubjects",
    disable = not O.plugin.ts_textsubjects.active,
  },
  -- Text objects using hint labels
  {
    "mfussenegger/nvim-ts-hint-textobject",
    event = "BufRead",
    disable = not O.plugin.ts_hintobjects.active,
  },

  -- [ Language integrations ]

  -- Latex
  {
    "lervag/vimtex",
    ft = "tex",
    config = function()
      require "lv-vimtex"
    end,
  },
  -- Rust
  {
    "simrat39/rust-tools.nvim",
    disable = not O.lang.rust.rust_tools.active,
  },
  -- Elixir
  { "elixir-editors/vim-elixir", ft = { "elixir", "eelixir", "euphoria3" } },
  -- Javascript / Typescript
  {
    "jose-elias-alvarez/nvim-lsp-ts-utils",
    ft = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
  },
  -- Java
  {
    "mfussenegger/nvim-jdtls",
    disable = not O.lang.java.java_tools.active,
  },
  -- use {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   ft = {
  --     "javascript",
  --     "javascriptreact",
  --     "javascript.jsx",
  --     "typescript",
  --     "typescriptreact",
  --     "typescript.tsx",
  --   },
  --   config = function()
  --     require("null-ls").setup()
  --   end,
  -- }
}
