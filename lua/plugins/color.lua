return {
  "rose-pine/nvim",
  name = "rose-pine",
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      variant = "moon",
      dark_variant = "moon",
      styles = {
        italic = false,
        bold = true,
        transparent = false,
        disable_background = true,
        disable_float_background = true,
      },
    })
    vim.cmd.colorscheme("rose-pine")
  end,
}
