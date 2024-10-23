vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP keybindings',
    callback = function(event)
        local opts = {buffer = event.buf}

        vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
        end, opts)
        vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover()
        end, opts)
        vim.keymap.set("n", "<leader>vws", function()
            vim.lsp.buf.workspace_symbol()
        end, opts)
        vim.keymap.set("n", "<leader>vd", function()
            vim.diagnostic.open_float()
        end, opts)
        vim.keymap.set("n", "[d", function()
            vim.diagnostic.goto_next()
        end, opts)
        vim.keymap.set("n", "]d", function()
            vim.diagnostic.goto_prev()
        end, opts)
        vim.keymap.set("n", "<leader>vca", function()
            vim.lsp.buf.code_action()
        end, opts)
        vim.keymap.set("n", "<leader>vrr", function()
            vim.lsp.buf.references()
        end, opts)
        vim.keymap.set("n", "<leader>vrn", function()
            vim.lsp.buf.rename()
        end, opts)
        vim.keymap.set("i", "<C-h>", function()
            vim.lsp.buf.signature_help()
        end, opts)
    end
})

local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'clangd',
        'gopls',
        'eslint@4.5.0',
        'ts_ls',
        'lua_ls',
    },
    handlers = {
        function(server)
            lspconfig[server].setup({
                capabilities = lsp_capabilities,
            })
        end,
        lua_ls = function()
            lspconfig.lua_ls.setup({
                capabilities = lsp_capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            globals = {'vim'}
                        },
                        workspace = {
                            library = {
                                vim.env.VIMRUNTIME,
                            }
                        }
                    }
                }
            })
        end
    }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

--- loads custom snippets from friendly-snippets
-- require('luasnip.loaders.from_vscode').lazy_load()

local icons = {
    Text = "",
    Variable = "󰓻",
    Snippet = "",
    Function = "󰊕",
    Keyword = "",
    Field = "",
    Constant = "",
    Interface = "",
    Struct = "",
    Module = "",
}

cmp.setup({
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'nvim_lua'},
        -- {name = 'buffer', keyword_length = 3},
        -- {name = 'luasnip', keyword_length = 2},
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-w>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
    }),
    window = {
        completion = cmp.config.window.bordered({
            --border = { "◜", "─", "◝", "│", "◞", "─", "◟", "│" },
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,Search:None",
            col_offset = -3,
            side_padding = 0,
        }),
        documentation = cmp.config.window.bordered({
            --border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,Search:None",
            max_width = 40,
            max_height = 20,
        }),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(_, vim_item)
            vim_item.kind = (icons[vim_item.kind] or "Foo") .. " " .. vim_item.kind
            vim_item.menu = ""

            if vim_item.abbr and #vim_item.abbr > 10 then
                local max_length = 30
                if #vim_item.abbr > max_length then
                    vim_item.abbr = vim_item.abbr:sub(1, max_length - 3) .. "..."
                end
            end

            return vim_item
        end,
    },
})
