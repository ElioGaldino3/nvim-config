
require('hop').setup()

--require('transparent').setup({enable=true})


require('ayu').setup({
  overrides = {
    TSProperty = { fg = '#FFFFFF' },
    TSParameter = { fg = '#FFFFFF' },
    TSVariable = { fg = '#FFFFFF' },
  }
})

require('onedark').setup {
  style = 'darker',
  colors = {
    purple = "#b54799",
    properties = '#FFFFFF',
    string = '#02f574',
    typeColor = '#d14141',
    functionColor = '#00ffdd',
    argument = '#fcba03',
    bg = '#090a0c',
    bg1 = '#0c0e10',
  },
  highlights = {
    TSProperty = { fg = '$properties' },
    TSParameter = { fg = '$properties' },
    TSVariable = { fg = '$properties' },
    TSType = { fg = '$typeColor', fmt = 'bold' },
    TSTypeBuiltin = { fg = '$typeColor', fmt = 'bold' },
    TSFunction = { fg = '$functionColor'},
    TSNamedArgument = { fg = '$argument', fmt = 'bold,italic'},
    TSVoidType = { fg = '#1f2329'},
    TSInclude = { fg = '$purple'},
    TSKeyword = { fg = '$purple'},
    TSString = { fg = '$string'},
    DapBreakpoint = { fg = '#f72843'},
    DapLogPoint = { fg = '#008cff'},
    DapStopped = { fg = '#7bff1c'},
    Normal = {bg = '$bg'},
    Terminal = {bg = '$bg'},
    EndOfBuffer = {bg = '$bg'},
    SignColumn = {bg = '$bg'},
    CursorLine = {bg = '$bg1'},
  }
}
vim.cmd[[colorscheme onedark]]
