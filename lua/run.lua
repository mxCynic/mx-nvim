vim.cmd[[
"一键运行代码
    autocmd FileType python nnoremap <buffer> <F7> :w !python<CR>
    autocmd FileType c nnoremap <buffer> <F7> :w !gcc<CR>
]]
