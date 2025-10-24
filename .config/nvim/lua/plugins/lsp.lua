return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp"
        },

        config = function()

            -- Extend capabilities
            local lspconfig_defaults = require("lspconfig").util.default_config
            lspconfig_defaults.capabilities = vim.tbl_deep_extend(
                "force",
                lspconfig_defaults.capabilities,
                require("cmp_nvim_lsp").default_capabilities()
            )

            -- Set keymaps for LSPs
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local opts = { buffer = event.buf }
                    local keymap = vim.keymap

                    keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
                    keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
                    keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
                    keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
                    keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
                    keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
                    keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
                    keymap.set("n", "<leader>vd", "<cmd>lua vim.diagnostic.open_float()<cr>")
                    keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
                    keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
                    keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
                end
            })

            -- Set up LSPs
            require("mason").setup()
            require("mason-lspconfig").setup {
                ensure_installed = {
                    "lua_ls",
                    "pylsp"
                }
            }

            -- Set up handlers
            require("mason-lspconfig").setup {
                -- Default handler
                function(server_name)
                    require("lspconfig")[server_name].setup {}
                end
            }
        end
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip"
        },
        config = function()
            local cmp = require("cmp")
            local select_behaviour = { behavior = cmp.SelectBehavior.Insert }

            cmp.setup {
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                },
                mapping = cmp.mapping.preset.insert {
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping.select_next_item(select_behaviour),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(select_behaviour),
                }
            }
        end,
    }
}
