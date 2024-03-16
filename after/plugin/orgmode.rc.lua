local status, orgmode = pcall(require, 'orgmode')
if (not status) then return end

orgmode.setup_ts_grammar()

orgmode.setup {
  org_todo_keywords = { 'TODO', '|', 'DONE' },
  org_priority_highest = 'a',
  org_priority_default = 'b',
  org_priority_lowest = 'c',
  org_default_notes_file = '~/org/refile.org',
  org_hide_leading_stars = true,
  -- win_split_mode = 'vsplit',
  -- open org mode in new window
  win_split_mode = function(name)
    local bufnr = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_name(bufnr, name)
    local fill = 0.8
    local width = math.floor((vim.o.columns * fill))
    local height = math.floor((vim.o.lines * fill))
    local row = math.floor((((vim.o.lines - height) / 2) - 1))
    local col = math.floor(((vim.o.columns - width) / 2))
    vim.api.nvim_open_win(bufnr, true, {
      relative = "editor",
      width = width,
      height = height,
      row = row,
      col = col,
      style = "minimal",
      border = "rounded"
    })
  end,

  notifications = {
    enabled = false,
    cron_enabled = true,
    repeater_reminder_time = false,
    deadline_warning_reminder_time = 0,
    reminder_time = 10,
    deadline_reminder = true,
    scheduled_reminder = true,
  },
}
