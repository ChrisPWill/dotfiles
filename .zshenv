export VISUAL=vim
export EDITOR="$VISUAL"
export PATH=~/bin:~/bin/notme:~/postman:$PATH
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 fdm=indent nomod noma nolist nonu nornu' -c 'nnoremap q :q<CR>' -\""
export PYTHONSTARTUP=~/.pythonrc
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib

# source $HOME/.dynamic-colors/completions/dynamic-colors.zsh

export MPD_HOST=192.168.1.82
export MPD_PORT=6600
