return {
  "SmiteshP/nvim-navic",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    local navic = require("nvim-navic")
    local icons = require("dmacario.style.icons")
    navic.setup({
      icons = icons.kind_icons,
      lsp = {
        auto_attach = true,
        preference = nil,
      },
      highlight = true,
      separator = "  ",
      depth_limit = 0,
      depth_limit_indicator = "..",
      safe_output = true,
      lazy_update_context = false,
      click = false,
      format_text = function(text)
        return text
      end,
    })
  end,
}
