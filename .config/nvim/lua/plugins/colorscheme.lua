return {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()

        require('nordic').setup {
            on_highlight = function(highlights, palette)
                highlights.LineNr = {
                    fg = palette.blue0,
                }
                highlights.CursorLineNr = {
                    fg = palette.blue1,
                    bold = true,
                }
            end,
            italic_comments = true,
            transparent = {
                bg = true,
                float = true,
            },
        }

        require('nordic').load()
    end
}
