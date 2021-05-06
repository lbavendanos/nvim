local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local fileinfo = require('galaxyline.provider_fileinfo')
local buffer = require('galaxyline.provider_buffer')
local vcs = require('galaxyline.provider_vcs')
local gls = gl.section

local colors = {
  bg = '#000000',
  fg = '#959DCB',
  black = '#000000',
  white = '#FFFFFF',
  orange = '#FFB86C',
  red = '#FF5555',
  yellow = '#F1FA8C',
  pink = '#FF79C6',
  purple = '#BD93F9',
  blue = '#82AAFF',
  green = '#50FA7B',
  cyan = '#8BE9FD',
  gray = '#212121'
}

local modes = {
  [110] = 'NORMAL',
  [105] = 'INSERT',
  [99] = 'COMMAND',
  [116] = 'TERMINAL',
  [118] = 'VISUAL',
  [22] = 'V-BLOCK',
  [86] = 'V-LINE',
  [82] = 'REPLACE',
  [115] = 'SELECT',
  [83] = 'S-LINE'
}

gl.short_line_list = {
  'NvimTree', 'vim-plug', 'help', 'defx', 'nerdtree', 'denite', 'vista',
  'vista_kind', 'dbui', 'magit', 'packer', 'fugitiveblame'
}

gls.left = {
  {
    StartIcon = {
      provider = function() return '   ' end,
      highlight = { colors.black, colors.green },
      separator = ' ',
      separator_highlight = { colors.black, colors.green }
    }
  }, {
    ViMode = {
      provider = function()
        local byte = vim.fn.mode():byte()
        local mode = modes[byte]

        return '  ' .. mode .. '  '
      end,
      highlight = { colors.bg, colors.blue, 'bold' }
    }
  }, {
    FileName = {
      provider = function()
        local current = fileinfo.get_current_file_name()
        local filename = (current == '' and '[No Name]' or current)

        filename = string.gsub(filename, '^%s*(.-)%s*$', '%1')

        return '  ' .. filename
      end,
      highlight = { colors.black, colors.cyan },
      separator = ' ',
      separator_highlight = { colors.black, colors.cyan }
    }
  }, {
    GitBranch = {
      provider = function()
        local branch = vcs.get_git_branch():gsub('%s+', '')

        return ' ' .. branch .. ' '
      end,
      condition = condition.check_git_workspace,
      highlight = { colors.black, colors.pink }
    }
  }, {
    LastSpace = {
      provider = function() return '' end,
      highlight = { colors.black, colors.gray }
    }
  }
}

gls.right = {
  {
    FileTypeName = {
      provider = function()
        local fileType = buffer.get_buffer_filetype()

        fileType = (fileType == '' and 'unknown' or fileType)

        return fileType:lower() .. ' '
      end,
      condition = condition.buffer_not_empty,
      highlight = { colors.black, colors.orange },
      separator = ' ',
      separator_highlight = { colors.black, colors.orange }
    }
  }, {
    FileInfo = {
      provider = function()
        local fileEncode = fileinfo.get_file_encode()
        local fileFormat = fileinfo.get_file_format()

        return ' ' .. fileEncode:lower() .. ' ' .. fileFormat:lower() .. ' '
      end,
      highlight = { colors.black, colors.cyan }
    }
  }, {
    LineInfo = {
      provider = function()
        local linePercent = fileinfo.current_line_percent()
        local lineColumn = fileinfo.line_column()

        return ' ' .. linePercent .. ' ' .. lineColumn .. ' '
      end,
      highlight = { colors.black, colors.purple }
    }
  }
}

gls.short_line_left = {
  {
    ShortBufferIcon = {
      provider = function()
        local icon = (buffer.get_buffer_type_icon() or '')

        return ' ' .. icon
      end,
      highlight = { colors.fg, colors.gray }
    }
  }, {
    ShortBufferName = {
      provider = fileinfo.get_current_file_name,
      highlight = { colors.fg, colors.gray }
    }
  }
}

gls.short_line_right = {
  {
    ShortFileInfo = {
      provider = function()
        local fileEncode = fileinfo.get_file_encode()
        local fileFormat = fileinfo.get_file_format()

        return ' ' .. fileEncode:lower() .. ' ' .. fileFormat:lower() .. ' '
      end,
      highlight = { colors.fg, colors.gray }
    }
  }, {
    ShortLineInfo = {
      provider = function()
        local linePercent = fileinfo.current_line_percent()
        local lineColumn = fileinfo.line_column()

        return ' ' .. linePercent .. ' ' .. lineColumn .. ' '
      end,
      highlight = { colors.fg, colors.gray }
    }
  }
}
