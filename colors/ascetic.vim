" Name:         ascetic
" Description:  Dark monochrome low-contrast colorscheme
" Author:       Aos Dabbagh <hello@aos.sh>
" Maintainer:   Aos Dabbagh <hello@aos.sh>
" License:      MIT License (MIT)

set background=dark
hi clear

if exists('syntax on')
  syntax reset
endif

let g:colors_name = 'ascetic'

" Transparency and accent colors are on by default
let s:ascetic_transparent_bg = get(g:, 'ascetic_transparent_bg', 1)
let s:ascetic_accent_colors  = get(g:, 'ascetic_accent_colors',  1)

let s:blackest      = { "gui": "#D1D1D1", "cterm": "0" }
let s:black         = { "gui": "#212121", "cterm": "0" }
let s:darkest_gray  = { "gui": "#323232", "cterm": "236" }
let s:darker_gray   = { "gui": "#414141", "cterm": "8"   }
let s:dark_gray     = { "gui": "#767676", "cterm": "242" }
let s:medium_gray   = { "gui": "#999999", "cterm": "243" }
let s:light_gray    = { "gui": "#B2B2B2", "cterm": "249" }
let s:white         = { "gui": "#C0C0C0", "cterm": "81" }
let s:lighter_white = { "gui": "#F1F1F1", "cterm": "15"  }
let s:actual_white  = { "gui": "#FFFFFF", "cterm": "231" }

let s:bg = s:black
let s:fg = s:white

" Accent colors for GitGutter, errors, etc.
if s:ascetic_accent_colors
  let s:accent_blue   = { "gui": "#2980b9", "cterm": "27" }
  let s:accent_red    = { "gui": "#F43753", "cterm": "196" }
  let s:accent_green  = { "gui": "#5AF78D", "cterm": "82" }
  let s:accent_orange = { "gui": "#FFC24B", "cterm": "136" }
else
  let s:accent_blue   = s:fg
  let s:accent_red    = s:fg
  let s:accent_green  = s:fg
  let s:accent_orange = s:fg
endif

" https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

if s:ascetic_transparent_bg
  call s:h("Normal", {"fg": s:fg})
else
  call s:h("Normal", {"fg": s:fg, "bg": s:bg})
endif

call s:h("Comment", {"fg": s:dark_gray})
call s:h("Cursor",  {"fg": s:bg, "bg": s:fg})

hi! link Constant     Normal
hi! link Character    Constant
hi! link String       Constant
hi! link Boolean      Constant
hi! link Number       Constant
hi! link Float        Constant
hi! link Identifier   Constant
hi! link Function     Constant
hi! link Statement    Constant
hi! link Conditional  Constant
hi! link Operator     Constant
hi! link Exception    Constant
hi! link PreProc      Constant
hi! link Type         Constant
hi! link Special      Constant

call s:h("ColorColumn", {"bg": s:darkest_gray})
hi! link CursorColumn   ColorColumn
hi! link CursorLine     ColorColumn
hi! link CursorLineNr   ColorColumn

hi! link Directory    Normal

call s:h("DiffText",  {"gui": "reverse", "cterm": "reverse"})
call s:h("DiffAdd",   {"bg": s:white})
hi! link DiffChange   DiffAdd
hi! link DiffDelete   DiffAdd

call s:h("WarningMsg", {"fg": s:fg})
call s:h("ErrorMsg",   {"fg": s:fg, "gui": "reverse", "cterm": "reverse"})
call s:h("VertSplit",  {"fg": s:black, "bg": s:black})

call s:h("Folded",  {"fg": s:medium_gray, "gui": "italic", "cterm": "italic"})
hi! link FoldColumn Folded

call s:h("SignColumn", {"fg": s:medium_gray, "bg": s:black})

call s:h("LineNr",     {"fg": s:dark_gray})
call s:h("MatchParen", {"fg": s:accent_blue})
call s:h("NonText",    {"fg": s:darker_gray})

call s:h("Pmenu",      {"fg": s:fg, "bg": s:bg})
call s:h("PmenuSel",   {"fg": s:fg, "bg": s:darker_gray})
call s:h("PmenuSbar",  {"fg": s:fg, "bg": s:bg})
call s:h("PmenuThumb", {"fg": s:fg, "bg": s:bg})

call s:h("Search", {"fg": s:actual_white, "gui": "underline,bold", "cterm": "underline,bold"})

call s:h("Question", {"fg": s:fg})
call s:h("SpecialKey", {"fg": s:darker_gray})

hi! link SpellBad    Normal
hi! link SpellLocal  SpellBad
hi! link SpellCap    SpellBad
hi! link SpellRare   SpellBad

call s:h("StatusLine",   {"fg": s:darker_gray, "gui": "bold", "cterm": "bold"})
call s:h("StatusLineNC", {"fg": s:darker_gray})

call s:h("TabLine",     {"fg": s:medium_gray, "bg": s:darker_gray})
call s:h("TabLineFill", {"bg": s:darker_gray})
call s:h("TabLineSel",  {"fg": s:fg})

call s:h("Title",   {"fg": s:fg, "gui": "bold", "cterm": "bold"})
call s:h("Visual",  {"bg": s:darker_gray})
hi! link VisualNOS  Visual

call s:h("WildMenu", {"fg": s:fg, "bg": s:bg, "gui": "bold", "cterm": "bold"})

call s:h("Underlined", {"gui": "underline", "cterm": "underline"})
call s:h("IncSearch",  {"fg": s:black, "bg": s:actual_white})

call s:h("Error", {"fg": s:accent_red})
call s:h("Todo",  {"fg": s:medium_gray, "gui": "bold,italic", "cterm": "bold,italic"})

hi! link FugitiveblameHash             Normal
hi! link FugitiveblameUncommitted      FugitiveblameHash
hi! link FugitiveblameTime             FugitiveblameHash
hi! link FugitiveblameNotCommittedYet  FugitiveblameHash

call s:h("GitGutterAdd",         {"fg": s:accent_green})
call s:h("GitGutterChange",      {"fg": s:accent_orange})
call s:h("GitGutterDelete",      {"fg": s:accent_red})
hi! link GitGutterChangeDelete   GitGutterDelete

" Floating windows
call s:h("NormalFloat", {"fg": s:fg, "bg": s:bg})
call s:h("FloatBorder", {"fg": s:dark_gray})

" Telescope
call s:h("TelescopeSelection", {"bg": s:darkest_gray, "gui": "bold"})
hi! link TelescopeMatching     Search

" Neovim terminal ANSI colors
if (has('termguicolors') && &termguicolors)
  let g:terminal_ansi_colors = [
    \ s:bg,
    \ s:fg,
    \ s:fg,
    \ s:fg,
    \ s:fg,
    \ s:fg,
    \ s:fg,
    \ s:fg,
    \ s:blackest,
    \ s:fg,
    \ s:fg,
    \ s:fg,
    \ s:fg,
    \ s:fg,
    \ s:fg,
    \ s:actual_white
    \ ]
endif

if has('nvim')
  let g:terminal_color_foreground = s:fg
  let g:terminal_color_background = s:bg
  let g:terminal_color_0  = s:bg
  let g:terminal_color_1  = s:fg
  let g:terminal_color_2  = s:fg
  let g:terminal_color_3  = s:fg
  let g:terminal_color_4  = s:fg
  let g:terminal_color_5  = s:fg
  let g:terminal_color_6  = s:fg
  let g:terminal_color_7  = s:fg
  let g:terminal_color_8  = s:blackest
  let g:terminal_color_9  = s:fg
  let g:terminal_color_10 = s:fg
  let g:terminal_color_11 = s:fg
  let g:terminal_color_12 = s:fg
  let g:terminal_color_13 = s:fg
  let g:terminal_color_14 = s:fg
  let g:terminal_color_15 = s:actual_white
endif
