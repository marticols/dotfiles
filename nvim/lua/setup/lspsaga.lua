local saga = require 'lspsaga'
saga.init_lsp_saga{
  error_sign = '',
  warn_sign = '',
  code_action_prompt = {
    enable = false,
  },
}
