#!/data/data/com.termux/files/usr/bin/bash
# parser.sh - funciones para extraer archivos de HTML

function extract_css()  { grep -oP 'href="\K[^"]+\.css' "$1"; }
function extract_js()   { grep -oP 'src="\K[^"]+\.js' "$1"; }
function extract_json() { grep -oP 'src="\K[^"]+\.json' "$1"; }
function extract_img()  { grep -oP 'src="\K[^"]+\.(png|jpg|jpeg|svg|gif)"' "$1"; }
