#!/bin/bash

# Lista todos os executáveis disponíveis no PATH, remove duplicatas
executables=$(compgen -c | sort -u)

# Usa fzf para selecionar um programa
selected=$(echo "$executables" | fzf --prompt="Run > ")

# Verifica se algo foi selecionado
if [ -n "$selected" ]; then
  # Executa o programa selecionado na mesma janela
  exec "$selected"
else
  echo "Nenhum programa selecionado."
fi
