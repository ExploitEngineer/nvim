return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
        -- Systems / compiled languages
        "c",
        "cpp",
        "rust",
        "go",

        -- Web / Full‑stack languages
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "php",
        "graphql",
        "svelte",
        "astro",
        "scss",
        "sql",

        -- Scripting / tooling
        "bash",
        "lua",
        "json",
        "json5",
        "markdown",
        "markdown_inline",
        "vim",
        "vimdoc",
        "yaml",
        "toml",

        -- Useful extra languages
        "python",
        "dockerfile",
        "cmake",
        "make",
        "gitignore",
        }
    }
  }
}
