#!/bin/sh

docker run --rm -it -v $(pwd):/escpos-tools/bin/ escpos-tools-dockerize:1.0-alpine esc2html "/escpos-tools/bin/$1" > "${1%".bin"}.html"
