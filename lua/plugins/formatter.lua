-- golines shortens long lines
return {
    "stevearc/conform.nvim",
    opts = function(_, opts)
        -- ✅ Set `golines` as the only Go formatter
        opts.formatters_by_ft = opts.formatters_by_ft or {}
        opts.formatters_by_ft.go = { "golines", "goimports" }

        -- ✅ Ensure `golines` uses `gofmt` internally
        opts.formatters = opts.formatters or {}
        opts.formatters.golines = {
            command = "golines",
            args = { "--max-len=100", "--base-formatter=gofmt" },
            stdin = true,
            exit_codes = { 0, 1 }, -- ✅ Suppress warnings when successful
        }
    end,
}
