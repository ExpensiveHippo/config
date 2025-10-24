return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require('gitsigns').setup{
            on_attach = function(bufnr)
                local gitsigns = require('gitsigns')

                local map = function(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

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

                local diff_prev = function()
                    gitsigns.diffthis('~')
                end

                local blame_all = function()
                    gitsigns.blame_line({ full = true })
                end

                local qf_all = function()
                    gitsigns.setqflist('all')
                end


                -- Navigation
                map('n', ']c', next_hunk)
                map('n', '[c', prev_hunk)

                -- Actions
                map('n', '<leader>hs', gitsigns.stage_hunk)
                map('n', '<leader>hr', gitsigns.reset_hunk)
                map('n', '<leader>hS', gitsigns.stage_buffer)
                map('n', '<leader>hR', gitsigns.reset_buffer)

                map('n', '<leader>hp', gitsigns.preview_hunk)
                map('n', '<leader>hi', gitsigns.preview_hunk_inline)

                map('n', '<leader>hb', blame_all)

                -- Compare with previous commit
                map('n', '<leader>hD', diff_prev)

                -- Compare with index
                map('n', '<leader>hd', gitsigns.diffthis)

                map('n', '<leader>hQ', qf_all)
                map('n', '<leader>hq', gitsigns.setqflist)

                map('n', '<leader>tw', gitsigns.toggle_word_diff)
                map('n', '<leader>tb', gitsigns.toggle_current_line_blame)

                -- viw but for hunks
                map({'o', 'x'}, 'ih', gitsigns.select_hunk)
            end
        }
    end
}
