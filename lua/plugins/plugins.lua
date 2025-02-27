return {
        { "romgrk/barbar.nvim", requires = { "nvim-web-devicons" } },
        {
                "projekt0n/github-nvim-theme",
                config = function()
                        require("github-theme").setup({})
                        vim.cmd("colorscheme github_light")
                end,
        },
}
