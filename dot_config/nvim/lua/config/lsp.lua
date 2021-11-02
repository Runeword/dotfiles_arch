local function setup()
	-------------------- neovim/nvim-lspconfig
	-- Use an on_attach function to only map the following keys
	-- after the language server attaches to the current buffer
	local function on_attach(client, buffer)
		local keymaps = {
			{ "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>" },
			{ "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>" },
			{ "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>" },
			{ "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>" },
			{ "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>" },
			{ "n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>" },
			{ "n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>" },
			{ "n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>" },
			{ "n", "<leader>wd", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>" },
			{ "n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>" },
			{
				"n",
				"<leader>f",
				"<cmd>lua vim.lsp.buf.formatting_seq_sync(nil, nil, { 'tsserver', 'html', 'cssls', 'volar', 'eslint' })<CR>",
				-- "<cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>",
			},
			{ "n", "<C-up>", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>" },
			{ "n", "<C-down>", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>" },
			{ "n", "<s-k>", "<cmd>lua vim.lsp.buf.hover()<CR>" },
			{ "n", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
			-- { "n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>" },
			-- { "n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>" },
		}

		local opts = { noremap = true, silent = true }

		for _, keymap in ipairs(keymaps) do
			vim.api.nvim_buf_set_keymap(buffer, keymap[1], keymap[2], keymap[3], opts)
		end

		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			-- update_in_insert = true,
			virtual_text = {
				source = "always",
				prefix = "",
			},
		})

		local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

		for type, icon in pairs(signs) do
			local hl = "LspDiagnosticsSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl })
		end
	end

	local function on_attach_eslint(client, buffer)
		-- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
		-- the resolved capabilities of the eslint server ourselves!
		client.resolved_capabilities.document_formatting = true
		on_attach(client, buffer)
	end

	-------------------- williamboman/nvim-lsp-installer
	require("nvim-lsp-installer").on_server_ready(function(server)
		local opts = {}
		opts.on_attach = on_attach
		opts.flags = { debounce_text_changes = 0 }

		-- (optional) Customize the options passed to the server
		-- if server.name == "tsserver" then
		--     opts.root_dir = function() ... end
		-- end

		if server.name == "eslint" then
			opts.on_attach = on_attach_eslint
			opts.settings = { format = { enable = true } }
		end

		-- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
		server:setup(require("coq").lsp_ensure_capabilities(opts))
		vim.cmd([[ do User LspAttachBuffers ]])
	end)
end

return { setup = setup }
