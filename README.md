# Dockerize ESCPOS Tools

This is dockerize version of ESCPOS tools

The tools can be found at [receipt-print-hq/escpos-tools
](https://github.com/receipt-print-hq/escpos-tools)

## Prerequisite

- Docker CE ([MAC](https://hub.docker.com/editions/community/docker-ce-desktop-mac))([WIN](https://hub.docker.com/editions/community/docker-ce-desktop-windows))([LINUX](https://docs.docker.com/install/linux/docker-ce/ubuntu/))

## Installation
```
$> git clone https://github.com/wilson-ng/dockerize-escpos-tools.git
$> docker build . -t escpos-tools-dockerize:1.0-alpine
```

## Usage
```
$> ./esc2html.sh [FILE.BIN]
$> open FILE.html
```
example
```
$> ./esc2html.sh receipt-with-logo.bin
$> open receipt-with-logo.html
```
