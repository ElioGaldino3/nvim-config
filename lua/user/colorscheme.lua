
require('hop').setup()

--require('transparent').setup({enable=true})


require('ayu').setup({
  overrides = {
    TSProperty = { fg = '#FFFFFF' },
    TSParameter = { fg = '#FFFFFF' },
    TSVariable = { fg = '#FFFFFF' },
    TSType = {  },
  }
})

require('onedark').setup {
  style = 'darker',
  highlights = {
    TSProperty = { fg = '#FFFFFF' },
    TSParameter = { fg = '#FFFFFF' },
    TSVariable = { fg = '#FFFFFF' },
    TSType = { fmt = 'bold' },
    TSFunction = { fb = '#9e0b5c'},
    TSNamedArgument = { fg = '#fcba03', fmt = 'bold,italic'}
  }
}

vim.cmd[[colorscheme onedark]]
