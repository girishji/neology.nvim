-- Help:
--   :hi {groupname}

local M = {}

function M.setup(opts)
  local c = require('neology.colors').setup(opts)

  local highlights = {
    Normal                     = { bg = c.bg, fg = c.fg }, -- base (default) highlight group to resort to
    ColorColumn                = { bg = c.bg_overlay1 },
    Comment                    = { fg = c.fg_overlay3, italic = true },
    Conditional                = { fg = c.fg_overlay1 },
    Constant                   = { fg = c.fg_overlay1 },
    Cursor                     = { bg = c.bg_primary },
    CursorColumn               = { bg = c.bg_overlay1 },
    CursorLine                 = { bg = c.bg_overlay0 },
    CursorLineNr               = { fg = c.fg, bg = c.bg_overlay0 },
    Delimiter                  = { fg = c.fg_overlay2 },
    DiffAdd                    = { fg = c.fg_green },
    DiffChange                 = { fg = c.fg_yellow },
    DiffDelete                 = { fg = c.fg_red },
    DiffText                   = { fg = c.secondary },
    Directory                  = { fg = c.fg_overlay1, bold = true },
    Error                      = { fg = c.bg, bg = c.fg_red },
    ErrorMsg                   = { fg = c.fg_red },
    FoldColumn                 = { fg = c.fg_overlay1 },
    Folded                     = { fg = c.fg_overlay3 },
    -- Function                   = { fg = c.fg, bold = true },
    Identifier                 = { fg = c.fg },
    Ignore                     = { fg = c.bg },
    IncSearch                  = { fg = c.bg, bg = c.fg_primary },
    Include                    = { fg = c.fg_overlay2, italic = true },
    Keyword                    = { fg = c.fg, bold = true },
    LineNr                     = { fg = c.fg_overlay4 },
    MatchParen                 = { bg = c.fg_overlay4 },
    ModeMsg                    = { bold = true },
    MoreMsg                    = { fg = c.fg_overlay2, bold = true },
    NonText                    = { bg = c.bg, fg = c.fg_overlay2 },
    Operator                   = { fg = c.fg_overlay1 },
    Pmenu                      = { fg = c.fg_overlay1, bg = c.bg_overlay1 },
    PmenuSel                   = { fg = c.fg, bg = c.bg_overlay2 },
    PmenuSbar                  = { bg = c.bg_overlay2 }, -- scrollbar
    PmenuThumb                 = { bg = c.fg_overlay5 }, -- thumb of scrollbar
    PreProc                    = { fg = c.fg_overlay1 },
    Question                   = { fg = c.fg_red },
    Repeat                     = { fg = c.fg_overlay1 },
    Search                     = { bg = c.bg_overlay3 },
    SignColumn                 = { fg = c.fg_green },
    Special                    = { fg = c.fg, italic = true },
    SpecialKey                 = { fg = c.fg_green },
    SpellBad                   = { undercurl = true, sp = c.fg_red },
    SpellCap                   = { undercurl = true, sp = c.fg_green },
    SpellLocal                 = { undercurl = true, sp = c.fg_green },
    SpellRare                  = { undercurl = true, sp = c.fg_yellow },
    Statement                  = { fg = c.fg_overlay1 },
    StatusLine                 = { bg = c.bg_overlay1, fg = c.fg_overlay1 },
    StatusLineNC               = { bg = c.bg, fg = c.fg_overlay4 },
    StorageClass               = { link = 'Type' },
    String                     = { fg = c.fg, italic = true },
    Structure                  = { link = 'Type' },
    TabLine                    = { fg = c.fg_overlay1, bg = c.bg_overlay1 },
    TabLineFill                = { fg = c.fg_overlay1, bg = c.bg_overlay2 },
    TabLineSel                 = { fg = c.fg, bg = c.bg_primary, bold = true },
    Tag                        = { link = 'Special' },
    Title                      = { fg = c.fg_overlay1, bold = true },
    Todo                       = { fg = c.fg_primary, underline = true },
    -- Type                       = { fg = c.fg_overlay1 },
    Type                       = { fg = c.fg, italic = true },
    Typedef                    = { link = 'Type' },
    Underlined                 = { underline = true },
    -- VertSplit                  = { bg = c.bg_overlay1, fg = c.bg_overlay1 },
    VertSplit                  = { bg = c.bg, fg = c.fg_primary },
    WinSeparator               = { link = 'VertSplit' },
    Visual                     = { fg = c.fg, bg = c.bg_overlay2 },
    VisualNOS                  = { bg = c.bg_overlay2 },
    WarningMsg                 = { fg = c.fg_yellow },
    WildMenu                   = { fg = c.bg, bg = c.bg_primary },
    WinBar                     = { link = 'StatusLine' },
    WinBarNC                   = { link = 'StatusLineNC' },
    qfLineNr                   = { fg = c.fg_overlay1 },
    StatusLineTerm             = { fg = c.fg_overlay1 },
    StatusLineTermNC           = { fg = c.bg, bg = c.bg_primary },
    ToolbarLine                = { bg = c.fg_overlay1, fg = c.bg },
    ToolbarButton              = { bg = c.fg_overlay1, fg = c.bg },
    NormalFloat                = { bg = c.bg, fg = c.fg_overlay1 },
    FloatBorder                = { bg = c.bg, fg = c.bg_overlay3 },
    --
    -- Set specific Treesitter node tags
    ["@conditional"]           = { link = 'Conditional' }, -- 'if'
    ["@include"]               = { link = 'Include' },
    ["@keyword"]               = { link = 'Keyword' },
    ["@operator"]              = { link = 'Operator' },
    ["@punctuation"]           = { link = 'Delimiter' },
    -- ["@punctuation.bracket"]  = { link = 'Delimiter' },
    ["@repeat"]                = { link = 'Repeat' }, -- 'for' loop
    ["@string"]                = { link = 'String' },
    ["@type"]                  = { link = 'Type' },
    ["@type.qualifier"]        = { fg = c.fg_overlay2, italic = true },
    -- var hierarchy
    ["@variable"]              = { fg = c.fg }, -- parent
    -- ["@attribute"]            = { NONE = true },
    -- ["@field"]                = { NONE = true },
    -- ["@function"]              = { bold = true },
    -- ["@method"]                = { bold = true },
    -- ["@function"]              = { NONE = true },
    -- ["@method"]                = { NONE = true },
    -- ["@parameter"]            = { NONE = true },
    --
    ["@comment"]               = { link = 'Comment' },
    ["@text"]                  = { link = 'Todo' },
    ["@text.danger"]           = { fg = c.fg_orange, underline = true },
    --
    ["@constant"]              = { link = 'Constant' },
    ["@number"]                = { link = 'Constant' },
    -- LSP diagnostics
    DiagnosticUnderlineError   = { undercurl = true, sp = c.fg_red },
    DiagnosticUnderlineWarn    = { undercurl = true, sp = c.fg_orange },
    DiagnosticUnderlineInfo    = { undercurl = true, sp = c.fg_green },
    DiagnosticUnderlineHint    = { undercurl = true, sp = c.fg_green },
    DiagnosticVirtualTextError = { fg = c.fg_red },
    DiagnosticVirtualTextWarn  = { fg = c.fg_orange },
    DiagnosticVirtualTextInfo  = { fg = c.fg_blue },
    DiagnosticVirtualTextHint  = { fg = c.fg_green },
    DiagnosticSignError        = { link = 'DiagnosticVirtualTextError' },
    DiagnosticSignWarn         = { link = 'DiagnosticVirtualTextWarn' },
    DiagnosticSignInfo         = { link = 'DiagnosticVirtualTextInfo' },
    DiagnosticSignHint         = { link = 'DiagnosticVirtualTextHint' },
    DiagnosticError            = { link = 'DiagnosticVirtualTextError' },
    DiagnosticWarn             = { link = 'DiagnosticVirtualTextWarn' },
    DiagnosticInfo             = { link = 'DiagnosticVirtualTextInfo' },
    DiagnosticHint             = { link = 'DiagnosticVirtualTextHint' },
    -- Syntastic
    SyntasticWarningSign       = { fg = c.fg_yellow },
    SyntasticWarning           = { bg = c.fg_yellow, fg = c.black, bold = true },
    SyntasticErrorSign         = { fg = c.fg_red },
    SyntasticError             = { bg = c.fg_red, fg = c.white, bold = true },
    -- which-key.nvim
    WhichKey                   = { bg = c.bg, fg = c.fg_primary },
    WhichKeyDesc               = { bg = c.bg, fg = c.fg },
    WhichKeySeparator          = { bg = c.bg, fg = c.fg },
    WhichKeyFloat              = { bg = c.bg, fg = c.fg },
    WhichKeyGroup              = { link = 'WhichKey' },
    -- Neomake
    NeomakeWarningSign         = { link = 'SyntasticWarningSign' },
    NeomakeErrorSign           = { link = 'SyntasticErrorSign' },
    -- ALE
    ALEWarningSign             = { link = 'SyntasticWarningSign' },
    ALEErrorSign               = { link = 'SyntasticErrorSign' },
    -- Signify, git-gutter
    SignifySignAdd             = { fg = c.fg_overlay1 },
    SignifySignDelete          = { link = 'SignifySignAdd' },
    SignifySignChange          = { link = 'SignifySignAdd' },
    GitGutterAdd               = { link = 'SignifySignAdd' },
    GitGutterDelete            = { link = 'SignifySignAdd' },
    GitGutterChange            = { link = 'SignifySignAdd' },
    GitGutterChangeDelete      = { link = 'SignifySignAdd' },
    -- Markdown
    markdownCode               = { fg = c.fg_overlay1 },
    markdownLinkReference      = { link = 'markdownCode' },
    markdownJekyllFrontMatter  = { link = 'markdownCode' },
    markdownCodeBlock          = { link = 'markdownCode' },
    markdownCodeDelimiter      = { link = 'markdownCode' },
    markdownRule               = { link = 'markdownCode' },
    markdownHeadingRule        = { link = 'markdownCode' },
    htmlH1                     = { bold = true },
    htmlH2                     = { bold = true },
    htmlH3                     = { bold = true },
    htmlH4                     = { bold = true },
    htmlH5                     = { bold = true },
    htmlH6                     = { bold = true },
    mkdDelimiter               = { fg = c.fg },
    markdownId                 = { fg = c.fg_overlay1 },
    markdownBlockquote         = { fg = c.fg_overlay1 },
    markdownItalic             = { fg = c.fg_overlay1, italic = true },
    mkdBold                    = { fg = c.fg, bold = true },
    mkdInlineURL               = { fg = c.fg, italic = true },
    mkdListItem                = { fg = c.fg },
    markdownOrderedListMarker  = { fg = c.fg },
    mkdlink                    = { fg = c.fg, bold = true },
    markdownLinkDelimiter      = { fg = c.fg },
    mkdURL                     = { fg = c.fg_overlay1, italic = true },
    -- fidget.nvim
    FidgetTask                 = { fg = c.fg_overlay5 },
    FidgetTitle                = { fg = c.fg_overlay5 },
    -- indent-blankline
    IndentBlanklineIndent1     = { fg = c.fg_overlay5, nocombine = true },
    IndentBlanklineIndent2     = { link = 'IndentBlanklineIndent1' },
    IndentBlanklineIndent3     = { link = 'IndentBlanklineIndent1' },
    IndentBlanklineIndent4     = { link = 'IndentBlanklineIndent1' },
    IndentBlanklineIndent5     = { link = 'IndentBlanklineIndent1' },
    IndentBlanklineIndent6     = { link = 'IndentBlanklineIndent1' },
    -- Lazy
    LazyProgressDone           = { bold = true, fg = c.fg_primary },
    LazyProgressTodo           = { bold = true, fg = c.fg_yellow },
    -- nvim-cmp
    -- CmpIterAbbr
    CmpItemAbbrMatch           = { fg = c.fg_primary },
    CmpItemAbbrMatchFuzzy      = { bold = true },
    -- Telescope
    TelescopeBorder            = { link = 'FloatBorder' },
  }

  if opts and opts.highlights then
    highlights = vim.tbl_deep_extend('force', highlights, opts.highlights)
  end

  return highlights
end

return M
