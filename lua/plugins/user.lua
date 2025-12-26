-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize dashboard options
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            "       =++++++=                                   ",
            "        ....:--*++=                               ",
            "          .......-**+-::::--:::-                  ",
            "         -:...::....=##+====-------+****+=-----=+ ",
            "          ::--=----::.=#%##****####*:.. .......:  ",
            "        ---=+===+++++=:-#%%%%%%#-.:::::::...:     ",
            "       :-=+++*#=+==+++*=+#####:-=====--=--::      ",
            "      :-+****-==.+@@.==*.****:*#=..:+*+===-::     ",
            "     :-=*###*+=  .....=*=*#*=*-=:=%*--=*+++=-     ",
            "     --*#####-+      :=+*##**:= ..:...=+**++-     ",
            "     :=+######=+-...=*#######=+      .=*****=:    ",
            "     :-=+##%%##########=:::+##+-:   ===*###*=:    ",
            "      :-=+*##%%%%#####-::=::+##############*=:    ",
            "       ::-==+*###%%%###+..:=*#############*=-:    ",
            "        ..::--==*######################*+=-::     ",
            "           .::::---=**###########**+===--::.      ",
            "               :::::::::-----------::::::         ",
            "                         -:::::.:                 ",
          }, "\n"),
        },
      },
    },
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"

      npairs.add_rules {
        Rule("${", "}", { "yaml", "sh", "bash", "zsh", "dockerfile" }):with_pair(cond.not_after_text "}"),
      }
    end,
  },
}
