#!/bin/bash

# Mensagem padrão para o commit
DEFAULT_COMMIT_MESSAGE="Atualizações automáticas em scripts .sh"

# Percorre os repositórios Git dentro do diretório atual e verifica alterações
for repo in $(find . -type d -name ".git" | sed 's|/\.git||'); do
    echo "Verificando alterações no repositório: $repo"
    cd "$repo" || exit 1
    
    # Verifica se há alterações nos arquivos .sh
    CHANGED_FILES=$(git status --porcelain | grep '\.sh' | wc -l)
    
    if [ "$CHANGED_FILES" -gt 0 ]; then
        echo "Alterações encontradas em scripts .sh. Realizando commit..."
        git add .
        git commit -m "$DEFAULT_COMMIT_MESSAGE"
        git push
        echo "Alterações enviadas com sucesso em $repo"
    else
        echo "Nenhuma alteração em arquivos .sh no repositório: $repo"
    fi
    
    # Retorna ao diretório anterior
    cd - > /dev/null || exit 1
done

echo "Processo concluído!"
