return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-file-browser.nvim",
  },
  keys = {
    {
      "<leader>fP",
      function()
        require("telescope.builtin").find_files({
          cwd = require("lazy.core.config").options.root,
        })
      end,
      desc = "Find Plugin File",
    },
    {
      "<leader>ff",
      function()
        local builtin = require("telescope.builtin")
        builtin.find_files({
          no_ignore = false,
          hidden = true,
        })
      end,
      desc = "Find Files",
    },
    {
      "<leader>fg",
      function()
        local builtin = require("telescope.builtin")
        builtin.live_grep()
      end,
      desc = "Live Grep",
    },
    {
      "\\\\",
      function()
        local builtin = require("telescope.builtin")
        builtin.buffers()
      end,
    },
    {
      "<leader>fh",
      function()
        local builtin = require("telescope.builtin")
        builtin.help_tags()
      end,
      desc = "Help Tags",
    },
    {
      "<leader>fr",
      function()
        local builtin = require("telescope.builtin")
        builtin.resume()
      end,
      desc = "Resume Telescope",
    },
    {
      "<leader>fd",
      function()
        local builtin = require("telescope.builtin")
        builtin.diagnostics()
      end,
      desc = "Diagnostics Picker",
    },
    {
      "<leader>fs",
      function()
        local builtin = require("telescope.builtin")
        builtin.treesitter()
      end,
      desc = "Treesitter Symbols",
    },
    {
      "sf",
      function()
        local telescope = require("telescope")
        local function telescope_buffer_dir()
          return vim.fn.expand("%:p:h")
        end

        telescope.extensions.file_browser.file_browser({
          path = telescope_buffer_dir(),
          cmd = telescope_buffer_dir(),
          respect_gitignore = false,
          hidden = true,
          grouped = false,
          previewer = false,
          initial_mode = "normal",
          layout_config = { height = 40 },
        })
      end,
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local fb_actions = require("telescope").extensions.file_browser.actions

    opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
      wrap_result = true,
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
      mappings = {
        n = {},
      },
    })
    opts.pickers = {
      diagnostics = {
        theme = "ivy",
        initial_mode = "normal",
        layout_config = {
          preview_cutoff = 9999,
        },
      },
    }
    opts.extensions = {
      file_browser = {
        theme = "dropdown",
        -- disables netw and use telescope-file-browser in its place
        hijack_netrw = true,
        mappings = {
          ["n"] = {
            -- your custom normal mode mappings
            ["N"] = fb_actions.create,
            ["h"] = fb_actions.goto_parent_dir,
            ["/"] = function()
              vim.cmd("startinsert")
            end,
            ["<C-u>"] = function(prompt_bufnr)
              for i = 1, 10 do
                actions.move_selection_previous(prompt_bufnr)
              end
            end,
            ["<C-d>"] = function(prompt_bufnr)
              for i = 1, 10 do
                actions.move_selection_next(prompt_bufnr)
              end
            end,
            ["<PageUp>"] = actions.preview_scrolling_up,
            ["<PageDown>"] = actions.preview_scrolling_down,
          },
        },
      },
    }
    telescope.setup(opts)
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("file_browser")
  end,
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        char = {
          -- Keep native `;` and `,` repeat behavior for f/F/t/T.
          keys = { "f", "F", "t", "T" },
          jump_labels = true,
        },
      },
      highlight = {
        backdrop = true,
      },
    },
  },

  -- animations
  {
    "nvim-mini/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },

  -- logo
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    enabled = true,
    lazy = false,
    priority = 1000,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local logo = [[
      __________           .___ ___________                    
      \______   \ ____   __| _/ \__    ___/___ _____    _____  
      |       _// __ \ / __ |    |    |_/ __ \\__  \  /     \ 
      |    |   \  ___// /_/ |    |    |\  ___/ / __ \|  Y Y  \
      |____|_  /\___  >____ |    |____| \___  >____  /__|_|  /
      \/     \/     \/               \/     \/      \/ 
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local footer = {
        "",
        "",
        "My Coding Playground 🗿",
        "Low-Level | Functional | Scripting | Red Team",
        "",
        "C | C++ | Go | Rust | Zig | OCaml | Haskell | Lua | Red Team",
        "",
      }

      require("dashboard").setup({
        theme = "hyper", --or "doom"
        config = {
          header = vim.split(logo, "\n"),
          footer = footer,
        },
      })
    end,
  },

  -- wakatime
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },

  -- Typr plguin for typing inside neovim
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },

  -- kulala for api testing
  {
    "mistweaverco/kulala.nvim",
    ft = "http", -- load only for .http files
    opts = {
      global_keymaps = true, -- enable built-in defaults
      global_keymaps_prefix = "<leader>R", -- group under <leader>R
    },
    keys = {
      {
        "<leader>Rb",
        function()
          require("kulala").scratchpad()
        end,
        desc = "Open scratchpad",
      },
      {
        "<leader>Rc",
        function()
          require("kulala").copy()
        end,
        desc = "Copy as cURL",
      },
      {
        "<leader>RC",
        function()
          require("kulala").from_curl()
        end,
        desc = "Paste from cURL",
      },
      {
        "<leader>Rg",
        function()
          require("kulala").download_graphql_schema()
        end,
        desc = "Download GraphQL schema",
      },
      {
        "<leader>Ri",
        function()
          require("kulala").inspect()
        end,
        desc = "Inspect current request",
      },
      {
        "<leader>Rn",
        function()
          require("kulala").jump_next()
        end,
        desc = "Jump to next request",
      },
      {
        "<leader>Rp",
        function()
          require("kulala").jump_prev()
        end,
        desc = "Jump to previous request",
      },
      {
        "<leader>Rq",
        function()
          require("kulala").close()
        end,
        desc = "Close window",
      },
      {
        "<leader>Rr",
        function()
          require("kulala").replay()
        end,
        desc = "Replay last request",
      },
      {
        "<leader>Rs",
        function()
          require("kulala").run()
        end,
        desc = "Send the request",
      },
      {
        "<leader>RS",
        function()
          require("kulala").show_stats()
        end,
        desc = "Show stats",
      },
      {
        "<leader>Rt",
        function()
          require("kulala").toggle_view()
        end,
        desc = "Toggle headers/body",
      },
    },
  },

  -- neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      log_level = "fatal",

      sources = { "filesystem", "buffers", "git_status" },

      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },

      window = {
        mappings = {
          ["l"] = "open",
          ["h"] = "close_node",
          ["<space>"] = "none",

          ["Y"] = {
            function(state)
              local node = state.tree:get_node()
              vim.fn.setreg("+", node:get_id(), "c")
            end,
            desc = "Copy Path to Clipboard",
          },

          ["O"] = {
            function(state)
              require("lazy.util").open(state.tree:get_node().path, { system = true })
            end,
            desc = "Open with System Application",
          },

          ["P"] = { "toggle_preview", config = { use_float = false } },
        },
      },

      default_component_configs = {
        indent = {
          with_expanders = true,
          expander_collapsed = "",
          expander_expanded = "",
        },
        git_status = {
          symbols = {
            unstaged = "󰄱",
            staged = "󰱒",
          },
        },
      },
    },
  },
}
