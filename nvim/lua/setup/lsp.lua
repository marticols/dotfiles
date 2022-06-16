-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'dartls' }
local lspconfig = require'lspconfig'
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end


-- Custom setups
get_jedi_cmd = function()
  -- Build the image with github.com/marticols/nvim_lsp_dockerfiles
  working_dir = vim.fn.getcwd()
  python_path = working_dir
  tag = "jedi_lsp"
  if working_dir == '/Users/marticols/Projects/to_do' then
    python_path = working_dir .. "/app"
    tag = "to_do_lsp"
  end
  return {
    "docker",
    "run",
    "-i",
    "--rm",
    "--env",
    "PYTHONPATH=" .. python_path,
    "--workdir=" .. working_dir,
    "--volume=" .. working_dir .. ":" .. working_dir,
    tag
  }
end

lspconfig.jedi_language_server.setup{
  cmd = get_jedi_cmd(),
}

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
