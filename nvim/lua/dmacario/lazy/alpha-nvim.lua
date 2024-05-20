-- return{
--     'goolord/alpha-nvim',
--     dependencies = { 'nvim-tree/nvim-web-devicons' },
--     config = function ()
--         require'alpha'.setup(require'alpha.themes.dashboard'.config)
--     end
-- };
return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    local logo = {
      [[                                                                                                   ]],
      [[ /\\\\\_____/\\\_______________________________/\\\________/\\\___________________________         ]],
      [[ \/\\\\\\___\/\\\______________________________\/\\\_______\/\\\__________________________         ]],
      [[ _\/\\\/\\\__\/\\\______________________________\//\\\______/\\\___/\\\_____________________       ]],
      [[  _\/\\\//\\\_\/\\\_____/\\\\\\\\______/\\\\\_____\//\\\____/\\\___\///_____/\\\\\__/\\\\\__       ]],
      [[   _\/\\\\//\\\\/\\\___/\\\/////\\\___/\\\///\\\____\//\\\__/\\\_____/\\\__/\\\///\\\\\///\\\_     ]],
      [[    _\/\\\_\//\\\/\\\__/\\\\\\\\\\\___/\\\__\//\\\____\//\\\/\\\_____\/\\\_\/\\\_\//\\\__\/\\\     ]],
      [[     _\/\\\__\//\\\\\\_\//\\///////___\//\\\__/\\\______\//\\\\\______\/\\\_\/\\\__\/\\\__\/\\\_   ]],
      [[      _\/\\\___\//\\\\\__\//\\\\\\\\\\__\///\\\\\/________\//\\\_______\/\\\_\/\\\__\/\\\__\/\\\   ]],
      [[       _\///_____\/////____\//////////_____\/////___________\///________\///__\///___\///___\///__ ]],
      [[                                                                                                   ]],
    }
    dashboard.section.header.val = logo

		dashboard.section.buttons.val = {
			dashboard.button('i', '    new file', ':ene <BAR> startinsert<CR>'),
			dashboard.button('o', '    old files', ':Telescope oldfiles<CR>'),
			dashboard.button('f', '󰥨    find file', ':Telescope find_files<CR>'),
			dashboard.button('t', '󰱼    find text', ':Telescope live_grep<CR>'),
			dashboard.button('g', '    find git files', ':Telescope git_files<CR>'),
			dashboard.button('l', '󰒲    lazy', ':Lazy<CR>'),
			dashboard.button('m', '󱌣    mason', ':Mason<CR>'),
			-- dashboard.button('p', '󰄉    profile', ':Lazy profile<CR>'),
			dashboard.button('q', '󰭿    quit', ':qa<CR>'),
		}
        dashboard.section.footer.opts.hl = "Type"
        -- dashboard.section.header.opts.hl = "AlphaHeader"
        dashboard.section.header.opts.hl = "Include"
        dashboard.section.buttons.opts.hl = "Keyword"
        dashboard.opts.layout[1].val = 6
        return dashboard
    end,
    config = function(_, dashboard)
        require("alpha").setup(dashboard.opts)
        vim.api.nvim_create_autocmd("User", {
            callback = function()
                local stats = require("lazy").stats()
                local ms = math.floor(stats.startuptime * 100) / 100
                dashboard.section.footer.val = "󱐌 Lazy-loaded "
                    .. stats.loaded
                    .. "/"
                    .. stats.count
                    .. " plugins in "
                    .. ms
                    .. "ms"
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
    end,
}

