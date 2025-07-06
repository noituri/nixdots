return {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
        require('mini.comment').setup()
        require('mini.starter').setup({
            header = "░░░░░░░█▐▓▓░████▄▄▄█▀▄▓▓▓▌█\
░░░░░▄█▌▀▄▓▓▄▄▄▄▀▀▀▄▓▓▓▓▓▌█\
░░░▄█▀▀▄▓█▓▓▓▓▓▓▓▓▓▓▓▓▀░▓▌█\
░░█▀▄▓▓▓███▓▓▓███▓▓▓▄░░▄▓▐█▌\
░█▌▓▓▓▀▀▓▓▓▓███▓▓▓▓▓▓▓▄▀▓▓▐█\
▐█▐██▐░▄▓▓▓▓▓▀▄░▀▓▓▓▓▓▓▓▓▓▌█▌\
█▌███▓▓▓▓▓▓▓▓▐░░▄▓▓███▓▓▓▄▀▐█\
█▐█▓▀░░▀▓▓▓▓▓▓▓▓▓██████▓▓▓▓▐█\
▌▓▄▌▀░▀░▐▀█▄▓▓██████████▓▓▓▌█▌\
▌▓▓▓▄▄▀▀▓▓▓▀▓▓▓▓▓▓▓▓█▓█▓█▓▓▌█▌\
█▐▓▓▓▓▓▓▄▄▄▓▓▓▓▓▓█▓█▓█▓█▓▓▓▐█"
        })
        require('mini.surround').setup()
        require('mini.trailspace').setup()
        require('mini.pairs').setup()
        require('mini.move').setup()
        require('mini.diff').setup()
        local hipatterns = require('mini.hipatterns')
        hipatterns.setup({
            highlighters = {
                fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
                hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
                todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
                note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

                hex_color = hipatterns.gen_highlighter.hex_color(),},
            delay = {
                text_change = 200,
                scroll = 50,
            },
        })
    end
}
