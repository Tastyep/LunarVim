require "default-config"
require "keymappings"
vim.cmd("luafile " .. CONFIG_PATH .. "/lv-config.lua")
require "settings"

local plugins = require "plugins"
local plugin_loader = require("plugin-loader").init()
plugin_loader:load { plugins, O.user_plugins }
vim.g.colors_name = O.colorscheme -- Colorscheme must get called after plugins are loaded or it will break new installs.

require "lv-utils"
require "lv-treesitter"
-- TODO these guys need to be in language files
-- require "lsp"
-- if O.lang.emmet.active then
--   require "lsp.emmet-ls"
-- end
-- if O.lang.tailwindcss.active then
--   require "lsp.tailwind
