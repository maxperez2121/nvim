#!/bin/bash

#kitty --class nvimunity -e nvr --servername "/tmp/nvimunity" --remote-tab-silent $@
absolute_path=$(realpath "$@")
absolute_path=$(awk '{ gsub("+0^@",""); print}')

kitty --class nvimunity -e nvim --server /tmp/nvim.sock --remote "$absolute_path"
