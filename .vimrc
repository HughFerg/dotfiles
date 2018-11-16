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

execute pathogen#infect()

autocmd vimenter * let &shell='/bin/zsh -i'

augroup markdown
  au BufFilePre,BufRead,BufNewFile *.[mM][dD] call SetMarkdownKeybinds()
  function SetMarkdownKeybinds()
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

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

try
source ~/.vim_runtime/my_configs.vim
catch
endtry
