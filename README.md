# Bakavim

Bakavim is a NeoVim config I built from scratch to fit my coding style.

## Plugins

This config include several essentials plugins to make this feel like a true PDE (Personal Development Environment).

## Features

- ColorScheme (rose-pine)
- FuzzyFinder (Telescope + Harpoon)
- Treesitter (Auto install languages)
- LspConfiguration (Lsp for Lua, Javascript, Go, html...)
- Linters and formatters (null-ls)
- Autocompletion

### Telescope

```lua
return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<C-p>", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
        },
}
```

### Treesitter

```lua
return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            auto_install = true,
            ensure_installed = { "lua", "javascript" },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
```

### Lsp Config

```lua
return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			-- Lua language server setting up
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			-- Typescript/Javascript language server setting up
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})

			-- Html language server setting up
			lspconfig.html.setup({
				capabilities = capabilities,
			})

			-- Go language server setting up
			lspconfig.gopls.setup({
				capabilities = capabilities,
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
						gofumpt = true, -- Stricter formatting
					},
				},
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
```
### Null-ls

```lua
return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.diagnostics.staticcheck,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
```

## Authors

- [@bakabruh](https://www.github.com/bakabruh)


