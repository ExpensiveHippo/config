return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    keys = {
        { "<leader>ft", "<cmd>NvimTreeFindFile<cr>", desc = "Find file in tree" },
        { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle tree" }
    },
    config = function()
        require("nvim-tree").setup {}
    end
}
