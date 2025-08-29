local keymap = vim.keymap

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "shift selected lines down in visual mode" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "shift selected lines up in visual mode" })

keymap.set("n", "<C-d>", "<C-d>zz", { desc = "jump down but centered" }) 
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "jump up but centered" }) 

keymap.set("n", "n", "nzzzv", { desc = "go to next search result but centered" })
keymap.set("n", "N", "Nzzzv", { desc = "go to previous search result but centered" })

keymap.set("v", "<", "<gv", { desc = "decrease indent and retain selection" })
keymap.set("v", ">", ">gv", { desc = "increase indent and retain selection" })

keymap.set("n", "x", '"_x', { desc = "delete character without copying it to clipboard" })











