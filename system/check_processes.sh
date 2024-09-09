#!/bin/bash

# ESte programa tem como objetivo checar os processos

output_file="processos_info_$(date +%Y%m%d_%H%M%S).txt"


# Funções Criadas

# ------------------------------------------

capturar_todos_processos() {
    echo "Capturando todos os processos..."
    ps aux --sort=-%mem,-%cpu > "/home/anderson/processes_registred/$output_file"
    echo "Informações de todos os processos foram salvas em $output_file"
}

filtrar_por_usuario() {
    read -p "Digite o nome do usuário: " usuario
    echo "Capturando processos do usuário $usuario..."
    ps -u "$usuario" --sort=-%mem,-%cpu > "/home/anderson/processes_registred/$output_file"
    echo "Informações dos processos do usuário $usuario foram salvas em $output_file"
}

filtrar_por_palavra_chave() {
    read -p "Digite a palavra-chave (ex: nome do comando): " palavra_chave
    echo "Capturando processos com a palavra-chave $palavra_chave..."
    ps aux | grep -i "$palavra_chave" | grep -v "grep" > "/home/anderson/processes_registred/$output_file"
    echo "Informações dos processos filtrados por '$palavra_chave' foram salvas em $output_file"
}

mostrar_menu() {
    echo "Selecione uma opção:"
    echo "1) Capturar todos os processos"
    echo "2) Filtrar processos por usuário"
    echo "3) Filtrar processos por palavra-chave"
    echo "4) Sair"
    read -p "Digite a opção desejada: " opcao
}

# --------------------------------------------------

while true; do
    mostrar_menu
    case $opcao in
        1) capturar_todos_processos ;;
        2) filtrar_por_usuario ;;
        3) filtrar_por_palavra_chave ;;
        4) echo "Saindo..."; break ;;
        *) echo "Opção inválida, tente novamente." ;;
    esac
done
