-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
  config.font = wezterm.font 'OverpassM Nerd Font'

end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Molokai'

-- and finally, return the configuration to wezterm
return config
