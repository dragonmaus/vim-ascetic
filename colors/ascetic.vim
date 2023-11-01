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

let s:blackest        = { "gui": "#D1D1D1", "cterm": "0" }
let s:black           = { "gui": "#212121", "cterm": "0" }
let s:darkest_gray    = { "gui": "#323232", "cterm": "236" }
let s:darker_gray     = { "gui": "#414141", "cterm": "8"   }
let s:dark_gray       = { "gui": "#666666", "cterm": "242" }
let s:medium_gray     = { "gui": "#767676", "cterm": "243" }
let s:light_gray      = { "gui": "#B2B2B2", "cterm": "249" }
let s:white           = { "gui": "#C0C0C0", "cterm": "81" }
let s:lighter_white   = { "gui": "#F1F1F1", "cterm": "15"  }
let s:actual_white    = { "gui": "#FFFFFF", "cterm": "231" }

let s:bg = s:black
let s:fg = s:white

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

" Transparent is on by default
if get(g:, 'ascetic_transparent_bg', 1)
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
hi! link CursorColumn ColorColumn
hi! link CursorLine   ColorColumn
hi! link CursorLineNr ColorColumn

hi! link Directory    Normal

hi DiffAdd guifg=NONE ctermfg=NONE guibg=#c0c0c0 ctermbg=238 gui=NONE cterm=NONE
hi DiffChange guifg=NONE ctermfg=NONE guibg=#c0c0c0 ctermbg=239 gui=NONE cterm=NONE
hi DiffDelete guifg=#c0c0c0 ctermfg=203 guibg=#c0c0c0 ctermbg=237 gui=NONE cterm=NONE
call s:h("DiffText", {"gui": "reverse", "cterm": "reverse"})

hi ErrorMsg guifg=#c0c0c0 ctermfg=203 guibg=NONE ctermbg=NONE gui=reverse cterm=reverse
hi VertSplit guifg=#212121 ctermfg=235 guibg=#212121 ctermbg=235 gui=NONE cterm=NONE
hi Folded guifg=#666666 ctermfg=242 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi FoldColumn guifg=#666666 ctermfg=242 guibg=#1d1d1d ctermbg=234 gui=NONE cterm=NONE
hi SignColumn guifg=#999999 ctermfg=246 guibg=#212121 ctermbg=235 gui=NONE cterm=NONE
hi IncSearch guifg=#212121 ctermfg=235 guibg=#ffffff ctermbg=15 gui=NONE cterm=NONE
hi LineNr guifg=#666666 ctermfg=238 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi MatchParen guifg=#2980b9 ctermfg=21 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi NonText guifg=#444444 ctermfg=238 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

call s:h("Pmenu",      {"fg": s:fg, "bg": s:bg})
call s:h("PmenuSel",   {"fg": s:fg, "bg": s:darker_gray})
call s:h("PmenuSbar",  {"fg": s:fg, "bg": s:bg})
call s:h("PmenuThumb", {"fg": s:fg, "bg": s:bg})

call s:h("Search", {"fg": s:actual_white, "gui": "underline,bold", "cterm": "underline,bold"})

hi Question guifg=#c0c0c0 ctermfg=185 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpecialKey guifg=#444444 ctermfg=238 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

hi SpellBad guifg=#c0c0c0 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpellLocal guifg=#c0c0c0 ctermfg=180 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpellCap guifg=#c0c0c0 ctermfg=215 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpellRare guifg=#c0c0c0 ctermfg=81 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

hi StatusLine guifg=#444444 ctermfg=234 guibg=NONE ctermbg=242 gui=bold cterm=bold
hi StatusLineNC guifg=#444444 ctermfg=246 guibg=NONE ctermbg=238 gui=NONE cterm=NONE

hi TabLine guifg=#999999 ctermfg=246 guibg=#444444 ctermbg=238 gui=NONE cterm=NONE
hi TabLineFill guifg=NONE ctermfg=NONE guibg=#444444 ctermbg=238 gui=NONE cterm=NONE
hi TabLineSel guifg=#c0c0c0 ctermfg=185 guibg=NONE ctermbg=NONE gui=bold cterm=bold

call s:h("Title", {"fg": s:fg, "gui": "bold", "cterm": "bold"})
hi Visual guifg=NONE ctermfg=NONE guibg=#444444 ctermbg=0 gui=NONE cterm=NONE
hi VisualNOS guifg=NONE ctermfg=NONE guibg=#444444 ctermbg=0 gui=NONE cterm=NONE
hi WarningMsg guifg=#c0c0c0 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WildMenu guifg=#212121 ctermfg=235 guibg=#c0c0c0 ctermbg=185 gui=bold cterm=bold

call s:h("Underlined", {"gui": "underline", "cterm": "underline"})

hi Error guifg=#f43753 ctermfg=255 guibg=NONE ctermbg=203 gui=NONE cterm=NONE
hi Todo guifg=#ffc24b ctermfg=203 guibg=NONE ctermbg=NONE gui=bold cterm=bold

hi! link FugitiveblameHash            Normal
hi! link FugitiveblameUncommitted     FugitiveblameHash
hi! link FugitiveblameTime            FugitiveblameHash
hi! link FugitiveblameNotCommittedYet FugitiveblameHash

hi GitGutterAdd guifg=#5af78d ctermfg=185 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi GitGutterChange guifg=#ffc24b ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi GitGutterDelete guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi GitGutterChangeDelete guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

" Floating windows
call s:h("NormalFloat", {"fg": s:fg, "bg": s:bg})
call s:h("FloatBorder", {"fg": s:dark_gray})

" Telescope
call s:h("TelescopeSelection", {"bg": s:darkest_gray, "gui": "bold"})
hi! link TelescopeMatching Search

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
  let g:terminal_color_0 = s:bg
  let g:terminal_color_1 = s:fg
  let g:terminal_color_2 = s:fg
  let g:terminal_color_3 = s:fg
  let g:terminal_color_4 = s:fg
  let g:terminal_color_5 = s:fg
  let g:terminal_color_6 = s:fg
  let g:terminal_color_7 = s:fg
  let g:terminal_color_8 = s:blackest
  let g:terminal_color_9 = s:fg
  let g:terminal_color_10 = s:fg
  let g:terminal_color_11 = s:fg
  let g:terminal_color_12 = s:fg
  let g:terminal_color_13 = s:fg
  let g:terminal_color_14 = s:fg
  let g:terminal_color_15 = s:actual_white
endif
