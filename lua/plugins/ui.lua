return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.routes = opts.routes or {}

      table.insert(opts.routes, {
        filter = {
          event = "notify",
          kind = "info",
          any = {
            { find = "Neo%-tree INFO] Toggling hidden files" },
            { find = "No information available" },
          },
        },
        opts = { skip = true },
      })

      opts.presets = opts.presets or {}
      opts.presets.lsp_doc_border = true
    end,
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 3000,
    },
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        mode = "buffers",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "solarized_dark",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          { "branch", icon = "" },
          "diff",
          "diagnostics",
        },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = {
          {
            function()
              local clients = vim.lsp.get_clients({ bufnr = 0 })
              if #clients == 0 then return "" end
              local names = {}
              for _, c in ipairs(clients) do
                table.insert(names, c.name)
              end
              return " " .. table.concat(names, ", ")
            end,
          },
          "encoding",
          { "filetype", icon_only = false },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },

  -- filename in winbar
  {
    "b0o/incline.nvim",
    event = "VeryLazy",
    priority = 1200,
    config = function()
      require("incline").setup({
        window = {
          margin = { vertical = 0, horizontal = 1 },
          winhighlight = {
            Normal = "Normal",
            NormalNC = "Normal",
          },
        },

        hide = {
          cursorline = true,
        },

        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")

          if vim.bo[props.buf].modified then
            filename = "[+]" .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)

          return {
            { icon, guifg = color },
            { " " },
            { filename },
          }
        end,
      })
    end,
  },

  -- snacks dashboard
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        enabled = true,
        preset = {
          header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
          keys = {
            { icon = " ", key = "f", desc = "Find File",       action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "g", desc = "Live Grep",       action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files",    action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "c", desc = "Config",          action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = "󰒲 ", key = "l", desc = "Lazy",            action = ":Lazy", enabled = package.loaded.lazy ~= nil },
            { icon = " ", key = "q", desc = "Quit",            action = ":qa" },
          },
        },
        sections = {
          { section = "header" },
          { section = "keys",         gap = 1, padding = 1 },
          { section = "recent_files", limit = 5, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}
