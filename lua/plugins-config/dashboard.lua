local status, dashboard = pcall(require, 'dashboard')
if not status then
    vim.notify("没有找到 dashboard")
end

dashboard.custom_footer = {
    "",
    "",
    "https://mx1545814.github.io/"
}

dashboard.custom_center = {
    {
     icon = "  ",
     desc = "Projects                  ",
     action = "Telescope Projects",
    },
    {
     icon = "  ",
     desc = "Recent files              ",
     action = "Telescope oldfiles",
    },
    {
     icon = "  ",
     desc = "Edit Keybindings          ",
     action = "edit ~/.config/nvim/lua/keybindings.lua",
    },
    {
    icon = "  ",
    desc = "Edit Projects              ",
    action = "edit ~/.local/share/nvim/project_nvim/project_history",
    },
    {
     icon = "  ",
     desc = "quit!                     ",
     action = "q",
    },

}

dashboard.custom_header = {
    
      '             ▄▄▀▀▀▀▀▀▀▀▄▄              ',
      '          ▄▀▀            ▀▄▄           ',
      '        ▄▀                  ▀▄         ',
      '       ▌             ▀▄       ▀▀▄      ',
      '      ▌                ▀▌        ▌     ',
      '     ▐                  ▌        ▐     ',
      '     ▌▐    ▐    ▐       ▌         ▌    ',
      '    ▐ ▌    ▌  ▐ ▌      ▐       ▌▐ ▐    ',
      '    ▐ ▌    ▌▄▄▀▀▌▌     ▐▀▌▀▌▄  ▐ ▌ ▌   ',
      '     ▌▌    ▐▀▄▌▌▐▐    ▐▐▐ ▐ ▌▌ ▐ ▌▄▐   ',
      '   ▄▀▄▐    ▌▌▄▀▄▐ ▌▌ ▐ ▌▄▀▄ ▐  ▐ ▌ ▀▄  ',
      '  ▀▄▀  ▌  ▄▀ ▌█▐  ▐▐▀   ▌█▐ ▀▄▐ ▌▌   ▀ ',
      '   ▀▀▄▄▐ ▀▄▀ ▀▄▀        ▀▄▀▄▀ ▌ ▐      ',
      '      ▀▐▀▄ ▀▄        ▐      ▀▌▐        ',
      '        ▌ ▌▐ ▀              ▐ ▐        ',
      '        ▐ ▐ ▌    ▄▄▀▀▀▀▄    ▌ ▐        ',
      '         ▌▐ ▐▄   ▐     ▌  ▄▀  ▐        ',
      '        ▐  ▌▐▐▀▄  ▀▄▄▄▀ ▄▀▐   ▐        ',
      '        ▌▌ ▌▐ ▌ ▀▄▄    ▄▌▐ ▌  ▐        ',
      '       ▐ ▐ ▐▐ ▌    ▀▀▄▀▌▐  ▌  ▌        ',
      '       ▌  ▌▐ ▌        ▐▀▄▌ ▐           ',
}
