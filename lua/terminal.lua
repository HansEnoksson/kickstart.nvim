-- terminal.lua

local M = {}

-- Check the operating system and set the appropriate shell
function M.setup()
  -- Determine if we're on Windows
  local is_windows = vim.fn.has 'win32' == 1

  if is_windows then
    -- PowerShell configuration for Windows
    vim.o.shell = 'powershell'
    vim.o.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command'
    vim.o.shellquote = ''
    vim.o.shellxquote = ''

    -- If you want to set a terminal for :terminal command
    vim.g.terminal_preferred_shell = 'powershell'
  else
    -- Bash configuration for Linux
    -- Find the path to bash (could be in different locations)
    local possible_bash_paths = { '/usr/bin/bash', '/bin/bash' }
    local bash_path = ''

    for _, path in ipairs(possible_bash_paths) do
      if vim.fn.executable(path) == 1 then
        bash_path = path
        break
      end
    end

    if bash_path ~= '' then
      vim.o.shell = bash_path
    end

    -- If you want to set a terminal for :terminal command
    vim.g.terminal_preferred_shell = 'bash'
  end

  -- Return the detected shell
  return vim.o.shell
end

-- Add any additional terminal-related functions here
function M.get_shell_info()
  return {
    shell = vim.o.shell,
    is_windows = vim.fn.has 'win32' == 1,
    term_env = vim.fn.getenv 'TERM',
  }
end

return M
