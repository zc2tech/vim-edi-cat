if exists("b:current_syntax")
  finish
endif

syntax match x12SegmentID         /\v^\s*\w{2,4}/ nextgroup=x12ElementSep

" ----------------------------------------
" Delimiters
" ----------------------------------------
" Element separator: *, ^, >
syntax match x12ElementSep /\v[\*\^>~]/ contained nextgroup=x12ElementNumber,x12ElementString,x12ElementSep

syntax match x12ElementNumber  /\v[0-9\.]+/ contained nextgroup=x12ElementSep
syntax match x12ElementString  /\v[^\*\^>~]*[^0-9*\^>~][^\*\^>~]*/ contained nextgroup=x12ElementSep

" " support.class
syntax match x12SupportClass      /\v^\W*(HL|OTI|PO1|REF\*PO|POC|RCD)/ nextgroup=x12ElementSep

" variable.other.constant
syntax match x12ConstSegment      /\v^\W*(NAD|ACK)/ nextgroup=x12ElementSep

" support.variable
syntax match x12SupportVariable   /\v^\W*(LIN|IT1)/ nextgroup=x12ElementSep

" token.debug-token
syntax match x12DebugToken        /\v^\W*(NCD|ENT|N1)/ nextgroup=x12ElementSep

" " markup.italic (envelope & key segments)
syntax match x12HeaderSegment     /\v^\W*(ISA|GS|ST|BIG|BGN|BFR|BNR|BIA|BEG|BAK|BPR|BSN|BCH|BRA|BSS|AK1|SE|GE|IEA)/ nextgroup=x12ElementSep

" ----------------------------------------
" Highlight links (use existing Vim groups so colorschemes style them)
" Tweak to taste
" highlight def link x12HeaderSegment    Directory 
highlight x12HeaderSegment cterm=italic gui=italic
highlight def link x12SupportClass      Added
highlight def link x12ConstSegment      NonText
highlight def link x12SupportVariable   LineNr
highlight def link x12DebugToken        Ignore
highlight x12DebugToken guifg=#af6faf 
" highlight def link x12WarnToken         WarningMsg
highlight def link x12SegmentID         Changed 

highlight def link x12ElementSep        Ignore 
" highlight def link x12AnyElementSep     Operator
" highlight def link x12SegmentSep        Operator

highlight def link x12ElementNumber     Ignore
highlight x12ElementNumber guifg=#B5CEA8
highlight def link x12ElementString     String
highlight x12ElementString guifg=#CE9178

let b:current_syntax = "x12"