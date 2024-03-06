local M = {}

-------------------------------------- globals -----------------------------------------
M.setup = function()
  ---@diagnostic disable-next-line: undefined-global
  local g = vim.g

  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  -- g.neovide_transparency = 0.7
  -- g.transparency = 0.7
  -- -- Helper function for transparency formatting
  -- local alpha = function()
  --   return string.format("%x", math.floor(255 * (g.transparency or 0.8)))
  -- end
  -- g.neovide_background_color = "#0f1117" .. alpha()
  g.neovide_floating_blur_amount_x = 25.0
  g.neovide_floating_blur_amount_y = 25.0
  g.neovide_scroll_animation_length = 0.3
  g.neovide_hide_mouse_when_typing = true

  -- g.neovide_theme = "auto"

  g.neovide_refresh_rate = 60
  g.neovide_refresh_rate_idle = 5
  g.neovide_confirm_quit = true
  -- g.neovide_fullscreen = true
  g.neovide_remember_window_size = true
  -- g.neovide_profiler = true
  g.neovide_input_macos_alt_is_meta = true
  g.neovide_cursor_antialiasing = true
  g.neovide_cursor_animate_in_insert_mode = true
  g.neovide_cursor_animate_command_line = true
  g.neovide_cursor_unfocused_outline_width = 0.125
  g.neovide_cursor_vfx_mode = "pixiedust"

  -- Cursor
  g.neovide_cursor_animation_length = 0.05
  g.neovide_cursor_trail_size = 0.2
end

return M
