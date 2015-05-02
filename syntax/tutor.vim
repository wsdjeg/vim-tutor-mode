if exists("b:current_syntax")
"    finish
endif

syn include @VIM syntax/vim.vim
syn include @NORMAL syntax/vimnormal.vim
syn include @SHELL syntax/sh.vim

syn match tutorLink /\[.\{-}\](.\{-})/ contains=tutorInlineNormal
syn match tutorLinkBands /\[\|\]\|(\|)/ contained containedin=tutorLink,tutorLinkAnchor conceal
syn match tutorLinkAnchor /(.\{-})/ contained containedin=tutorLink conceal
syn match tutorURL /\(https\?\|file\):\/\/[[:graph:]]\+\>\/\?/
syn match tutorEmail /\<[[:graph:]]\+@[[:graph:]]\+\>/
syn match tutorInternalAnchor /\*[[:alnum:]-]\+\*/ contained conceal containedin=tutorSection

syn match tutorSection /^#\{1,6}\s.\+$/ fold
syn match tutorSectionBullet /#/ contained containedin=tutorSection

syn match tutorTOC /\ctable of contents:/

syn match tutorConcealedEscapes /\\[`*!\[\]()«»:$-]\@=/ conceal

syn region tutorEmphasis matchgroup=Delimiter start=/[\*]\@<!\*\*\@!/ end=/[\*]\@<!\*\*\@!/ concealends contains=tutorInlineCommand,tutorInlineNormal
syn region tutorBold matchgroup=Delimiter start=/\*\{2}/ end=/\*\{2}/ concealends contains=tutorInlineCommand,tutorInlineNormal

syn keyword tutorMarks TODO NOTE IMPORTANT TIP ATTENTION EXERCISE
syn keyword tutorMarks todo note tip attention exercise
syn keyword tutorMarks Todo Note Tip Excersise

syn match tutorTextMark /\\\@<!--->/ conceal cchar=→
syn region tutorSampleText start=/^\(--->\)\@=/ end=/$/ keepend contains=@SPELL
syn match tutorSampleTextMark /^--->/ contained containedin=tutorSampleText conceal cchar=→
syn match tutorSampleTextExpect /\}\@<! {expect:.\+}\s*$/ contained containedin=tutorSampleText conceal
syn match tutorSampleTextExpect /|\@<! |expect:.\+|\s*$/ contained containedin=tutorSampleText conceal

syn region tutorCodeblock matchgroup=Delimiter start=/^\~\{3}.*$/ end=/^\~\{3}/

syn region tutorShell matchgroup=Delimiter start=/^\~\{3} sh\s*$/ end=/^\~\{3}/ keepend contains=@SHELL
syn match tutorShellPrompt /[$#]/ contained containedin=tutorShell

syn region tutorInlineCode matchgroup=Delimiter start=/\\\@<!`/ end=/\\\@<!\(`{\@!\|`\s\)/

syn region tutorCommand matchgroup=Delimiter start=/^\~\{3} cmd\( :\)\?\s*$/ end=/^\~\{3}/ keepend contains=@VIM
syn match tutorCommandIdentifier /:/ contained containedin=tutorCommand,Delimiter conceal cchar=:
syn region tutorInlineCommand matchgroup=Delimiter start=/\\\@<!`\(.*{vim}\)\@=/ end=/\\\@<!`\({vim}\)\@=/ nextgroup=tutorInlineType contains=@VIM
syn match tutorCommandCmd /\(:\||\s\)\@<=\S\+/ contained containedin=tutorCommand

syn region tutorNormal matchgroup=Delimiter start=/^\~\{3} norm\(al\?\)\?\s*$/ end=/^\~\{3}/ contains=@NORMAL
syn region tutorInlineNormal matchgroup=Delimiter start=/\\\@<!`\(.*{normal}\)\@=/ end=/\\\@<!`\({normal}\)\@=/ nextgroup=tutorInlineType contains=@NORMAL

syn match tutorInlineType /{\(normal\|vim\)}/ contained conceal

syn match tutorInlineOK /✓/
syn match tutorInlineX /✗/

hi! tutorLink cterm=underline gui=underline ctermfg=lightblue guifg=#0088ff
hi! link tutorLinkBands Delimiter
hi! link tutorLinkAnchor Underlined
hi! link tutorInternalAnchor Underlined
hi! link tutorURL tutorLink
hi! link tutorEmail tutorLink

hi! link tutorSection Title
hi! link tutorSectionBullet Delimiter

hi! link tutorTOC Directory

hi! tutorMarks cterm=bold gui=bold

hi! tutorEmphasis gui=italic cterm=italic
hi! tutorBold gui=bold cterm=bold

hi! link tutorSampleText Special
hi! tutorOK ctermfg=green guifg=#00ff88 cterm=bold gui=bold
hi! tutorX ctermfg=red guifg=#ff2000  cterm=bold gui=bold
hi! link tutorInlineOK tutorOK
hi! link tutorInlineX tutorX

hi! link tutorCommand String
hi! link tutorCommandCmd Statement
hi! link tutorShellCommand Directory
hi! link tutorShellPrompt Delimiter

let b:current_syntax = "tutor"
