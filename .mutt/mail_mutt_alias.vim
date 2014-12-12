" ===========================================================================
" Vim script file
" File          : Mail_mutt_alias_set.vim
" Author        : Luc Hermitte <hermitte@free.fr>
"                 <URL:http://hermitte.free.fr/vim/>
" Last update   : 01st jul 2002
"
" Purpose       : extract an alias from the aliases file : ~/.mutt/aliases_file
" Dependencies	: a.vim		<http://vim.sf.net/scripts>
" 		  words_tools.vim
" 		  VIM version 6.0+
"------------------------------------------------------------
" {{{
" Use           : In normal mode  -> ,Ca the_alias
"                 In command mode -> :Ca the_alias
"
" Alternative way: In insert mode, enter <tab> after the pattern of an
" alias. If only one alias matches the current pattern, the pattern will be
" replaced by the corresponding alias. If severall patterns match, a choice
" will be given in a split window.
"
" Rem: 
" (*) <tab> has is classical effect on non-address lines (i.e.: not To:,
"     Cc:, Bcc: and Reply-To: lines).
" (*) Many functions stolen to the file <grep.vim> authored by Ron Aaron
"     and extended by Zdenek Sekera.
" (*) VIM version needed : works fine with VIM 6.1 under Windows-NT
"
" Todo:
" (*) Tag regarding a pattern : <C-t>
" (*) Test with VIM 6 under Solaris
" }}}
" ===========================================================================
if exists("g:loaded_Mail_mutt_alias_set_vim") | finish | endif
let g:loaded_Mail_mutt_alias_set_vim = 1

let s:fields = '^\(To\|Cc\|Bcc\|Reply-To\):'

" ===========================================================================
" Old stuff {{{
" command! -nargs=1 Ca :call AppendAlias(<q-args>)
" noremap ,Ca :Ca 
" }}}
" ===========================================================================
" New stuff based on <tab> and a possible menu. {{{
runtime macros/a.vim

function! s:Error(msg) " {{{
  if has("gui")
    call confirm(a:msg,'&Ok', 1, 'Error')
  else
    echohl ErrorMsg
    echo a:msg
    echohl None
  endif
endfunction " }}}
"----------------------------------------
" Mapping of <tab> {{{
" Rem: <cword> is not really adapted, hence GetCurrentWord().
inoremap <buffer> <silent> <tab> <c-r>=<sid>MapTab(GetCurrentWord())<cr>
" }}}

"----------------------------------------
" Extract the address from a Mutt-alias line {{{
function! s:Addr(the_line)
  let msk = 'alias\s\+\S\+\s\+' 
  return substitute( a:the_line, msk, '', '')
endfunction 
" }}}

"----------------------------------------
" Add aliases in place of the current (previous) word. {{{
function! s:PutAddrLines(addrs)
   let l = line('.')
   exe l.'s/\s*\S\+$//'
   exe l . "put = a:addrs"
   silent! call s:ReformatLine(l)
endfunction

function! s:ReformatLine(l)
  exe a:l.'normal $'
  let l0 = search(s:fields, 'bW')
  normal V
  /\(^\S\+:\)\|\(^\s*$\)/-1
  normal J
  s/,$//
  s/\t/ /g
  s/\s*, /,\r\t/g
  exe l0
  while (getline(l0) !~ '[^,]$') && (l0 <line('$'))
    if strlen(getline(l0)) + strlen(getline(l0+1)) <= &tw
      normal J
    endif
    normal j
    let l0 = l0 + 1
  endwhile
endfunction
" }}}

"----------------------------------------
" Main function {{{
function! s:GrepAlias(the_alias)
  let buffername = $HOME . '/tmp/search-results-aliases'
  call FindOrCreateBuffer(buffername,1)	" from a.vim
  normal 1GdG
  0 put = '#Aliases corresponding to the current pattern : <'.a:the_alias . '>'
  1 put = '-none-of-these-'
  1 put = s:Help()
  " only the alias
  ""exe '$r!grep -i "alias *' . a:the_alias . ".*[\t ]\" " .expand('$HOME').  '/.mutt/aliases_file | sort'
  " Any substring except the address
  silent exe '$r!grep -i "alias *.*' . a:the_alias . "[^\t]*\t\" " .expand('$HOME').  '/.mutt/aliases_file | sort'
  silent g/^$/ d
  let result = line('$')
  " No result
  if result == s:Help_NbL()
    silent bd!
    call s:Error("\r" . 'No alias matching <'.a:the_alias.">")
    return "\<esc>a"
  " Only one result
  elseif result == s:Help_NbL() + 1
    let addr = getline(line('$'))
    silent bd!
    call s:PutAddrLines("\t".s:Addr(addr))
    return "\<esc>A"
  endif
  " Default return : several results
  silent 1,$s/alias //
  call s:Syntax(a:the_alias)
  call s:Reformat()
  exe (s:Help_NbL() + 1)

  return "\<esc>"
endfunction
" }}}

"----------------------------------------
" Local mappings {{{
func! s:GrepEditFileLine(lineNum)
   if a:lineNum > 3
      let line = getline(a:lineNum)
      if (line != "-none-of-these-")
	   " If there are tagged choices
	 if b:NbTags != 0
	   %v/^\*/d
	   %s/^.\S\+\s\+//
	   exe '1,'.b:NbTags.'s/$/,'
	   %s/^/\t/
	   normal vipy
	   let addrs = @"
	 else
	   " Else : return the current line only
	   let addrs = "\t".s:Addr('alias '.line).','
	 endif
         bd!
	 call s:PutAddrLines(addrs)
      else
         bd!
         echo "\r"
      endif
   endif
endfunc
" }}}

"----------------------------------------
" Reformat the displayed aliases {{{
function! s:Reformat()
  set expandtab
  set tabstop=12
  retab
  %s/^\([^#][^<]*\S\)\s*\(<.*>\)/ \1\t\2/
  set tabstop=39
endfunction
" }}}

"----------------------------------------
" Tag / untag the current choice {{{
function! s:ToggleTag(lineNum)
   if a:lineNum > s:Help_NbL()
      " If tagged
      if (getline(a:lineNum)[0] == '*')
	let b:NbTags = b:NbTags - 1
	silent exe a:lineNum.'s/^\*/ /'
      else
	let b:NbTags = b:NbTags + 1
	silent exe a:lineNum.'s/^ /*/'
      endif
      call s:NextChoice(1)
    endif
endfunction
" }}}

"----------------------------------------
" Go to the Next (/previous) possible choice. {{{
function! s:NextChoice(isForward)
  if a:isForward == 1
    /^\( \|\*\)\S\+/
  else
    ?^\( \|\*\)\S\+?
  endif
endfunction
" }}}

"----------------------------------------
" Mappings for the menu buffer {{{
  "----------------------------------------
  " Maps for the (splitted) choice window {{{
  " Rem: The first '<silent>' disable the display of ':silent call ...'
  "      The second ':silent' disable the displays coming from The execution
  "      of the functions.
  func! s:GrepEnterBuf()
    let b:NbTags = 0
    " map <enter> to edit a file, also dbl-click
    nnoremap <silent> <buffer> <esc>         :silent call <sid>GrepEditFileLine(<sid>Help_NbL())<cr>
    nnoremap <silent> <buffer> <cr>          :silent call <sid>GrepEditFileLine(line("."))<cr>
    nnoremap <silent> <buffer> <2-LeftMouse> :silent call <sid>GrepEditFileLine(line("."))<cr>
    " nnoremap <silent> <buffer> Q	  :call <sid>Reformat()<cr>
    nnoremap <silent> <buffer> <Left>	  :set tabstop-=1<cr>
    nnoremap <silent> <buffer> <Right>	  :set tabstop+=1<cr>
    nnoremap <silent> <buffer> t	  :silent call <sid>ToggleTag(line("."))<cr>
    nnoremap <silent> <buffer> <tab>	  :silent call <sid>NextChoice(1)<cr>
    nnoremap <silent> <buffer> <S-tab>	  :silent call <sid>NextChoice(0)<cr>
    nnoremap <silent> <buffer> h	  :silent call <sid>ToggleHelp()<cr>
  endfunc
  " }}}

  "----------------------------------------
  aug MuttAliases_GrepBuf " {{{
  au!
  au BufEnter search-results-* call <sid>GrepEnterBuf()
  aug END " }}}
" }}}

"----------------------------------------
" Looks if the header-field of the current line is either To:, Cc: or Bcc: {{{
function! s:MapTab(the_alias)
  if (strlen(a:the_alias) == 0)  || (a:the_alias !~ '^\S*$')
    " echo "-" . a:the_alias . "-\n"
    return "\t"
  endif
  let l = line('.')
  while l != 0
    let ll = getline(l)			" Current line
    if ll =~ '^\S\+:'			" ¿ Is an field ?
      if ll =~ s:fields			"   ¿ Is an address field ?
	return s:GrepAlias(a:the_alias)	"     Then grep the alias
	" let r = s:GrepAlias(a:the_alias)"     Then grep the alias
	" if "\<esc>a" != r | return r
	" else              | return r."\t"
	" endif
      else   | return "\t"		"     Otherwise, return <tab>
      endif
    else   | let l = l - 1		"   Otherwise, test previous line
    endif
  endwhile
endfunction
" }}}

"----------------------------------------
" Syntax for the (splitted) choice window. {{{
function! s:Syntax(...)
  if has("syntax")
    syn clear

    if a:0 > 0
      " exe 'syntax region GrepFind start=+\(^\|<\)+ end=/' . a:1 . '>\=/'
      exe 'syntax match GrepFind /' . a:1 . '/ contained'
    endif
    
    syntax region GrepLine  start='.' end='$' contains=GrepAlias
    syntax match GrepAlias /^./ contained nextgroup=GrepName contains=GrepFind
    syntax match GrepName /[^<]\+/ contained nextgroup=GrepAddress contains=GrepFind
    syntax region GrepAddress start='<' end='>' contained 
    
    syntax region GrepExplain start='#' end='$' contains=GrepStart,GrepFind
    syntax match GrepStart /#/ contained
    syntax match Statement /-none-of-these-/

    highlight link GrepExplain Comment
    highlight link GrepFind Search
    highlight link GrepStart Ignore
    highlight link GrepLine Normal
    highlight link GrepAlias SpecialChar
    highlight link GrepAddress Identifier
  endif
endfunction
" }}}

"----------------------------------------
" Help {{{
function! s:Add2help(msg, help_var)
  if (!exists(a:help_var))
    exe 'let ' . a:help_var . '   = a:msg'
    exe 'let ' . a:help_var . 'NB = 0'
  else
    exe 'let ' . a:help_var . ' = ' . a:help_var . '."\n" . a:msg'
  endif
  exe 'let ' . a:help_var . 'NB = ' . a:help_var . 'NB + 1 '
endfunction

if !exists(":MUAAHM")
  command! -nargs=1 MUAAHM call <sid>Add2help(<args>,"s:muaa_help")
  MUAAHM  "#| <cr>, <double-click> : Insert the current alias"
  MUAAHM  "#| <esc>                : Abort"
  MUAAHM  "#| <t>                  : (un)tag the current alias"
  MUAAHM  "#| <up>, <down>, <tab>  : Move between entries"
  MUAAHM  "#| <right>, <left>      : Change the tab stop alignment"
  MUAAHM  "#|"
  MUAAHM  "#| h                    : Don't display this help"
  MUAAHM  "#+-----------------------------------------------------------------------------"
  MUAAHM  "#"

  command! -nargs=1 MUAAHM call <sid>Add2help(<args>,"s:muaa_short_help")
  MUAAHM  "#| h                    : Display the help"
  MUAAHM  "#+-----------------------------------------------------------------------------"
  MUAAHM  "#"
endif

function! s:Help()
  if s:display_long_help	| return s:muaa_help
  else				| return s:muaa_short_help
  endif
endfunction

function! s:Help_NbL()
  " return 1 + nb lignes of BuildHelp
  if s:display_long_help	| return 2 + s:muaa_helpNB
  else				| return 2 + s:muaa_short_helpNB
  endif
endfunction

let s:display_long_help = 0
function! s:ToggleHelp()
  let s:display_long_help = 1 - s:display_long_help
  silent call s:RedisplayHelp()
endfunction

function! s:RedisplayHelp()
  2,$g/^#/d
  1 put = s:Help()
endfunction
" help  }}}

" }}}

" ===========================================================================
" vim60: set fdm=marker:
