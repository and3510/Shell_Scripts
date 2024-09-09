#!/bin/bash

# Programa de backup pessoal

while true
do
    echo "O que voce quer fazer? [1] criar ou [2] deletar um backup ou [3] para sair"
    read choose

    if [ "$choose" == "1" ]; then
        echo "Digite a pasta da home:"
        read folder

        echo "Digite o nome do novo arquivo:"
        read file

        sudo tar czvf /mnt/backup/$file$(date +%d%m%Y-%X).tar.gz /home/anderson/$folder

        echo "Foi feito o backup da pasta $folder em $(date +%d%m%Y-%X)"
    elif [ "$choose" == "2" ]; then
        while true
        do
            ls -1t /mnt/backup | nl
            echo "----------------------"
            echo "Você quer [1] deletar um arquivo específico ou [2] deletar tudo ou [3] voltar?"
            read resposta


            if [ "$resposta" == "1" ]; then
                echo "Digite o número do arquivo que deseja deletar:"
                read number

                if ! [[ "$number" =~ ^[0-9]+$ ]]; then
                    echo "Erro: Entrada inválida. Por favor, insira um número."
                    continue
                fi

                file_to_delete=$(ls -1t /mnt/backup | sed -n "${number}p")

                if [ -n "$file_to_delete" ] && [ -e "/mnt/backup/$file_to_delete" ]; then
                    echo "Deletando o arquivo: $file_to_delete"
                    sudo rm "/mnt/backup/$file_to_delete"
                    echo "Arquivo deletado com sucesso!"
                else
                    echo "Número inválido ou arquivo não encontrado!"
                fi

            elif [ "$resposta" == "2" ]; then
                echo "Deletando todos os arquivos de backup..."
                sudo rm -f /mnt/backup/*
                echo "Todos os arquivos de backup foram deletados."

            elif [ "$resposta" == "3" ]; then
                clear
                break
            else
                echo "Escolha inválida! Por favor, selecione [1] ou [2] ou [3]."
            fi

        done

    elif [ "$choose" == "3" ]; then
        clear
        echo "Finalizado"
        break

    else
        echo "Selecione somente [1] ou [2] ou [3]"
    fi
done
