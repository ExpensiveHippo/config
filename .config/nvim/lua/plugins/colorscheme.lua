return {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('nordic').load {
            italic_comments = true,
            transparent = {
                bg = true,
                float = true,
            },
        }
    end
}
