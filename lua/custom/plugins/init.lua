-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'seblyng/roslyn.nvim',
    ft = 'cs',
    opts = {
      -- Plugin will automatically find the Mason-installed binary
    },
  },
  -- Obsidian plugin
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = 'markdown',
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',
    },
    opts = {
      workspaces = {
        {
          name = 'work',
          -- Windows path
          -- path = '~/Documents/Obsidian-Vault/',
          -- Linux path
          path = '~/Dokument/Obsidian-Vault/',
        },
      },
      ui = { enable = false },
    },
  },

  -- Markview Previewer
  {
    'OXY2DEV/markview.nvim',
    lazy = false,
    dependencies = {
      'saghen/blink.cmp',
    },
  },

  -- Oil file manager
  {
    'stevearc/oil.nvim',
    lazy = false,
    event = 'VimEnter',
    cmd = { 'Oil' },
    config = function()
      require('oil').setup {
        -- Oil configuration remains the same...
        default_file_explorer = true,
        columns = {
          'icon',
          -- "permissions",
          -- "size",
          -- "mtime",
        },
        view_options = {
          -- Show files and directories that start with "."
          show_hidden = true,
          -- This function defines what is considered a "hidden" file
          is_hidden_file = function(name, bufnr)
            local m = name:match '^%.'
            return m ~= nil
          end,
          -- This function defines what will never be shown, even when `show_hidden` is set
          is_always_hidden = function(name, bufnr)
            return false
          end,
          -- Sort file names with numbers in a more intuitive order for humans.
          -- Can be "fast", true, or false. "fast" will turn it off for large directories.
          natural_order = 'fast',
          -- Sort file and directory names case insensitive
          case_insensitive = false,
          sort = {
            -- sort order can be "asc" or "desc"
            -- see :help oil-columns to see which columns are sortable
            { 'type', 'asc' },
            { 'name', 'asc' },
          },
          -- Customize the highlight group for the file name
          highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
            return nil
          end,
        },
      }

      -- Explicitly set up the keybinding here to ensure it works
      vim.keymap.set('n', '<leader>o', '<cmd>Oil<cr>', { desc = 'Open Oil' })
    end,
    keys = {
      { '<leader>o', '<cmd>Oil<cr>', desc = 'Open Oil' },
    },
  },

  -- Vim-rooter equivalent
  {
    'airblade/vim-rooter',
    config = function()
      vim.g.rooter_patterns = {
        '.git',
        '.git/',
        '_darcs/',
        '.hg/',
        '.bzr/',
        '.svn/',
        'Makefile',
        'package.json',
        '*.sln',
        '*.csproj',
        'global.json',
        'Program.cs',
        '*.md',
      }
    end,
  },

  {
    'luckasRanarison/tailwind-tools.nvim',
    name = 'tailwind-tools',
    build = ':UpdateRemotePlugins',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim', -- optional
      'neovim/nvim-lspconfig', -- optional
    },
    opts = {}, -- your configuration
  },
}
