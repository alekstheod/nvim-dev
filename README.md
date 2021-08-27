
```
            _                     _            
 _ ____   _(_)_ __ ___         __| | _____   __
| '_ \ \ / / | '_ ` _ \ _____ / _` |/ _ \ \ / /
| | | \ V /| | | | | | |_____| (_| |  __/\ V / 
|_| |_|\_/ |_|_| |_| |_|      \__,_|\___| \_/  

```
  
# nvim-dev is a set of configurations for neovim which makes the developers life easier

## Core plugins are:
* LSP - https://github.com/prabirshrestha/vim-lsp
* FZF - https://github.com/junegunn/fzf.vim
* Autoformatter - https://github.com/vim-autoformat/vim-autoformat
* VimRooter - https://github.com/airblade/vim-rooter
* NerdTree - https://github.com/preservim/nerdtree
* Powerline - https://github.com/vim-airline/vim-airline



Based on above plugins there are additional features which makes the development workflow smoother.

```<leader>``` is set to space


### Open recent files
![open_recent](https://user-images.githubusercontent.com/976614/131179989-1b11ff36-a31a-4ceb-83fb-741d624d7192.gif)

key mapping: <leader> re

            
### Close multiple buffers through fzf
![close_files](https://user-images.githubusercontent.com/976614/131180182-5cd8b38c-a2e6-4625-aae2-093d95da5aa2.gif)
            
key mapping: <leader> bb
ctrl+space to mark the file while in the fzf popup
        
            
### Insert path using fzf
![insert_path_fzf](https://user-images.githubusercontent.com/976614/131183880-07fa5a0b-74fc-4ac0-9115-2ebb3eb9b41d.gif)
            
While in insert mode press ctrl+f and select the needed file
