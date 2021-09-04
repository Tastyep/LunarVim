local M = {
  defaults = {
    active = true,
    on_config_done = nil,
    config = {
      side = "left",
      width = 30,
      show_icons = {
        git = 1,
        folders = 1,
        files = 1,
        folder_arrows = 1,
        tree_width = 30,
      },
      ignore = { ".git", "node_modules", ".cache" },
      auto_open = 0,
      auto_close = 1,
      quit_on_open = 0,
      follow = 1,
      hide_dotfiles = 1,
      git_hl = 1,
      root_folder_modifier = ":t",
      tab_open = 0,
      allow_resize = 1,
      lsp_diagnostics = 1,
      auto_ignore_ft = { "startify", "dashboard" },
      icons = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
      },
    },
  },
}

function M:setup(config)
  config:merge(self.defaults)
end

function M:config()
  local status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
  if not status_ok then
    local Log = require "core.log"
    Log:error "Failed to load nvim-tree.config"
    return
  end
  local g = vim.g

  for opt, val in pairs(lvim.builtins.nvimtree.config) do
    g["nvim_tree_" .. opt] = val
  end

  -- Implicitly update nvim-tree when project module is active
  if lvim.builtins.project.active then
    vim.g.nvim_tree_update_cwd = 1
    vim.g.nvim_tree_respect_buf_cwd = 1
    vim.g.nvim_tree_disable_netrw = 0
    vim.g.nvim_tree_hijack_netrw = 0
    vim.g.netrw_banner = 0
  end

  local tree_cb = nvim_tree_config.nvim_tree_callback

  if not g.nvim_tree_bindings then
    g.nvim_tree_bindings = {
      { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
      { key = "h", cb = tree_cb "close_node" },
      { key = "v", cb = tree_cb "vsplit" },
    }
  end

  lvim.builtins.which_key.mappings["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" }

  local tree_view = require "nvim-tree.view"

  -- Add nvim_tree open callback
  local open = tree_view.open
  tree_view.open = function()
    M.on_open()
    open()
  end

  vim.cmd "au WinClosed * lua require('core.builtins.nvimtree').on_close()"

  if lvim.builtins.nvimtree.on_config_done then
    lvim.builtins.nvimtree.on_config_done(nvim_tree_config)
  end
end

function M.on_open()
  if package.loaded["bufferline.state"] and lvim.builtins.nvimtree.config.side == "left" then
    require("bufferline.state").set_offset(lvim.builtins.nvimtree.config.width + 1, "")
  end
end

function M.on_close()
  local buf = tonumber(vim.fn.expand "<abuf>")
  local ft = vim.api.nvim_buf_get_option(buf, "filetype")
  if ft == "NvimTree" and package.loaded["bufferline.state"] then
    require("bufferline.state").set_offset(0)
  end
end

function M.change_tree_dir(dir)
  local lib_status_ok, lib = pcall(require, "nvim-tree.lib")
  if lib_status_ok then
    lib.change_dir(dir)
  end
end

return M