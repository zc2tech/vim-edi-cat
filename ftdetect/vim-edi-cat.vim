" ftdetect/edi.vim
" Priority: .x12 by extension; .edi by content (ISA vs UNA/UNB/UNH)
" Uses Very Magic \v for concise regex.

augroup edi_filetypedetect
  autocmd!
  autocmd BufRead,BufNewFile *.edi,*.x12,*.edifact call s:DetectEDI()
augroup END

function! s:DetectEDI() abort
  " If filetype already set by something else, don't override.
  if &filetype !=# '' && &filetype !=# 'text'
    return
  endif

  " 1) Fast path: exact extension .x12 → set and return.
  if expand('%:e') ==# 'x12'
    setfiletype x12
    return
  endif
  if expand('%:e') ==# 'edifact'
    setfiletype edifact
    return
  endif

  " 2) Content-based detection (for .edi or unknown):
  " Look at first line quickly (many EDI files are single-line or start immediately).
  let l:line1 = getline(1)

  " X12: starts with ISA (ISA is always the first segment in X12)
  if l:line1 =~# '\v^\s*ISA'
    setfiletype x12
    return
  endif

  " EDIFACT:
  " - optional UNA with 6 service chars
  " - or UNB/UNH if UNA omitted
  if l:line1 =~# '\v^\s*UNA.{6}' || l:line1 =~# '\v^\s*UN(B|H)\>'
    setfiletype edifact
    return
  endif

  " If wrapped across lines, scan a few lines.
  let l:head = join(getline(1, min([5, line('$')])), "\n")
  if l:head =~# '\v(^|\n)\s*ISA'
    setfiletype x12
    return
  endif
  if l:head =~# '\v(^|\n)\s*(UNA.{6}|UN(B|H)\>)'
    setfiletype edifact
    return
  endif

  " Fallback: leave as 'text' (or set a default if you prefer)
  " setfiletype edifact | return " <- uncomment if you want EDIFACT as default
endfunction