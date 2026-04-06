return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}

      vim.list_extend(opts.ensure_installed, {
        "bash",
        "c",
        "cmake",
        "cpp",
        "css",
        "dockerfile",
        "gitignore",
        "go",
        "graphql",
        "html",
        "javascript",
        "json",
        "json5",
        "lua",
        "luadoc",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "rust",
        "scss",
        "sql",
        "svelte",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      })

      opts.auto_install = true
      opts.highlight = opts.highlight or {}
      opts.highlight.additional_vim_regex_highlighting = false
      opts.indent = opts.indent or {}
      opts.indent.enable = true
    end,
  },
}
