local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({
			group = augroup,
			buffer = bufnr,
		})
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
		})
	end
end

local opts = {
	on_attach = on_attach,
	sources = {
		-- lua
		null_ls.builtins.formatting.stylua,

		-- go
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.code_actions.impl,
		null_ls.builtins.diagnostics.staticcheck,

		-- js/ts/web
		null_ls.builtins.formatting.prettierd.with({ extra_filetypes = { "svelte" } }),
	},
}

return opts
