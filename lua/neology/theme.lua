local M = {}

function M.setup(opts)
  local c = require('neology.colors').setup(opts)

  local highlights = {
    Normal                    = { bg = c.bg, fg = c.fg }, -- base (default) highlight gr to resort to
    ColorColumn               = { bg = c.mute4 },
    Comment                   = { fg = c.mute2, gui = 'italic' },
    Conditional               = { fg = c.mute1 },
    Constant                  = { fg = c.mute1 },
    Cursor                    = { bg = c.mute5, fg = c.mute1 },
    CursorColumn              = { bg = c.mute6 },
    CursorLine                = { bg = c.mute6 },
    CursorLineNr              = { fg = c.mute2, gui = 'bold' },
    Delimiter                 = { fg = c.mute2 },
    DiffAdd                   = { fg = c.green },
    DiffChange                = { fg = c.yellow },
    DiffDelete                = { fg = c.red },
    DiffText                  = { fg = c.blue },
    Directory                 = { fg = c.mute0, gui = 'bold' },
    Error                     = { fg = c.fg, bg = c.red },
    ErrorMsg                  = { fg = c.red, bg = mute4 },
    FoldColumn                = { fg = c.mute2 },
    Folded                    = { fg = c.mute3 },
    Function                  = { fg = c.fg, gui = 'italic' },
    Identifier                = { fg = c.fg },
    Ignore                    = { fg = c.bg },
    IncSearch                 = { bg = c.mute2, fg = c.bg },
    Include                   = { fg = c.mute1 },
    Keyword                   = { fg = c.mute0 },
    LineNr                    = { fg = c.mute4 },
    MatchParen                = { bg = c.mute2, fg = c.mute0 },
    ModeMsg                   = { gui = 'bold' },
    MoreMsg                   = { fg = c.mute3, gui = 'bold' },
    NonText                   = { bg = c.bg, fg = c.mute3 },
    Operator                  = { fg = c.mute1 },
    Pmenu                     = { fg = c.mute0, bg = c.mute6 },
    PmenuSbar                 = { fg = c.mute0, bg = c.mute4 },
    PmenuSel                  = { fg = c.fg, bg = c.pink },
    PmenuThumb                = { fg = c.mute0, bg = c.mute4 },
    PreProc                   = { fg = c.mute0 },
    Question                  = { fg = c.red },
    Repeat                    = { fg = c.mute1 },
    Search                    = { bg = c.mute0, fg = c.bg, gui = 'bold' },
    SignColumn                = { fg = c.green },
    Special                   = { fg = c.fg, gui = 'italic' },
    SpecialKey                = { fg = c.green },
    SpellBad                  = { gui = 'undercurl', sp = c.red },
    SpellCap                  = { gui = 'undercurl', sp = c.green },
    SpellLocal                = { gui = 'undercurl', sp = c.green },
    SpellRare                 = { gui = 'undercurl', sp = c.orange },
    Statement                 = { fg = c.mute0, gui = 'bold' },
    StatusLine                = { bg = c.mute6, fg = c.mute2 },
    StatusLineNC              = { bg = c.mute6, fg = c.mute4 },
    StorageClass              = { link = 'Type' },
    String                    = { fg = c.mute1, gui = 'italic' },
    Structure                 = { link = 'Type' },
    TabLine                   = { fg = c.mute0, bg = c.mute6 },
    TabLineFill               = { fg = c.mute0, bg = c.mute6 },
    TabLineSel                = { fg = c.fg, bg = c.pink, gui = 'bold' },
    Tag                       = { link = 'Special' },
    Title                     = { fg = c.mute1, gui = 'bold' },
    Todo                      = { fg = c.pink, gui = 'underline' },
    Type                      = { fg = c.mute1 },
    Typedef                   = { link = 'Type' },
    Underlined                = { fg = c.mute0, gui = 'underline' },
    VertSplit                 = { bg = c.mute6, fg = c.mute6 },
    Visual                    = { fg = c.mute0, bg = c.mute5 },
    VisualNOS                 = { bg = c.mute4 },
    WarningMsg                = { bg = c.mute5, fg = c.yellow },
    WildMenu                  = { fg = c.bg, bg = c.mute0 },
    WinBar                    = { link = 'StatusLine' },
    WinBarNC                  = { link = 'StatusLineNC' },
    qfLineNr                  = { fg = c.mute2 },
    -- StatusLineTerm xxx term=bold,reverse cterm=bold ctermfg=0 ctermbg=121 gui=bold guifg=bg guibg=LightGreen
    -- StatusLineTermNC xxx term=reverse ctermfg=0 ctermbg=121 guifg=bg guibg=LightGreen
    -- Normal         xxx cleared
    -- ToolbarLine    xxx term=underline ctermbg=242 guibg=Grey50
    -- ToolbarButton  xxx cterm=bold ctermfg=0 ctermbg=7 gui=bold guifg=Black guibg=LightGrey
    --
    -- Set specific Treesitter node tags
    ["@conditional"]          = { link = 'Conditonal' }, -- 'if'
    ["@include"]              = { link = 'Include' },
    ["@keyword"]              = { link = 'Keyword' },
    ["@operator"]             = { link = 'Operator' },
    ["@punctuation"]          = { link = 'Delimiter' },
    ["@punctuation.bracket"]  = { link = 'Delimiter' },
    -- ["@punctuation.special"]  = { link = 'Delimiter' },
    ["@repeat"]               = { link = 'Repeat' }, -- 'for' loop
    ["@string"]               = { link = 'String' },
    ["@type"]                 = { link = 'Type' },
    ["@type.qualifier"]       = { link = 'Type' },
    -- var hierarchy
    -- ["@variable"]            = { fg = c.fg }, -- parent
    ["@attribute"]            = { gui = 'italic' },
    ["@field"]                = { gui = 'italic' },
    ["@function"]             = { gui = 'italic' },
    ["@method"]               = { gui = 'italic' },
    ["@parameter"]            = { gui = 'italic' },
    --
    ["@comment"]              = { link = 'Comment' },
    ["@spell"]                = { fg = c.mute0 },
    --
    ["@constant"]             = { link = 'Constant' },
    ["@number"]               = { link = 'Constant' },
    -- LSP diagnostics
    DiagnosticUnderlineError  = { gui = 'undercurl', sp = c.red },
    DiagnosticUnderlineWarn   = { gui = 'undercurl', sp = c.orange },
    DiagnosticUnderlineInfo   = { gui = 'undercurl', sp = c.green },
    DiagnosticUnderlineHint   = { gui = 'undercurl', sp = c.green },
    -- Syntastic
    SyntasticWarningSign      = { fg = c.yellow },
    SyntasticWarning          = { bg = c.yellow, fg = c.black, gui = 'bold' },
    SyntasticErrorSign        = { fg = c.red },
    SyntasticError            = { bg = c.red, fg = c.white, gui = 'bold' },
    -- which-key.nvim
    WhichKey                  = { bg = c.bg, fg = c.pink, gui = 'bold' },
    WhichKeyDesc              = { bg = c.bg, fg = c.mute2, gui = 'bold' },
    WhichKeySeparator         = { bg = c.bg, fg = c.mute0, gui = 'bold' },
    WhichKeyFloat             = { bg = c.bg },
    WhichKeyGroup             = { link = 'WhichKey' },
    -- Neomake
    NeomakeWarningSign        = { link = 'SyntasticWarningSign' },
    NeomakeErrorSign          = { link = 'SyntasticErrorSign' },
    -- ALE
    ALEWarningSign            = { link = 'SyntasticWarningSign' },
    ALEErrorSign              = { link = 'SyntasticErrorSign' },
    -- Signify, git-gutter
    SignifySignAdd            = { fg = c.mute2 },
    SignifySignDelete         = { link = 'SignifySignAdd' },
    SignifySignChange         = { link = 'SignifySignAdd' },
    GitGutterAdd              = { link = 'SignifySignAdd' },
    GitGutterDelete           = { link = 'SignifySignAdd' },
    GitGutterChange           = { link = 'SignifySignAdd' },
    GitGutterChangeDelete     = { link = 'SignifySignAdd' },
    -- Markdown
    markdownCode              = { fg = c.mute2 },
    markdownLinkReference     = { fg = c.mute2 },
    markdownJekyllFrontMatter = { fg = c.mute2 },
    markdownCodeBlock         = { fg = c.mute0 },
    markdownCodeDelimiter     = { fg = c.mute0 },
    markdownHeadingDelimiter  = { fg = c.fg },
    markdownRule              = { fg = c.mute2 },
    markdownHeadingRule       = { fg = c.mute2 },
    htmlH1                    = { gui = 'bold' },
    htmlH2                    = { gui = 'bold' },
    htmlH3                    = { gui = 'bold' },
    htmlH4                    = { gui = 'bold' },
    htmlH5                    = { gui = 'bold' },
    htmlH6                    = { gui = 'bold' },
    mkdDelimiter              = { fg = c.fg },
    markdownId                = { fg = c.mute2 },
    markdownBlockquote        = { fg = c.mute2 },
    markdownItalic            = { fg = c.mute2, gui = 'italic' },
    mkdBold                   = { fg = c.fg, gui = 'bold' },
    mkdInlineURL              = { fg = c.fg, gui = 'italic' },
    mkdListItem               = { fg = c.fg },
    markdownOrderedListMarker = { fg = c.fg },
    mkdlink                   = { fg = c.fg, gui = 'bold' },
    markdownLinkDelimiter     = { fg = c.fg },
    mkdURL                    = { fg = c.mute2, gui = 'italic' },
    -- fidget.nvim
    FidgetTask                = { fg = c.mute6 },
    FidgetTitle               = { fg = c.mute6 },
    -- indent-blankline
    IndentBlanklineIndent1    = { fg = c.mute5, gui = 'nocombine' },
    IndentBlanklineIndent2    = { link = 'IndentBlanklineIndent1' },
    IndentBlanklineIndent3    = { link = 'IndentBlanklineIndent1' },
    IndentBlanklineIndent4    = { link = 'IndentBlanklineIndent1' },
    IndentBlanklineIndent5    = { link = 'IndentBlanklineIndent1' },
    IndentBlanklineIndent6    = { link = 'IndentBlanklineIndent1' },
  }

  if opts and opts.highlights then
    highlights = vim.tbl_deep_extend('force', highlights, opts.highlights)
  end

  return highlights
end

return M
