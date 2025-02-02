-----                                                -----
----                                                  ----
---                   NVim LSP Config                  ---
--                                                      --
--    nvim-lspconfig is a "data only" repo, providing   --
--  basic, default Nvim LSP client configurations for   --
--  various LSP servers.                                --
--                                                      --
----------------------------------------------------------
--       https://github.com/neovim/nvim-lspconfig       --
----------------------------------------------------------

local nvim_lspconfig = {'neovim/nvim-lspconfig', version='v1.*'}
local user = {}

nvim_lspconfig.dependencies =  {
  {'hrsh7th/cmp-nvim-lsp'},
}

nvim_lspconfig.cmd = {'LspInfo', 'LspInstall', 'LspUnInstall'}

nvim_lspconfig.event = {'BufReadPre', 'BufNewFile'}

-----                           -----
--- LSP related UI Configurations ---
-----                           -----
function nvim_lspconfig.init()
  local sign = function(opts)
    -- See :help sign_define()
    vim.fn.sign_define(opts.name, {
      texthl = opts.name,
      text = opts.text,
      numhl = ''
    })
  end

  -- Diagnostic signs
  sign({name = 'DiagnosticSignError', text = '✘'})
  sign({name = 'DiagnosticSignWarn', text = '▲'})
  sign({name = 'DiagnosticSignHint', text = '⚑'})
  sign({name = 'DiagnosticSignInfo', text = '»'})

  -- See :help vim.diagnostic.config()
  vim.diagnostic.config({
    -- virtual_text = false,
    virtual_text = {
        prefix = "●", -- Could be '■', '▎', 'x'
    },
    severity_sort = true,
    signs = true,
    float = {
      border = 'rounded',
    },
  })

  -- Configure LSP textDocuments
  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    {border = 'rounded'}
  )

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    {border = 'rounded'}
  )
end

function nvim_lspconfig.config()
  local group = vim.api.nvim_create_augroup('lsp_cmds', {clear = true})

  vim.api.nvim_create_autocmd('LspAttach', {
    group = group,
    desc = 'LSP actions',
    callback = user.on_attach
  })

end

function user.on_attach()
  local bufmap = function(mode, lhs, rhs)
    local opts = {buffer = true}
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  -- You can search each function in the help page.
  -- For example :help vim.lsp.buf.hover()

  bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
  bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
  bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
  bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
  bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
end

return nvim_lspconfig

