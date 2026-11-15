#!/usr/bin/env bash
# Bygger index.html (selvstændig webapp) ud fra app.html.
# Uden for claude.ai gemmes opskrifterne lokalt på enheden, og indsat tekst fortolkes uden Claude.
set -euo pipefail
cd "$(dirname "$0")"
{
  printf '<!doctype html>\n<html lang="da">\n<head>\n<meta charset="utf-8">\n'
  printf '<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">\n'
  printf '<meta name="theme-color" content="#2c6a4b">\n<meta name="apple-mobile-web-app-capable" content="yes">\n'
  printf '<meta name="apple-mobile-web-app-title" content="Kogebog">\n<link rel="manifest" href="manifest.webmanifest">\n'
  printf '<style>:root{padding-top:env(safe-area-inset-top);padding-bottom:env(safe-area-inset-bottom)}body{margin:0}[hidden]{display:none!important}</style>\n'
  printf '</head>\n<body>\n'
  cat app.html
  printf '\n</body>\n</html>\n'
} > index.html
