local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { "LazyVim/LazyVim", import = "lazyvim.plugins" }, -- standard LazyVim setup
        { import = "lazyvim.plugins.extras.linting.eslint" },
        { import = "lazyvim.plugins.extras.formatting.prettier" },
        {
            "neovim/nvim-lspconfig",
            opts = {
                servers = {
                    tsserver = {
                        settings = {
                            completions = { completeFunctionCalls = true },
                            implicitProjectConfiguration = {
                                checkJs = false,
                            },
                        },
                    },
                    eslint = {
                        settings = {
                            format = true,
                            run = "onSave",
                            workingDirectory = { mode = "auto" },
                        },
                    },
                },
            },
        },
        { import = "plugins" }, -- custom plugin overrides
    },
    defaults = {
        lazy = false, -- load custom plugins on startup
        version = false, -- use latest commit of plugins
    },
    install = { colorscheme = { "visual_studio_code" } }, -- colorschemes
    checker = { enabled = true, notify = false }, -- auto plugin updates
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "tarPlugin",
                "tohtml",
                "zipPlugin", -- remove unnecessary plugins
            },
        },
    },
})

-- tokyonight-night
vim.o.background = "dark"
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.cmd("set background=dark")
        vim.cmd("colorscheme tokyonight-night") -- Or your preferred dark theme
    end,
})

-- modus
-- require("modus-themes").setup({
--     -- Theme comes in two styles `modus_operandi` and `modus_vivendi`
--     -- `auto` will automatically set style based on background set with vim.o.background
--     style = "auto",
--     variant = "default", -- Theme comes in four variants `default`, `tinted`, `deuteranopia`, and `tritanopia`
--     transparent = false, -- Transparent background (as supported by the terminal)
--     dim_inactive = false, -- "non-current" windows are dimmed
--     hide_inactive_statusline = false, -- Hide statuslines on inactive windows. Works with the standard **StatusLine**, **LuaLine** and **mini.statusline**
--     line_nr_column_background = true, -- Distinct background colors in line number column. `false` will disable background color and fallback to Normal background
--     sign_column_background = true, -- Distinct background colors in sign column. `false` will disable background color and fallback to Normal background
--     styles = {
--         -- Style to be applied to different syntax groups
--         -- Value is any valid attr-list value for `:help nvim_set_hl`
--         comments = { italic = true },
--         keywords = { italic = true },
--         functions = {},
--         variables = {},
--     },
--
--     --- You can override specific color groups to use other groups or a hex color
--     --- Function will be called with a ColorScheme table
--     --- Refer to `extras/lua/modus_operandi.lua` or `extras/lua/modus_vivendi.lua` for the ColorScheme table
--     ---@param colors ColorScheme
--     on_colors = function(colors) end,
--
--     --- You can override specific highlights to use other groups or a hex color
--     --- Function will be called with a Highlights and ColorScheme table
--     --- Refer to `extras/lua/modus_operandi.lua` or `extras/lua/modus_vivendi.lua` for the Highlights and ColorScheme table
--     ---@param highlights Highlights
--     ---@param colors ColorScheme
--     on_highlights = function(highlights, colors) end,
-- })
--
-- -- vim.opt.background = "light"
-- vim.cmd("colorscheme modus")

-- visual_studio_code
-- require("visual_studio_code").setup({
--     -- `dark` or `light`
--     mode = "light",
--     -- Whether to load all color schemes
--     preset = true,
--     -- Whether to enable background transparency
--     transparent = false,
--     -- Whether to apply the adapted plugin
--     expands = {
--         hop = true,
--         dbui = true,
--         lazy = true,
--         aerial = true,
--         null_ls = true,
--         nvim_cmp = true,
--         gitsigns = true,
--         which_key = true,
--         nvim_tree = true,
--         lspconfig = true,
--         telescope = true,
--         bufferline = true,
--         nvim_navic = true,
--         nvim_notify = true,
--         vim_illuminate = true,
--         nvim_treesitter = true,
--         nvim_ts_rainbow = true,
--         nvim_scrollview = true,
--         nvim_ts_rainbow2 = true,
--         indent_blankline = true,
--         vim_visual_multi = true,
--     },
--     hooks = {
--         before = function(conf, colors, utils) end,
--         after = function(conf, colors, utils) end,
--     },
-- })
