# Neology

A simple colortheme for [Neovim](https://neovim.io/) suitable for coding. It uses font shading and font variation to achieve contrast, and eschews distracting colors (except for diagnostics and UI). I found that colors do not convey any additional information, especially if used inconsistently. It is written in Lua with Treesitter support. Best used with fonts that support true *italic* letters -- like *IBM Plex Mono*, *Operator Mono*, *Victor Mono*, *Jetbrains Mono*, etc. These fonts have distinct cursive style for *italic* letters, unlike most  fonts with faux italics where regular font is slanted to achieve italic effect.

## Screenshots

## ✨ Features
- Supports the latest Neovim features like TreeSitter and LSP
- Fully configurable, including colors
- Dark and light themes
- Color config for iTerm2
- **lualine** theme


### Plugin Support

- [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [LSP Diagnostics](https://neovim.io/doc/user/lsp.html)
- [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
- [Git Gutter](https://github.com/airblade/vim-gitgutter)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [WhichKey](https://github.com/liuchengxu/vim-which-key)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Lualine](https://github.com/hoob3rt/lualine.nvim)


## Requirements

- Tested on Neovim >= 0.8.0


## 📦 Installation

Install the theme with your preferred package manager:

[vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'girishji/neology.nvim', { 'branch': 'main' }
```

[packer](https://github.com/wbthomason/packer.nvim)

```lua
use 'girishji/neology.nvim'
```

[Lazy](https://github.com/folke/lazy.nvim)

```lua
require("lazy").setup({
  { "girishji/neology.nvim", opts = { } },
})
```

## 🚀 Usage

Enable the colorscheme:

```vim
" Vim Script
colorscheme neology
```

```lua
-- Lua
vim.cmd[[colorscheme neology]]
```

To enable the `neology` theme from `lazy.nvim`:

```lua
 -- ... your lazy.nvim config
  {
    "girishji/neology.vim",
      config = function()
      vim.cmd.colorscheme 'neology'
    end,
  },  
   -- ... your lazy.nvim config
```

To enable the `neology` theme for `Lualine`, simply specify it in your
lualine settings:

```lua
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'neology'
    -- ... your lualine config
  }
}
```

## ⚙️ Configuration

> ❗️ configuration needs to be set **BEFORE** loading the color scheme with
> `colorscheme neology`
The theme comes in two styles, `dark`and `light`.

The **dark** style will be used if:

- `{ theme = "dark"}` was passed to `setup(options)`

TokyoNight will use the default options, unless you call `setup`.

```lua
require("neology").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  theme = "dark", -- The theme comes in two styles, `dark` and `light`
  highlights = {
    -- You can override specific highlight groups, either to use other colors
    --   link to another group
    -- Specify key, value pair of highlight group and style values (bg, fg, gui)
    -- For instance, to specify 'italic' style and light gray color for 'Comment'
    --   highlight group:
    Comment = { fg = "#999999", gui = 'italic' },
  },
})
```

## 🪓 Overriding Colors & Highlight Groups

Please refer to default values for `colors` and `highlights` in 
[colors](lua/neology/colors.lua) and [themes](lua/neology/theme.lua). Use the `highlighs` option passed to setup() function (above) to override color and style values. 


## 🍭 Extras

Extra color configs for **iTerm** [extras](extras/). It is easy to create color config for any other terminal emulator since only a few colors are [used](lua/neology/colors.lua).


# Credits

Based on the [komau](https://github.com/ntk148v/komau.vim) theme.
