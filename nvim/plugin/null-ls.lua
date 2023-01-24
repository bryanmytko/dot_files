local null_ls = require("null-ls")

local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

local sources = {
	formatting.prettierd,
	code_actions.eslint_d,
	diagnostics.eslint_d.with({ extra_filetypes = { "graphql" } }),
	diagnostics.rubocop,
}

local on_attach = function(client)
	if client.resolved_capabilities.document_formatting then
		vim.cmd([[
      augroup LspFormatting
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
      augroup END
    ]])
	end
end

null_ls.setup({
	sources = sources,
	on_attach = on_attach,
})
