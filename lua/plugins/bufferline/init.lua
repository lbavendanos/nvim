require('bufferline').setup ({
  options = {
    mappings = true,
  },
  highlights = {
    buffer_selected = {
      guifg = '#eceef0',
      guibg = '#212121',

      gui = 'bold'
    },
    buffer_visible = {
      -- guifg = normal_fg,
      guibg = '#212121',
      gui = "bold"
    },
    duplicate_selected = {
      guifg = '#eceef0',
      guibg = '#212121',
      gui = "italic",
    },
    duplicate_visible = {
      -- guifg = normal_fg,
      gui = "italic",
      guibg = '#212121'
    },
    indicator_selected = {
      guifg = '#212121',
      guibg = '#212121'
    },
    modified = {
      guifg = '#ffcb6b',
      -- guibg = '#000000'
    },
    modified_selected = {
      guifg = '#ffcb6b',
      guibg = '#212121'
    },
    modified_visible = {
      guifg = '#ffcb6b',
      guibg = '#212121'
    }
  }
})
