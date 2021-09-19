-- TODO: proper gruvbox

return function(lush)
  local hsl = lush.hsl
  local colors = {
    dark0_hard = hsl("#1d2021"),
    dark0 = hsl("#282828"),
    dark0_soft = hsl("#32302f"),
    dark1 = hsl("#3c3836"),
    dark2 = hsl("#504945"),
    dark3 = hsl("#665c54"),
    dark4 = hsl("#7c6f64"),
    light0_hard = hsl("#f9f5d7"),
    light0 = hsl("#fbf1c7"),
    light0_soft = hsl("#f2e5bc"),
    light1 = hsl("#ebdbb2"),
    light2 = hsl("#d5c4a1"),
    light3 = hsl("#bdae93"),
    light4 = hsl("#a89984"),
    bright_red = hsl("#fb4934"),
    bright_green = hsl("#b8bb26"),
    bright_yellow = hsl("#fabd2f"),
    bright_blue = hsl("#83a598"),
    bright_purple = hsl("#d3869b"),
    bright_aqua = hsl("#8ec07c"),
    bright_orange = hsl("#fe8019"),
    neutral_red = hsl("#cc241d"),
    neutral_green = hsl("#98971a"),
    neutral_yellow = hsl("#d79921"),
    neutral_blue = hsl("#458588"),
    neutral_purple = hsl("#b16286"),
    neutral_aqua = hsl("#689d6a"),
    neutral_orange = hsl("#d65d0e"),
    faded_red = hsl("#9d0006"),
    faded_green = hsl("#79740e"),
    faded_yellow = hsl("#b57614"),
    faded_blue = hsl("#076678"),
    faded_purple = hsl("#8f3f71"),
    faded_aqua = hsl("#427b58"),
    faded_orange = hsl("#af3a03"),
    gray = hsl("#928374"),
  }
  return function(lush) 
    return {
      -- Define Vim's Normal highlight group
      Normal { bg = colors.dark0, fg = colors.light0 },

      -- Make whitespace slightly darker than normal.
      -- you must define Normal before deriving from it.
      Whitespace { fg = Normal.fg.darken(40) },

      -- Make comments look the same as whitespace, but with italic text
      Comment { Whitespace, gui="italic" },
    }
  end
end
