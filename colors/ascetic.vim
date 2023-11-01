" Name:         ascetic
" Description:  Dark monochrome low-contrast colorscheme
" Author:       Aos Dabbagh <hello@aos.sh>
" Maintainer:   Aos Dabbagh <hello@aos.sh>
" License:      Vim License (see `:help license`)
" Last Updated: Sun 29 Oct 2023 04:13:21 PM EDT

set background=dark
hi clear

if exists('syntax on')
  syntax reset
endif

let g:colors_name = 'ascetic'

let s:t_Co = has('gui_running') ? -1 : get(g:, 'ascetic_t_Co', get(g:, 't_Co', exists('&t_Co') ? +&t_Co : 0))

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

"
if get(g:, 'ascetic_transparent_bg', 1) && !has('gui_running')
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

hi Directory guifg=#c0c0c0 ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

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

hi Title guifg=#c0c0c0 ctermfg=153 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Visual guifg=NONE ctermfg=NONE guibg=#444444 ctermbg=0 gui=NONE cterm=NONE
hi VisualNOS guifg=NONE ctermfg=NONE guibg=#444444 ctermbg=0 gui=NONE cterm=NONE
hi WarningMsg guifg=#c0c0c0 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WildMenu guifg=#212121 ctermfg=235 guibg=#c0c0c0 ctermbg=185 gui=bold cterm=bold

call s:h("Underlined", {"gui": "underline", "cterm": "underline"})

hi Error guifg=#f43753 ctermfg=255 guibg=NONE ctermbg=203 gui=NONE cterm=NONE
hi Todo guifg=#ffc24b ctermfg=203 guibg=NONE ctermbg=NONE gui=bold cterm=bold

hi FugitiveblameHash guifg=#c0c0c0 ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi FugitiveblameUncommitted guifg=#c0c0c0 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi FugitiveblameTime guifg=#c0c0c0 ctermfg=185 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi FugitiveblameNotCommittedYet guifg=#c0c0c0 ctermfg=215 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

hi GitGutterAdd guifg=#5af78d ctermfg=185 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi GitGutterChange guifg=#ffc24b ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi GitGutterDelete guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi GitGutterChangeDelete guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

" Floating windows
hi NormalFloat guifg=#c0c0c0 ctermfg=255 guibg=#272727 ctermbg=NONE gui=NONE cterm=NONE
hi FloatBorder guifg=#666666 ctermfg=242 guibg=NONE ctermbg=NONE gui=italic cterm=italic

" TODO
" if s:t_Co >= 256
"   hi Normal ctermfg=250 ctermbg=NONE cterm=NONE
"   hi EndOfBuffer ctermfg=238 ctermbg=NONE cterm=NONE
"   hi Statusline ctermfg=235 ctermbg=66 cterm=NONE
"   hi StatuslineNC ctermfg=250 ctermbg=238 cterm=NONE
"   hi StatuslineTerm ctermfg=235 ctermbg=66 cterm=NONE
"   hi StatuslineTermNC ctermfg=250 ctermbg=238 cterm=NONE
"   hi VertSplit ctermfg=238 ctermbg=238 cterm=NONE
"   hi Pmenu ctermfg=NONE ctermbg=238 cterm=NONE
"   hi PmenuSel ctermfg=235 ctermbg=179 cterm=NONE
"   hi PmenuSbar ctermfg=NONE ctermbg=242 cterm=NONE
"   hi PmenuThumb ctermfg=NONE ctermbg=231 cterm=NONE
"   hi TabLine ctermfg=250 ctermbg=238 cterm=NONE
"   hi TabLineFill ctermfg=66 ctermbg=238 cterm=NONE
"   hi TabLineSel ctermfg=235 ctermbg=66 cterm=NONE
"   hi ToolbarLine ctermfg=NONE ctermbg=234 cterm=NONE
"   hi ToolbarButton ctermfg=235 ctermbg=108 cterm=NONE
"   hi NonText ctermfg=238 ctermbg=NONE cterm=NONE
"   hi SpecialKey ctermfg=238 ctermbg=NONE cterm=NONE
"   hi Folded ctermfg=242 ctermbg=234 cterm=NONE
"   hi Visual ctermfg=235 ctermbg=110 cterm=NONE
"   hi VisualNOS ctermfg=235 ctermbg=110 cterm=NONE
"   hi LineNr ctermfg=242 ctermbg=234 cterm=NONE
"   hi FoldColumn ctermfg=242 ctermbg=234 cterm=NONE
"   hi CursorLine ctermfg=NONE ctermbg=237 cterm=NONE
"   hi CursorColumn ctermfg=NONE ctermbg=237 cterm=NONE
"   hi CursorLineNr ctermfg=215 ctermbg=234 cterm=bold
"   hi QuickFixLine ctermfg=NONE ctermbg=237 cterm=NONE
"   hi SignColumn ctermfg=NONE ctermbg=234 cterm=NONE
"   hi Underlined ctermfg=110 ctermbg=NONE cterm=underline
"   hi Error ctermfg=131 ctermbg=NONE cterm=reverse
"   hi ErrorMsg ctermfg=131 ctermbg=NONE cterm=reverse
"   hi ModeMsg ctermfg=235 ctermbg=136 cterm=NONE
"   hi WarningMsg ctermfg=173 ctermbg=NONE cterm=NONE
"   hi MoreMsg ctermfg=108 ctermbg=NONE cterm=NONE
"   hi Question ctermfg=103 ctermbg=NONE cterm=NONE
"   hi Todo ctermfg=235 ctermbg=242 cterm=NONE
"   hi MatchParen ctermfg=234 ctermbg=136 cterm=NONE
"   hi Search ctermfg=234 ctermbg=65 cterm=NONE
"   hi IncSearch ctermfg=234 ctermbg=179 cterm=NONE
"   hi WildMenu ctermfg=235 ctermbg=179 cterm=NONE
"   hi ColorColumn ctermfg=NONE ctermbg=234 cterm=NONE
"   hi Cursor ctermfg=235 ctermbg=215 cterm=NONE
"   hi lCursor ctermfg=235 ctermbg=131 cterm=NONE
"   hi DiffAdd ctermfg=235 ctermbg=108 cterm=NONE
"   hi DiffChange ctermfg=NONE ctermbg=NONE cterm=NONE
"   hi DiffText ctermfg=235 ctermbg=103 cterm=NONE
"   hi DiffDelete ctermfg=131 ctermbg=234 cterm=NONE
"   hi SpellBad ctermfg=131 ctermbg=NONE cterm=underline
"   hi SpellCap ctermfg=173 ctermbg=NONE cterm=underline
"   hi SpellLocal ctermfg=136 ctermbg=NONE cterm=underline
"   hi SpellRare ctermfg=179 ctermbg=NONE cterm=underline
"   hi Comment ctermfg=242 ctermbg=NONE cterm=NONE
"   hi Identifier ctermfg=67 ctermbg=NONE cterm=NONE
"   hi Function ctermfg=110 ctermbg=NONE cterm=NONE
"   hi Statement ctermfg=179 ctermbg=NONE cterm=NONE
"   hi Constant ctermfg=173 ctermbg=NONE cterm=NONE
"   hi String ctermfg=108 ctermbg=NONE cterm=NONE
"   hi Character ctermfg=108 ctermbg=NONE cterm=NONE
"   hi PreProc ctermfg=66 ctermbg=NONE cterm=NONE
"   hi Type ctermfg=103 ctermbg=NONE cterm=NONE
"   hi Special ctermfg=65 ctermbg=NONE cterm=NONE
"   hi SpecialChar ctermfg=60 ctermbg=NONE cterm=NONE
"   hi Tag ctermfg=109 ctermbg=NONE cterm=NONE
"   hi SpecialComment ctermfg=109 ctermbg=NONE cterm=NONE
"   hi Directory ctermfg=109 ctermbg=NONE cterm=NONE
"   hi Conceal ctermfg=242 ctermbg=NONE cterm=NONE
"   hi Ignore ctermfg=NONE ctermbg=NONE cterm=NONE
"   hi Title ctermfg=231 ctermbg=NONE cterm=NONE
"   unlet s:t_Co
"   finish
" endif

" Neovim terminal ANSI colors
if (has('termguicolors') && &termguicolors) || has('gui_running')
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

" vim: et ts=8 sw=2 sts=2
