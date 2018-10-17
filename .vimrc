set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

set clipboard=unnamed

set formatoptions-=tc

function PandocExport(type)
  exe ":!pandoc % -o %." . a:type
  exe ":!mimeopen %." . a:type . ""
endf

augroup markdown
  au BufFilePre,BufRead,BufNewFile *.[mM][dD] call SetMarkdownKeybinds()
  function SetMarkdownKeybinds()
    IndentLinesDisable
    set filetype=markdown.pandoc
    autocmd BufRead,BufNewFile *.md setlocal spell
    autocmd BufRead,BufNewFile *.md set complete+=kspell
    no <Leader>pp :call PandocExport("pdf")<CR><CR>
    no <Leader>p[ :call PandocExport("pdf")<CR>
    no <Leader>ph :call PandocExport("html")<CR><CR>
    no <Leader>pd :call PandocExport("docx")<CR><CR>
  endf
augroup END

set spell spelllang=en_us

try
source ~/.vim_runtime/my_configs.vim
catch
endtry
