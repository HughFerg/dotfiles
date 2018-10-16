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

try
source ~/.vim_runtime/my_configs.vim
catch
endtry
