local M = {}

function M.setup(opts)
  local c = require('neology.colors').setup()

  local highlights = {
    Normal                     = { bg = c.bg, fg = c.fg }, -- base (default) highlight group to resort to
    ColorColumn                = { bg = c.bg_overlay1 },
    Comment                    = { fg = c.fg_overlay3, gui = 'italic' },
    Conditional                = { fg = c.fg_overlay1 },
    Constant                   = { fg = c.fg_overlay1 },
    Cursor                     = { bg = c.bg_primary },
    CursorColumn               = { bg = c.bg_overlay1 },
    CursorLine                 = { bg = c.bg_overlay0 },
    CursorLineNr               = { fg = c.fg_overlay1, bg = c.bg_overlay0, gui = 'bold' },
    Delimiter                  = { fg = c.fg_overlay2 },
    DiffAdd                    = { fg = c.fg_green },
    DiffChange                 = { fg = c.fg_yellow },
    DiffDelete                 = { fg = c.fg_red },
    DiffText                   = { fg = c.secondary },
    Directory                  = { fg = c.fg_overlay1, gui = 'bold' },
    Error                      = { fg = c.bg, bg = c.fg_red },
    ErrorMsg                   = { fg = c.fg_red },
    FoldColumn                 = { fg = c.fg_overlay1 },
    Folded                     = { fg = c.fg_overlay3 },
    -- Function                  = { fg = c.fg, gui = 'italic' },
    Identifier                 = { fg = c.fg },
    Ignore                     = { fg = c.bg },
    IncSearch                  = { fg = c.bg, bg = c.fg_primary },
    Include                    = { fg = c.fg_overlay2 },
    Keyword                    = { fg = c.fg_overlay1, gui = 'italic' },
    LineNr                     = { fg = c.fg_overlay4 },
    MatchParen                 = { bg = c.bg_overlay1 },
    ModeMsg                    = { gui = 'bold' },
    MoreMsg                    = { fg = c.fg_overlay2, gui = 'bold' },
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
    Special                    = { fg = c.fg, gui = 'italic' },
    SpecialKey                 = { fg = c.fg_green },
    SpellBad                   = { gui = 'undercurl', sp = c.fg_red },
    SpellCap                   = { gui = 'undercurl', sp = c.fg_green },
    SpellLocal                 = { gui = 'undercurl', sp = c.fg_green },
    SpellRare                  = { gui = 'undercurl', sp = c.fg_yellow },
    Statement                  = { fg = c.fg_overlay1 },
    StatusLine                 = { bg = c.bg_overlay1, fg = c.fg_overlay1 },
    StatusLineNC               = { bg = c.bg, fg = c.fg_overlay4 },
    StorageClass               = { link = 'Type' },
    String                     = { fg = c.fg_overlay1, gui = 'italic' },
    Structure                  = { link = 'Type' },
    TabLine                    = { fg = c.fg_overlay1, bg = c.bg_overlay1 },
    TabLineFill                = { fg = c.fg_overlay1, bg = c.bg_overlay2 },
    TabLineSel                 = { fg = c.fg, bg = c.bg_primary, gui = 'bold' },
    Tag                        = { link = 'Special' },
    Title                      = { fg = c.fg_overlay1, gui = 'bold' },
    Todo                       = { fg = c.fg_primary, gui = 'underline' },
    Type                       = { fg = c.fg_overlay1, gui = 'italic' },
    Typedef                    = { link = 'Type' },
    Underlined                 = { gui = 'underline' },
    VertSplit                  = { bg = c.bg_overlay1, fg = c.bg_overlay1 },
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
    ["@type.qualifier"]        = { fg = c.fg_overlay2, gui = 'italic' },
    -- var hierarchy
    -- ["@variable"]             = { fg = c.fg, gui = 'italic' }, -- parent
    -- ["@attribute"]            = { gui = 'NONE' },
    -- ["@field"]                = { gui = 'NONE' },
    -- ["@function"]             = { gui = 'italic' },
    -- ["@method"]               = { gui = 'italic' },
    -- ["@parameter"]            = { gui = 'NONE' },
    --
    ["@comment"]               = { link = 'Comment' },
    --
    ["@constant"]              = { link = 'Constant' },
    ["@number"]                = { link = 'Constant' },
    -- LSP diagnostics
    DiagnosticUnderlineError   = { gui = 'undercurl', sp = c.fg_red },
    DiagnosticUnderlineWarn    = { gui = 'undercurl', sp = c.fg_orange },
    DiagnosticUnderlineInfo    = { gui = 'undercurl', sp = c.fg_green },
    DiagnosticUnderlineHint    = { gui = 'undercurl', sp = c.fg_green },
    DiagnosticVirtualTextError = { fg = c.fg_red },
    DiagnosticVirtualTextWarn  = { fg = c.fg_orange },
    DiagnosticVirtualTextInfo  = { fg = c.fg_blue },
    DiagnosticVirtualTextHint  = { fg = c.fg_green },
    DiagnosticSignError        = { link = 'DiagnosticVirtualTextError' },
    DiagnosticSignWarn         = { link = 'DiagnosticVirtualTextWarn' },
    DiagnosticSignInfo         = { link = 'DiagnosticVirtualTextInfo' },
    DiagnosticSignHint         = { link = 'DiagnosticVirtualTextHint' },
    -- Syntastic
    SyntasticWarningSign       = { fg = c.fg_yellow },
    SyntasticWarning           = { bg = c.fg_yellow, fg = c.black, gui = 'bold' },
    SyntasticErrorSign         = { fg = c.fg_red },
    SyntasticError             = { bg = c.fg_red, fg = c.white, gui = 'bold' },
    -- which-key.nvim
    WhichKey                   = { bg = c.bg, fg = c.fg_primary, gui = 'bold' },
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
    htmlH1                     = { gui = 'bold' },
    htmlH2                     = { gui = 'bold' },
    htmlH3                     = { gui = 'bold' },
    htmlH4                     = { gui = 'bold' },
    htmlH5                     = { gui = 'bold' },
    htmlH6                     = { gui = 'bold' },
    mkdDelimiter               = { fg = c.fg },
    markdownId                 = { fg = c.fg_overlay1 },
    markdownBlockquote         = { fg = c.fg_overlay1 },
    markdownItalic             = { fg = c.fg_overlay1, gui = 'italic' },
    mkdBold                    = { fg = c.fg, gui = 'bold' },
    mkdInlineURL               = { fg = c.fg, gui = 'italic' },
    mkdListItem                = { fg = c.fg },
    markdownOrderedListMarker  = { fg = c.fg },
    mkdlink                    = { fg = c.fg, gui = 'bold' },
    markdownLinkDelimiter      = { fg = c.fg },
    mkdURL                     = { fg = c.fg_overlay1, gui = 'italic' },
    -- fidget.nvim
    FidgetTask                 = { fg = c.fg_overlay5 },
    FidgetTitle                = { fg = c.fg_overlay5 },
    -- indent-blankline
    IndentBlanklineIndent1     = { fg = c.fg_overlay5, gui = 'nocombine' },
    IndentBlanklineIndent2     = { link = 'IndentBlanklineIndent1' },
    IndentBlanklineIndent3     = { link = 'IndentBlanklineIndent1' },
    IndentBlanklineIndent4     = { link = 'IndentBlanklineIndent1' },
    IndentBlanklineIndent5     = { link = 'IndentBlanklineIndent1' },
    IndentBlanklineIndent6     = { link = 'IndentBlanklineIndent1' },
    -- Lazy
    LazyProgressDone           = { gui = 'bold', fg = c.fg_primary },
    LazyProgressTodo           = { gui = 'bold', fg = c.fg_yellow },
    -- nvim-cmp
    -- CmpIterAbbr
    CmpItemAbbrMatch           = { fg = c.fg_primary },
    CmpItemAbbrMatchFuzzy      = { gui = 'bold' },
  }

  if opts and opts.highlights then
    highlights = vim.tbl_deep_extend('force', highlights, opts.highlights)
  end

  return highlights
end

return M
