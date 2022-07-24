vim.cmd[[colorscheme ayu]]

require('hop').setup()

require('transparent').setup({enable=true})


require('ayu').setup({
  overrides = {
    TSProperty = { fg = '#FFFFFF' },
    TSVariable = { fg = '#FFFFFF' },
  }
})

