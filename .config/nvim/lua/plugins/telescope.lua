return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',

    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },

    opts = {
        pickers = {
            find_files = {
                hidden = true
            }
        },
        extensions = {
            fzf = {}
        }
    },

    config = function(_, opts)
        require("telescope").setup(opts)
        require("telescope").load_extension("fzf")
    end,


    keys = {
        { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find help" },
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
        { "<leader>fc",
            function()
                require("telescope.builtin").find_files { cwd = "~/.config/" }
            end,
            desc = "Find config files"
        },
        { "<leader>lg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" }
    }
}


