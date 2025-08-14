local status_ok, claude_code = pcall(require, "claude-code")
if not status_ok then
  return
end

claude_code.setup({
  -- You can add configuration options here if needed
  -- For example:
  -- command = "claude-code",
  -- keymaps = {
  --   toggle = "<leader>cc",
  -- }
})