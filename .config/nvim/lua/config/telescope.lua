local telescope = require("telescope")
local previewers = require("telescope.previewers")

telescope.setup({
  defaults = {
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        preview_cutoff = 0,
      },
    },
  },
})
