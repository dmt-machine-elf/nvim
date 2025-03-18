-- tokyonight-night
return {
    {
        "folke/tokyonight.nvim",
        name = "tokyonight",
        priority = 1000, -- Ensure it loads before UI plugins
        config = function()
            require("tokyonight").setup({
                style = "night", -- **Force dark mode**
                transparent = false,
                terminal_colors = true,
                styles = {
                    comments = { italic = true },
                    keywords = { italic = false },
                    functions = { bold = true },
                    variables = {},
                },
            })
            vim.cmd("set background=dark") -- Ensure Neovim stays in dark mode
            vim.cmd("colorscheme tokyonight-night") -- Apply dark theme
        end,
    },
}

-- vscode light
-- return {
--     {
--         "Mofiqul/vscode.nvim",
--         name = "vscode",
--         priority = 1000, -- Load early to ensure it sets the colorscheme correctly
--         config = function()
--             require("vscode").setup({
--                 -- Enable transparent background
--                 transparent = false,
--
--                 -- Enable italic comments
--                 italic_comments = true,
--
--                 -- Custom colors
--                 color_overrides = {
--                     vscLineNumber = "#FFFFFF",
--                 },
--
--                 -- Custom group overrides
--                 group_overrides = {
--                     Cursor = { fg = "#ffffff", bg = "#ff0000", bold = true },
--                 },
--             })
--
--             -- Force Dark Mode if system is light mode
--             vim.o.background = "light"
--
--             -- Apply the colorscheme
--             vim.cmd("colorscheme vscode")
--         end,
--     },
-- }

-- oxocarbon
-- return {
--     "nyoom-engineering/oxocarbon.nvim",
-- }

-- return { { "miikanissi/modus-themes.nvim", priority = 1000 } }
-- return {
--     {
--         "askfiy/visual_studio_code",
--         priority = 100,
--         config = function()
--             vim.cmd([[colorscheme visual_studio_code]])
--         end,
--     },
-- }
