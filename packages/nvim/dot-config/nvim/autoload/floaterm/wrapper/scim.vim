" floaterm wrapper for sc-im 

function! s:get_visual_selection()
  "https://stackoverflow.com/a/6271254
  " Why is this not a built-in Vim script function?!
  let [line_start, column_start] = getpos("'<")[1:2]
  let [line_end, column_end] = getpos("'>")[1:2]
  let lines = getline(line_start, line_end)
  if len(lines) == 0
      return ''
  endif
  let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][column_start - 1:]
  return lines
endfunction

function! floaterm#wrapper#scim#(cmd, jobopts, config) abort
  let s:tab_file = tempname()
  "let s:selection = s:get_visual_selection()
  "if !empty(s:selection)
    "call writefile(s:selection, s:tab_file)
  "endif
  let cmd = 'sc-im' . ' --txtdelim="|" ' . s:tab_file

  "let cmd = a:cmd . ' > ' . s:scim_md_tmpfile
  "let a:jobopts.on_exit = funcref('s:scim_callback')
  return [v:false, cmd]
endfunction

"function! s:scim_callback(...) abort
"  if filereadable(s:scim_md_tmpfile)
"    let filenames = readfile(s:scim_md_tmpfile)
"    if !empty(filenames)
"      if has('nvim')
"        call floaterm#window#hide(bufnr('%'))
"      endif
"      let locations = []
"      for filename in filenames
"        let dict = {'filename': fnamemodify(filename, ':p')}
"        call add(locations, dict)
"      endfor
"      call floaterm#util#open(locations)
"    endif
"  endif
"endfunction
"

"sc --export_mkd --quit_afterload --output="test.md" test.sc > check.md
