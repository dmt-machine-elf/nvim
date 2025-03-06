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
                                checkJs = true,
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
    install = { colorscheme = { "tokyonight-night" } }, -- colorschemes
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

vim.o.background = "dark"
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.cmd("set background=dark")
        vim.cmd("colorscheme tokyonight-night") -- Or your preferred dark theme
    end,
})
