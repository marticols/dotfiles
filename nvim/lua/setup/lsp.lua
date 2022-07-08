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

get_pylsp_tag = function()
  workdir = vim.fn.getcwd()
  tag = "pylsp_lsp"
  if workdir == '/Users/marticols/Projects/to_do' then
    tag = "to_do_lsp"
  end
  return tag
end

get_pylsp_pythonpath = function()
  workdir = vim.fn.getcwd()
  pythonpath = workdir
  if workdir == '/Users/marticols/Projects/to_do' then
    pythonpath = workdir .. "/app"
  end
  return pythonpath
end

-- Custom setups
get_pylsp_cmd = function()
  return {
    "docker",
    "run",
    "-i",
    "--rm",
    "--env",
    "PYTHONPATH=" .. get_pylsp_pythonpath(),
    "--workdir=" .. workdir,
    "--volume=" .. workdir .. ":" .. workdir,
    get_pylsp_tag()
  }
end

lspconfig.pylsp.setup{
  cmd = get_pylsp_cmd(),
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
