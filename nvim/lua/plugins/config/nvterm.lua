require("nvterm").setup({
  terminals = {
    list = {},
    type_opts = {
      float = {
        relative = 'editor',
        row = 0.3,
        col = 0.25,
        width = 0.5,
        height = 0.4,
        border = "single",
      },
      horizontal = { location = "rightbelow", split_ratio = .25, },
      vertical = { location = "rightbelow", split_ratio = .5 },
    }
  },
  behavior = {
    close_on_exit = true,
    auto_insert = true,
  },
})
