local status_ok, claude_code = pcall(require, "claude-code")
if not status_ok then
  return
end

claude_code.setup({
  window = {
    split_ratio = 0.35,           -- 35% width for the sidebar
    position = "rightbelow vertical", -- vertical split on the right
  },
})
