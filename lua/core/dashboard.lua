local M = {}

M.config = function()
  lvim.builtin.dashboard = {
    active = false,
    on_config_done = nil,
    config = {
      search_handler = "telescope",
      disable_at_vim_enter = 0,
      session_directory = os.getenv "HOME" .. "/.cache/lvim/sessions",
      custom_header = {
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣶⣾⠿⠿⠟⠛⠛⠛⠛⠿⠿⣿⣷⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣾⡿⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠿⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠒⠂⠉⠉⠉⠉⢩⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠸⡀⠀⠀⠀⠀⠀⢰⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⠠⡀⠀⠀⢀⣾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠢⢀⣸⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡧⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠈⠁⠒⠤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣇⠀⠀⠀⠀⠀⠀⠉⠢⠤⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡟⠈⠑⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠑⠒⠤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡇⠀⠀⢀⣣⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠒⠢⠤⠄⣀⣀⠀⠀⠀⢠⣿⡟⠀⠀⠀⣺⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⣿⠇⠀⠀⠀⠀⠀⣤⡄⠀⠀⢠⣤⡄⠀⢨⣭⣠⣤⣤⣤⡀⠀⠀⢀⣤⣤⣤⣤⡄⠀⠀⠀⣤⣄⣤⣤⣤⠀⠀⣿⣯⠉⠉⣿⡟⠀⠈⢩⣭⣤⣤⠀⠀⠀⠀⣠⣤⣤⣤⣄⣤⣤",
        "⢠⣿⠀⠀⠀⠀⠀⠀⣿⠃⠀⠀⣸⣿⠁⠀⣿⣿⠉⠀⠈⣿⡇⠀⠀⠛⠋⠀⠀⢹⣿⠀⠀⠀⣿⠏⠀⠸⠿⠃⠀⣿⣿⠀⣰⡟⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀⣿⡟⢸⣿⡇⢀⣿",
        "⣸⡇⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⣿⡟⠀⢠⣿⡇⠀⠀⢰⣿⡇⠀⣰⣾⠟⠛⠛⣻⡇⠀⠀⢸⡿⠀⠀⠀⠀⠀⠀⢻⣿⢰⣿⠀⠀⠀⠀⠀⠀⣾⡇⠀⠀⠀⢸⣿⠇⢸⣿⠀⢸⡏",
        "⣿⣧⣤⣤⣤⡄⠀⠘⣿⣤⣤⡤⣿⠇⠀⢸⣿⠁⠀⠀⣼⣿⠀⠀⢿⣿⣤⣤⠔⣿⠃⠀⠀⣾⡇⠀⠀⠀⠀⠀⠀⢸⣿⣿⠋⠀⠀⠀⢠⣤⣤⣿⣥⣤⡄⠀⣼⣿⠀⣸⡏⠀⣿⠃",
        "⠉⠉⠉⠉⠉⠁⠀⠀⠈⠉⠉⠀⠉⠀⠀⠈⠉⠀⠀⠀⠉⠉⠀⠀⠀⠉⠉⠁⠈⠉⠀⠀⠀⠉⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉⠁⠀⠉⠁⠀⠉⠁⠀⠉⠀",
      },

      custom_section = {
        a = {
          description = { "  Find File          " },
          command = "Telescope find_files",
        },
        -- b is reserved for the core.project module
        c = {
          description = { "  Recently Used Files" },
          command = "Telescope oldfiles",
        },
        d = {
          description = { "  Find Word          " },
          command = "Telescope live_grep",
        },
        e = {
          description = { "  Configuration      " },
          command = ":e " .. USER_CONFIG_PATH,
        },
      },

      footer = { "lunarvim.org" },
    },
  }
end

M.setup = function()
  vim.g.dashboard_disable_at_vimenter = lvim.builtin.dashboard.config.disable_at_vim_enter
  vim.g.dashboard_custom_header = lvim.builtin.dashboard.config.custom_header
  vim.g.dashboard_default_executive = lvim.builtin.dashboard.config.search_handler
  vim.g.dashboard_custom_section = lvim.builtin.dashboard.config.custom_section
  vim.g.dashboard_session_directory = lvim.builtin.dashboard.config.session_directory

  lvim.builtin.which_key.mappings[";"] = { "<cmd>Dashboard<CR>", "Dashboard" }

  vim.cmd "let packages = len(globpath('~/.local/share/lunarvim/site/pack/packer/start', '*', 0, 1))"

  vim.api.nvim_exec(
    [[
    let g:dashboard_custom_footer = ['LunarVim loaded '..packages..' plugins  ']
]],
    false
  )

  require("core.autocmds").define_augroups {
    _dashboard = {
      -- seems to be nobuflisted that makes my stuff disappear will do more testing
      {
        "FileType",
        "dashboard",
        "setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs= ",
      },
      {
        "FileType",
        "dashboard",
        "set showtabline=0 | autocmd BufLeave <buffer> set showtabline=" .. vim.opt.showtabline._value,
      },
      { "FileType", "dashboard", "nnoremap <silent> <buffer> q :q<CR>" },
    },
  }

  if lvim.builtin.dashboard.on_config_done then
    lvim.builtin.dashboard.on_config_done()
  end
end

return M
