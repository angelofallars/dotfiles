local wezterm = require 'wezterm';

return {

  color_scheme = "Catppuccin Mocha",

  window_background_opacity = 1,

  font = wezterm.font_with_fallback({
    { family = "JetBrains Mono", weight = "Medium" },
    "Twemoji",
  }),

  font_size = 14.5,

  window_padding = {
    left = 8,
    right = 8,
    top = 6,
    bottom = 6,
  },

  enable_tab_bar = false,

  warn_about_missing_glyphs = false,

  animation_fps = 165,
  default_cursor_style = 'SteadyBlock',

  cursor_blink_ease_in = 'Ease',
  cursor_blink_ease_out = 'Ease',

  window_background_gradient = {
    orientation = {
      Radial = {
        -- Specifies the x coordinate of the center of the circle,
        -- in the range 0.0 through 1.0.  The default is 0.5 which
        -- is centered in the X dimension.
        cx = 0.75,

        -- Specifies the y coordinate of the center of the circle,
        -- in the range 0.0 through 1.0.  The default is 0.5 which
        -- is centered in the Y dimension.
        cy = 0.20,

        -- Specifies the radius of the notional circle.
        -- The default is 0.5, which combined with the default cx
        -- and cy values places the circle in the center of the
        -- window, with the edges touching the window edges.
        -- Values larger than 1 are possible.
        radius = 1.5,
      },
    },


    colors = {
      -- "#575c7a",
      -- "#313244",
      -- "#1e1e2e",
      "#1e1e2e",
      -- "#181825",
      -- "#11111b",
    },

    interpolation = "Basis",
    blend = "Hsv",
    noise = 25,
  },

  keys = {
    -- Turn off the default CMD-m Hide action, allowing CMD-m to
    -- be potentially recognized and handled by the tab
    { key = 'w', mods = 'SUPER', action = 'DisableDefaultAssignment' },
  },

  mouse_bindings = {
    -- Ctrl-click will open the link under the mouse cursor
    {
      event = { Up = { streak = 1, button = 'Left' } },
      action = wezterm.action.OpenLinkAtMouseCursor,
    },
  }
}
