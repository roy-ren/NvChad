local M = {
  "nvim-tree/nvim-tree.lua",
  opts = {
    git = {
      enable = true,
      ignore = false,
    },

    view = {
      adaptive_size = true,
      -- width = 100,
    },
    renderer = {
      highlight_git = true,
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },

        glyphs = {
          default = "󰈚",
          symlink = "",
          folder = {
            --    󰉖   
            default = "",
            empty = "",
            empty_open = "",
            -- empty_open = "",
            open = "",
            -- open = " ﱮ", 
            symlink = "",
            symlink_open = "",
            -- arrow_open = "",   
            arrow_open = "",
            -- arrow_closed = "",   
            arrow_closed = "",
          },
          git = {
            -- unstaged = "✗",﯇  
            unstaged = "✗",
            --   󰺧 ⌧ 
            staged = "",
            -- staged = "✓", 﫟﫠  󱪙
            -- unmerged = "",aa
            unmerged = "",
            -- renamed = "➜",
            renamed = "",
            -- untracked = "★",    
            untracked = "",
            -- deleted = "", 﫧󰺬  
            deleted = "",
            -- ignored = "◌",ﬆ
            ignored = "ﬆ",
          },
        },
      },
    },
  },
  config = function(_, opts)
    require("nvim-tree").setup(opts)
  end,
}

return M
