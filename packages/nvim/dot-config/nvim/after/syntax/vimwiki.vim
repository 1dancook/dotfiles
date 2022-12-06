" vim wiki doesn't have syntax highlighting for
" markdown blockquotes so this will work

syn region mkdItalic matchgroup=mkdItalic start="\%(\*\)" end="\%(\*\)"
syn region mkdBold matchgroup=mkdBold start="\%(\*\*\)"  end="\%(\*\*\)"
syn region mkdBoldItalic matchgroup=mkdBoldItalic start="\%(\*\*\*\)"    end="\%(\*\*\*\)"
syn region mkdBlockquote  start=/^\s*> /  end=/$/ contains=mkdItalic,mkdBold,mkdBoldItalic

highlight mkdBold ctermfg=magenta cterm=bold
highlight mkdItalic ctermfg=cyan cterm=italic
highlight mkdBoldItalic ctermfg=magenta cterm=bold,italic
"highlight def link mkdBlockquote comment
highlight def link mkdBlockquote Comment


" custom colors for vimwiki links
highlight VimWikiLink ctermfg=cyan
