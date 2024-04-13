local mini = require "mini.ai"
local mini_surround = require('mini_surround')
local statusline = require 'mini.statusline'

local opts = {

  -- Better Around/Inside textobjects
  -- 
  -- Examples:
  -- - va) - [V]isually select [A]round [)]parenthen
  -- - yinq - [Y]ank [I]nside [Next] [']quote
  -- - ci' - [C]hange [I]nside [']quote
  mini.setup {
    n_lines = 500,
  },

  -- Add/delete/replace surroundings (brackets, quotes, etc.)
  --
  -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren 
  -- - sd'   - [S]urround [D]elete [']quotes 
  -- - sr)'  - [S]urround [R]eplace [)] [']
  mini_surround.setup(),

  statusline.setup(),

}

return opts
