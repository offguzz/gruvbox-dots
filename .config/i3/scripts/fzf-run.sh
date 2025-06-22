#!/bin/bash

# Garante que o script falhe em caso de erro
set -e

# Gera uma lista de programas únicos disponíveis no PATH
apps=$(IFS=:; for dir in $PATH; do
    [ -d "$dir" ] && ls "$dir"
done | sort -u)

# Usa fzf para selecionar o programa
selection=$(echo "$apps" | fzf --prompt="Launch: " --height=40% --reverse)

# Se nada for selecionado, sai silenciosamente
[ -z "$selection" ] && exit 0

# Executa o programa selecionado como processo em segundo plano, para aplicações gráficas
# Redireciona stdout/stderr para não poluir a saída
nohup "$selection" >/dev/null 2>&1 &
