return {
  {
    'stevearc/oil.nvim',
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons", "nvim-tree/nvim-web-devicons"},
    opts = {
      -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
      default_file_explorer = true,
      -- Id is automatically added at the beginning, and name at the end
      -- See :help oil-columns
      columns = {
        "icon",
        "size",
        "mtime",
      },
      -- Buffer-local options to use for oil buffers
      buf_options = {
        buflisted = false,
        bufhidden = "hide",
      },
      -- Window-local options to use for oil buffers
      win_options = {
        wrap = false,
        signcolumn = "no",
        cursorcolumn = false,
        foldcolumn = "0",
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = "nvic",
      },
      -- Send deleted files to trash instead of permanently deleting them
      delete_to_trash = true,
      -- Skip the confirmation popup for simple operations
      skip_confirm_for_simple_edits = true,
      -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
      prompt_save_on_select_new_entry = true,
      -- Oil will automatically delete hidden buffers after this delay
      -- Set to false to disable cleanup
      cleanup_delay_ms = 2000,
      -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
      -- options with a `callback` key
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-v>"] = "actions.select_vsplit",
        ["<C-h>"] = "actions.select_split",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["g."] = "actions.toggle_hidden",
      },
      -- Set to false to disable all of the above keymaps
      use_default_keymaps = false,
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
        -- This function defines what is considered a "hidden" file
        is_hidden_file = function(name, bufnr)
          return vim.startswith(name, ".")
        end,
        -- This function defines what will never be shown, even when `show_hidden` is set
        is_always_hidden = function(name, bufnr)
          return false
        end,
        sort = {
          -- sort order can be "asc" or "desc"
          -- see :help oil-columns to see which columns are sortable
          { "type", "asc" },
          { "name", "asc" },
        },
      },
    },
  },
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup({
        -- Detection methods: Can be ["lsp", "pattern", "lsp" ] 
        -- We'll use pattern only for faster detection
        detection_methods = { "pattern" },
        -- Patterns used to detect root dir
        patterns = {
          -- Version Control
          ".git",
          -- Node.js
          "package.json", "package-lock.json", "tsconfig.json", "vite.config.ts", "next.config.js",
          -- Python
          "pyproject.toml", "setup.py", "requirements.txt", "Pipfile",
          -- Rust
          "Cargo.toml", "Cargo.lock", "rust-toolchain.toml",
          -- Common build files
          "Makefile", "CMakeLists.txt", "build.gradle",
          -- Config files
          ".env", "docker-compose.yml",
          -- Golang 
          "go.mod", "go.sum"
        },

        -- Show hidden files in telescope
        show_hidden = true,

        -- Don't calculate root dir on specific directories
        ignore_lsp = { },

        -- Don't show these files/folders
        exclude_dirs = { },

        -- What scope to change the directory to
        scope_chdir = 'global',
      })

      -- Setup Telescope integration
      require('telescope').load_extension('projects')
    end,
    keys = {
      { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Projects" },
    },
  },
}
