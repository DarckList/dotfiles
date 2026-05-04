vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
local state = {
  floating = {
    buf = -1,
    win = -1,
  }
}
local function create_floating_window(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)
  local col = (vim.o.columns - width) / 2
  local row = (vim.o.lines - height) / 2

  local win_config = {
    style = "minimal",
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    border = "rounded",
  }

  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end
  local win = vim.api.nvim_open_win(buf, true, win_config)
  return { buf = buf, win = win }
end

local togle_terminal = function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_floating_window { buf = state.floating.buf }
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      local preview_shell = vim.o.shell
      vim.o.shell = "pwsh.exe"
      vim.cmd.terminal()
      vim.o.shell = preview_shell
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end
vim.api.nvim_create_user_command("Floaterminal", togle_terminal, {})
vim.keymap.set({ "n", "t" }, "<space>tt", togle_terminal)
