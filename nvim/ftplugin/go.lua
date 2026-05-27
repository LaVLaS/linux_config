-- Disable the Golang official indentation guidelines
-- setlocal noexpandtab softtabstop=0 shiftwidth=0
vim.g.go_recommended_style = 0

-- I like tabs equal to 4 spaces
-- Use :retab to explicitly replace existing tabs with the value of shiftwidth
vim.o.shiftwidth = 4
vim.o.expandtab = true
