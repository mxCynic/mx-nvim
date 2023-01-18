--默认设置
require('basic')
--快捷键映射
require('keybindings')
--插件管理
require('plugins')
-- 主题设置
require('colorscheme')

--插件require
require('plugins-config.nvim-tree')--nvim-tree侧边文件栏
require('plugins-config.bufferLine')--bufferline 顶部标签页
require('plugins-config.luaLine')--luaLine 底部标签栏
require('plugins-config.telescope')--telescope 模糊搜索弹窗
require('plugins-config.dashboard')--dashboard vim启动设置
require('plugins-config.nvim-treesitter')--treesitter语法高亮

