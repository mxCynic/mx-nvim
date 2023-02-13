vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
        callback = function()
            vim.api.nvim_buf_set_keymap(
                0,
                "n",
                "<F8>",
                ":w<CR>:split<CR>:te time python %<CR>i",
                { silent = true, noremap = true }
            )
        end,
    })
vim.api.nvim_create_autocmd("FileType", {
        pattern = "c",
        callback = function()
            -- -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
            vim.api.nvim_buf_set_keymap(
                0,
                "n",
                "<F7>",
                "<ESC>:w<CR>:split<CR>:te gcc-12 -std=c11 -Wshadow -Wall -o %:t:r.out % -g  && time ./%:t:r.out<CR>i",
                { silent = true, noremap = true }
            )
            vim.api.nvim_buf_set_keymap(
                0,
                "n",
                "<f8>",
                "<esc>:w<cr>:split<cr>:te clang -std=c11 -wshadow -wall -o %:t:r.out % -g -fsanitize=address -fsanitize=undefined -d_glibcxx_debug && time ./%:t:r.out<cr>i",
                { silent = true, noremap = true }
            )
        end,
    })


