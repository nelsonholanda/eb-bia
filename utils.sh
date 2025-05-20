erro() {
    echo "##############################";
    echo "########## Erro: $1 ##########";
    echo "##############################";
}

checar_ultimo_comando() {
    if [ $? != 0 ]; then
        erro "Falha ao executar o comando. Parando tudo..."
    exit 1;
    fi
}
