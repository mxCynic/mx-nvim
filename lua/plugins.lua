local packer = require("packer")
packer.startup({
    function(use)
        -- Packer 可以管理自己本身
        use("wbthomason/packer.nvim")
        -- 插件列表...
        --
        --tokyonight主题
        use("folke/tokyonight.nvim")
        --nvim-tree
        use({
            "nvim-tree/nvim-tree.lua",
            requires = {
                "nvim-tree/nvim-web-devicons", -- optional, for file icons
            },
            tag = "nightly", -- optional, updated every week. (see issue #1193)
        })
        --Nvim-web-devicons,该插件为每个图标提供相同的图标和 颜色。
        use("nvim-tree/nvim-web-devicons")
        -- bufferline 顶部tab栏插件
        use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
        -- lualine 底部标签栏插件
        use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
        use("arkav/lualine-lsp-progress")
        -- telescope 模糊搜索插件
        use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
        -- telescope的插件project
        use("ahmedkhalf/project.nvim")
        -- telescope extensions 插件的插件
        use("LinArcX/telescope-env.nvim")
        --dashboard
        use { 'glepnir/dashboard-nvim' }
        -- visual-multi多光标插件
        use({ "mg979/vim-visual-multi" })
        --nvim-autopairs自动补全括号插件
        use({
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup({})
            end,
        })
        --treesitter 语法高亮插件
        use({ "nvim-treesitter/nvim-treesitter", run = "TSUpdate" })
        --mason插件
        use({ "williamboman/mason.nvim" })
        use({ "williamboman/mason-lspconfig.nvim" })
        -- Lspconfig
        use({ "neovim/nvim-lspconfig" })
        -- 补全引擎
        use("hrsh7th/nvim-cmp")
        -- snippet 引擎
        use("hrsh7th/vim-vsnip")
        -- 补全源
        use("hrsh7th/cmp-vsnip")
        use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
        use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
        use("hrsh7th/cmp-path") -- { name = 'path' }
        use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

        -- 常见编程语言代码段
        use("rafamadriz/friendly-snippets")
        -- indent-blankline   tab对齐线
        use("lukas-reineke/indent-blankline.nvim")
        -- ui
        use("onsails/lspkind-nvim")
        use("tami5/lspsaga.nvim") --这两个是lsp的ui插件
        -- 代码格式化
        use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })

        --语法增强插件
        use("b0o/schemastore.nvim") -- JSON 增强

        --代码注释插件
        use({
            "numToStr/Comment.nvim",
            config = function()
                require("Comment").setup()
            end,
        })
        --sniprun编译运行插件
        use { 'michaelb/sniprun', run = 'bash ./install.sh'}
        --fugitive(git plugin)
        use{ 'tpope/vim-fugitive'}
        --noice
        use({
            "folke/noice.nvim",
            config = function()
                require("noice").setup({
                    -- add any options here
                })
            end,
            requires = {
                -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
                "MunifTanjim/nui.nvim",
                -- OPTIONAL:
                --   `nvim-notify` is only needed, if you want to use the notification view.
                --   If not available, we use `mini` as the fallback
                "rcarriga/nvim-notify",
            }
        })
    end,
    --以浮动窗口打开安装列表：
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    },
})

-- 每次保存 plugins.lua 自动安装插件
pcall(
    vim.cmd,
    [[
      augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerSync
      augroup end
    ]]
)
