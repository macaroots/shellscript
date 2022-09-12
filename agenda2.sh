#!/bin/bash

pasta='agenda'
mkdir -p $pasta

while true; do
    echo 1. Cadastrar
    echo 2. Listar
    echo 3. Procurar
    echo 4. Sair
    read opcao
    case $opcao in
        '1')
            echo Cadastrar
            read -p 'Nome: ' nome
            read -p 'Telefone: ' telefone
            echo $nome : $telefone > "$pasta/$nome"
            ;;
        '2')
            echo Listar
            ls $pasta
            ;;
        '3')
            echo Procurar
            read -p 'Nome: ' nome
            grep $nome $pasta/*
            ;;
        *)
            echo Tchau!
            break
            ;;
    esac
done

