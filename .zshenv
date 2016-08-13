export VISUAL=vim
export EDITOR="$VISUAL"
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 fdm=indent nomod noma nolist nonu nornu' -c 'nnoremap q :q<CR>' -\""
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib
