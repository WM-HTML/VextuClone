#!/data/data/com.termux/files/usr/bin/bash
# network.sh - funciones propias para descargar archivos HTTP

function download_file() {
    local url="$1"
    local dest="$2"

    # Obtener host y path
    host=$(echo "$url" | sed -E 's#https?://([^/]+)/.*#\1#')
    path=$(echo "$url" | sed -E 's#https?://[^/]+(/.*)#\1#')

    # Solo HTTP simple
    exec 3<>/dev/tcp/$host/80
    echo -e "GET $path HTTP/1.0\r\nHost: $host\r\n\r\n" >&3

    # Guardar body (ignorar cabecera HTTP)
    tail -n +$(grep -n -m1 "^$" <&3 | cut -d: -f1) <&3 > "$dest"

    exec 3>&-
    exec 3<&-
}
