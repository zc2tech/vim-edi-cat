" Vim syntax file for EDIFACT

if exists("b:current_syntax")
  finish
endif


syntax match edifactSegmentID         /\v^\s*\w{2,4}/ nextgroup=edifactElementSep

" ----------------------------------------
" Delimiters
" ----------------------------------------
syntax match edifactElementSep /[+:>^']/ contained nextgroup=edifactElementNumber,edifactElementString,edifactElementSep

syntax match edifactHeaderSegment     /\v^\W*(UNA|UNB|UNH|BGM|UNT|UNZ)/ nextgroup=edifactElementSep

syntax match edifactElementNumber  /\v[\-]?[0-9\.]+/ contained nextgroup=edifactElementSep
syntax match edifactElementString  /\v[^\+:>\^']*[^0-9\-*\+:>\^'][^\+:>\^']*/ contained nextgroup=edifactElementSep
syntax match edifactSupportClass      /\v^\W*(RFF\+ON|IT1|OTI|PO1|POC|HL)/ nextgroup=edifactElementSep

syntax match edifactConstSegment      /\v^\W*(NAD|QTY)/ nextgroup=edifactElementSep

syntax match edifactSupportVariable   /\v^\W*(LIN|LCK)/ nextgroup=edifactElementSep

syntax match edifactDebugToken        /\v^\W*(NCD|ENT)/ nextgroup=edifactElementSep



highlight edifactHeaderSegment cterm=italic gui=italic
highlight def link edifactSupportClass      Added
highlight def link edifactConstSegment      NonText
highlight def link edifactSupportVariable   LineNr
highlight def link edifactDebugToken        Ignore
highlight edifactDebugToken guifg=#af6faf 
" highlight def link edifactWarnToken         WarningMsg
highlight def link edifactSegmentID         Changed 

highlight def link edifactElementSep        Ignore 
" highlight def link edifactAnyElementSep     Operator
" highlight def link edifactSegmentSep        Operator

highlight def link edifactElementNumber     Ignore
highlight edifactElementNumber guifg=#B5CEA8
highlight def link edifactElementString     String
highlight edifactElementString guifg=#CE9178

let b:current_syntax = "edifact"