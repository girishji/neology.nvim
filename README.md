# Neology

Remove the clutter to reveal the essential.

A dark colortheme for [Neovim](https://neovim.io/) suitable for coding. It uses
font variation and shading to achieve contrast, and eschews distracting colors
(except for diagnostics and UI). I found that colors do not convey any
additional information, especially if used inconsistently. 

It is written in Lua with adequate Treesitter support. Best used with fonts
that support true *italic* letters -- like *IBM Plex Mono*, *Operator Mono*,
*Victor Mono*, *Jetbrains Mono*, etc.

## Screenshot

![image](https://raw.githubusercontent.com/girishji/neology.nvim/main/screenshots/pic.png)


## ✨ Features
- Supports the latest Neovim features like TreeSitter and LSP
- Fully configurable, including colors
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
  { "girishji/neology.nvim" },
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
    "girishji/neology.nvim",
    priority = 1000,
    config = function()
      -- require 'neology'.setup({ theme = 'default' }) -- default/warm/cool
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

Neology will use the default options, unless you call `setup`.

```lua
require("neology").setup({
  theme = 'default', -- default/warm/cool
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


