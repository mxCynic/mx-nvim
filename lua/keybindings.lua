vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }
---------------------普通模式n------------------------
-- windows 分屏快捷键
map("n", "sh", ":sp<CR>", opt)
map("n", "sv", ":vsp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- Shift + hjkl  窗口之间跳转
map("n", "<S-h>", "<C-w>h", opt)
map("n", "<S-j>", "<C-w>j", opt)
map("n", "<S-k>", "<C-w>k", opt)
map("n", "<S-l>", "<C-w>l", opt)
-- ctrl + s 保存
map("n", "<C-s>", ":w<CR>", opt)
-- 新建关闭tab操作
map("n", "<leader>tc", ":tabclose<CR>", opt)
map("n", "<leader>to", ":tabonly<CR>", opt)
map("n", "<leader>tn", ":tabnew<CR>", opt)
-- 左右tab切换
map("n", "<A-h>", ":tabNext<CR>", opt)
map("n", "<A-l>", ":tabnext<CR>", opt)

--
---------------------插入模式i-------------------------
--快速jk映射为esc
map("i", "jk", "<Esc>", opt)
--
--
---------------------视觉模式v------------------------
--快速jk映射为esc
map("v", "jk", "<Esc>", opt)
-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)
--
--
--------------------命令行模式v------------------------
--
--
-- 插件快捷键
local pluginKeys = {}
-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
    -- 打开文件或文件夹
    { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
    -- 分屏打开文件
    { key = "v", action = "vsplit" },
    { key = "h", action = "split" },
    -- 显示隐藏文件
    { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
    { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
    -- 文件操作
    { key = "<F5>", action = "refresh" },
    { key = "a", action = "create" },
    { key = "d", action = "remove" },
    { key = "r", action = "rename" },
    { key = "x", action = "cut" },
    { key = "c", action = "copy" },
    { key = "p", action = "paste" },
    { key = "s", action = "system_open" },
}

-- Telescope
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
    i = {
        -- 上下移动
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<Down>"] = "move_selection_next",
        ["<Up>"] = "move_selection_previous",
        -- 历史记录
        ["<C-n>"] = "cycle_history_next",
        ["<C-p>"] = "cycle_history_prev",
        -- 关闭窗口
        ["jk"] = "close",
        -- 预览窗口上下滚动
        ["<C-u>"] = "preview_scrolling_up",
        ["<C-d>"] = "preview_scrolling_down",
    },
}

-- bufferline
-- 左右buffer切换
map("n", "<A-j>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<A-k>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
    -- rename
    mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
    -- code action
    mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
    -- go xx
    mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
    mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
    mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
    mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
    -- diagnostic
    mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
    mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
    mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
    mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
    -- 没用到
    -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
    -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
    -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
    -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- nvim-cmp 自动补全

pluginKeys.cmp = function(cmp)
    return {
        -- 出现补全
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        -- 取消
        ["<A-/>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        -- 上一个
        ["<A-k>"] = cmp.mapping.select_prev_item(),
        -- 下一个
        ["<A-j>"] = cmp.mapping.select_next_item(),
        -- 确认
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
        }),
        -- 如果窗口内容太多，可以滚动
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    }
end

--commet注释插件的快捷键设置
pluginKeys.comment = {
    --Normal 模式快捷键
    toggler = {
        line = "gcc", -- 行注释
        block = "gbc", -- 块注释
    },
    --Visual 模式
    opleader = {
        line = "gc",
        bock = "gb",
    },
}

--sniprun快捷键设置
map("v", "<leader>s", ":SnipRun<CR>", opt)

-- markdown插入图片快捷键
--map("n", "<C-v>", ":call mdip#MarkdownClipboardImage()<CR>", opt)
vim.cmd[[
    autocmd FileType markdown nnoremap <buffer> <leader>i :call mdip#MarkdownClipboardImage()<CR>
]]




return pluginKeys
