-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.max_fps = 120
config.enable_wayland = true

-- Function to detect appearance
function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end
-- Function to determine the color scheme
function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'terafox'
  else
    return 'terafox'
  end
end
config.color_scheme = scheme_for_appearance(get_appearance())

config.colors = {
  -- The color of the split lines between panes
  split = '#5B879A',
  tab_bar = {
    -- The color of the strip that goes along the top of the window
    -- (does not apply when fancy tab bar is in use)
    background = '#0F1C1E',

    -- The active tab is the one that has focus in the window
    active_tab = {
      -- The color of the background area for the tab
      bg_color = '#5A93AA',
      -- The color of the text for the tab
      fg_color = '#0F1C1E',

      -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
      -- label shown for this tab.
      -- The default is "Normal"
      intensity = 'Normal',

      -- Specify whether you want "None", "Single" or "Double" underline for
      -- label shown for this tab.
      -- The default is "None"
      underline = 'None',

      -- Specify whether you want the text to be italic (true) or not (false)
      -- for this tab.  The default is false.
      italic = false,

      -- Specify whether you want the text to be rendered with strikethrough (true)
      -- or not for this tab.  The default is false.
      strikethrough = false,
    },

    -- Inactive tabs are the tabs that do not have focus
    inactive_tab = {
      bg_color = '#0F1C1E',
      fg_color = '#5A93AA',

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over inactive tabs
    inactive_tab_hover = {
      bg_color = '#5A93AA',
      fg_color = '#0F1C1E',
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab_hover`.
    },

    -- The new tab button that let you create new tabs
    new_tab = {
      bg_color = '#152528',
      fg_color = '#e6eaea',

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over the new tab button
    new_tab_hover = {
      bg_color = '#5A93AA',
      fg_color = '#0F1C1E',
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab_hover`.
    },
  },
}

-- Fonts
config.font_size = 14
config.font = wezterm.font({ family = "Iosevka NF" })
config.bold_brightens_ansi_colors = true
config.font_rules = {
  {
    intensity = "Bold",
    italic = true,
    font = wezterm.font({ family = "Maple Mono", weight = "Bold", style = "Italic" }),
  },
  {
    italic = true,
    intensity = "Half",
    font = wezterm.font({ family = "Maple Mono", weight = "DemiBold", style = "Italic" }),
  },
  {
    italic = true,
    intensity = "Normal",
    font = wezterm.font({ family = "Maple Mono", style = "Italic" }),
  },
}

-- Cursor
config.default_cursor_style = "BlinkingBar"
config.force_reverse_video_cursor = true
-- cell_width = 0.9,
config.scrollback_lines = 10000
config.hide_mouse_cursor_when_typing = true

-- Window
config.window_padding = { left = 20, right = 20, top = 20, bottom = 0 }
config.initial_rows = 35 -- height [stty size]
config.initial_cols = 135 -- width
config.window_background_opacity = 1.0
config.window_decorations = "RESIZE"
config.window_frame = {
  border_left_width = '2px',
  border_right_width = '2px',
  border_bottom_height = '2px',
  border_top_height = '2px',
  border_left_color = '#5A93AA',
  border_right_color = '#5A93AA',
  border_bottom_color = '#5A93AA',
  border_top_color = '#5A93AA',
}

-- tab bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true

-- Keybinds
config.leader = { key = "q", mods = "ALT", timeout_milliseconds = 2000 }
config.keys = {
  {
    key = 'S',
    mods = 'CTRL|SHIFT',
    action = wezterm.action_callback(function(window, pane)
      local scrollback = pane:get_logical_lines_as_text(pane:get_dimensions().scrollback_rows)
      local file = io.open(os.getenv("HOME") .. "/wezterm_scrollback.txt", "a")
      if file then
        file:write(scrollback)
        file:close()
        wezterm.log_info("Scrollback saved in wezterm_scrollback.txt")
      end
    end),
  },
  {
    key = '|',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '-',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'w',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'LeftArrow',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key = 't',
    mods = 'LEADER',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  { key = 't', mods = 'ALT', action = wezterm.action.ShowTabNavigator },
  {
    key = "b",
    mods = "LEADER",
    action = wezterm.action.ActivateTabRelative(-1)
  },
  {
    key = "n",
    mods = "LEADER",
    action = wezterm.action.ActivateTabRelative(1)
  },
  {
    key = "LeftArrow",
    mods = "CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize { "Left", 5 }
  },
  {
    key = "RightArrow",
    mods = "CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize { "Right", 5 }
  },
  {
    key = "DownArrow",
    mods = "CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize { "Down", 5 }
  },
  {
    key = "UpArrow",
    mods = "CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize { "Up", 5 }
  },
  {
    key = "h",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection "Left"
  },
  {
    key = "j",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection "Down"
  },
  {
    key = "k",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection "Up"
  },
  {
    key = "l",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection "Right"
  },
}

for i = 1, 8 do
  -- CTRL+ALT + number to activate that tab
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(i - 1),
  })
end

-- tmux status
wezterm.on("update-right-status", function(window, _)
    local SOLID_LEFT_ARROW = ""
    local ARROW_FOREGROUND = { Foreground = { Color = "#5A93AA" } }
    local prefix = ""

    if window:leader_is_active() then
        prefix = " " .. utf8.char(0x1f30a) -- ocean wave
        SOLID_LEFT_ARROW = utf8.char(0xe0b2) -- solid arrow
    end

    if window:active_tab():tab_id() ~= 0 then
        ARROW_FOREGROUND = { Foreground = { Color = "#5A93AA" } }
    end -- arrow color based on if tab is first pane

    window:set_left_status(wezterm.format {
        { Background = { Color = "#0F1C1E" } },
        { Text = prefix },
        ARROW_FOREGROUND,
        { Text = SOLID_LEFT_ARROW }
    })
end)

-- and finally, return the configuration to wezterm
return config
