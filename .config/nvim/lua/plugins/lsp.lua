return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        lazy = true,
        config = false,
        init = function()
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                "L3MON4D3/LuaSnip",
                dependencies = {
                    "saadparwaiz1/cmp_luasnip",
                    {
                        "r5n-dev/vscode-react-javascript-snippets",
                        build = "yarn install --frozen-lockfile && yarn compile"
                    }
                }
            }
        },
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_cmp()

            require('luasnip.loaders.from_vscode').lazy_load()

            local cmp = require("cmp")
            cmp.setup({
                sources = {
                    { name = "luasnip",  priority = 10 },
                    { name = "nvim_lsp", priority = 9 }
                },
                preselect = 'item',
                completion = {
                    completeopt = 'menu,menuone,noinsert'
                }
            })
        end
    },
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = true
    },
    {
        "neovim/nvim-lspconfig",
        cmd = { "LspInfo", "LspInstall", "LspStart" },
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/mason-lspconfig.nvim"
        },
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(_, bufnr)
                lsp_zero.default_keymaps({
                    buffer = bufnr,
                    exclude = { "f" }
                })
            end)

            require("mason-lspconfig").setup({
                handlers = {
                    lsp_zero.default_setup
                }
            })
        end
    },
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({ async = true, lsp_fallback = true, quiet = true })
                end
            }
        },
        opts = {
            formatters_by_ft = {
                javascript = { "prettierd", "prettier" },
                javascriptreact = { "prettierd", "prettier" },
                typescript = { "prettierd", "prettier" },
                typescriptreact = { "prettierd", "prettier" },
                vue = { "prettierd", "prettier" },
                css = { "prettierd", "prettier" },
                scss = { "prettierd", "prettier" },
                html = { "prettierd", "prettier" },
                json = { "prettierd", "prettier" },
                jsonc = { "prettierd", "prettier" },
                yaml = { "prettierd", "prettier" },
                markdown = { "prettierd", "prettier" },
                graphql = { "prettierd", "prettier" },
                astro = { "prettier" },
                svelte = { "prettier" },
                go = { "gopls" }

            },
            format_on_save = { timeout_ms = 3000, lsp_fallback = true, quiet = true }
        }
    }
}
