local M = {
  path = string.format("%s/.config/lvim/config.lua", os.getenv "HOME"),
}

--- Initialize lvim default configuration
-- Define lvim global variable
function M:init()
  require "config.defaults"

  local builtins = require "core.builtins"
  builtins.config(self)

  local settings = require "config.settings"
  settings.load_options()

  -- Fallback config.lua to lv-config.lua
  local uv = vim.loop
  if not uv.fs_stat(self.path) then
    local lv_config = self.path:gsub("config.lua$", "lv-config.lua")
    print(self.path, "not found, falling back to", lv_config)

    self.path = lv_config
  end
end

--- Override the configuration with a user provided one
-- @param config_path The path to the configuration overrides
function M:load(config_path)
  config_path = config_path or self.path
  local ok, err = pcall(vim.cmd, "luafile " .. config_path)
  if not ok then
    print("Invalid configuration", config_path)
    print(err)
    return
  end

  self.path = config_path

  local settings = require "config.settings"
  settings.load_commands()
end

return M
