return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require('gitsigns').setup{
            on_attach = function(bufnr)
                local gitsigns = require('gitsigns')
                local keymap = vim.keymap

                local next_hunk = function()
                    if vim.wo.diff then
                        vim.cmd.normal({']c', bang = true})
                    else
                        gitsigns.nav_hunk('next')
                    end
                end

                local prev_hunk = function()
                    if vim.wo.diff then
                        vim.cmd.normal({'[c', bang = true})
                    else
                        gitsigns.nav_hunk('prev')
                    end
                end

                local diff_previous = function()
                    gitsigns.diffthis('~')
                end

                local blame_all = function()
                    gitsigns.blame_line({ full = true })
                end

                local set_qf_list_all_buffers = function()
                    gitsigns.setqflist('all')
                end


                -- Navigation
                keymap.set('n', ']c', next_hunk)
                keymap.set('n', '[c', prev_hunk)

                -- Actions
                keymap.set('n', '<leader>hs', gitsigns.stage_hunk)
                keymap.set('n', '<leader>hr', gitsigns.reset_hunk)
                keymap.set('n', '<leader>hS', gitsigns.stage_buffer)
                keymap.set('n', '<leader>hR', gitsigns.reset_buffer)

                keymap.set('n', '<leader>hp', gitsigns.preview_hunk)
                keymap.set('n', '<leader>hi', gitsigns.preview_hunk_inline)

                keymap.set('n', '<leader>hb', blame_all)

                -- Compare with previous commit
                keymap.set('n', '<leader>hD', diff_previous)

                -- Compare with index
                keymap.set('n', '<leader>hd', gitsigns.diffthis)

                keymap.set('n', '<leader>hQ', set_qf_list_all_buffers)
                keymap.set('n', '<leader>hq', gitsigns.setqflist)

                keymap.set('n', '<leader>tw', gitsigns.toggle_word_diff)
                keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame)

                -- viw but for hunks
                keymap.set({'o', 'x'}, 'ih', gitsigns.select_hunk)
            end
        }
    end
}
