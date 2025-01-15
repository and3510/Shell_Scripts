#!/bin/bash

# Caminho inicial para buscar os repositórios
BASE_DIR=${1:-.}  # Use o diretório atual se nenhum argumento for passado

# Função para verificar alterações em um repositório Git
check_git_status() {
    local repo_dir=$1
    cd "$repo_dir" || return

    # Verifica se há alterações pendentes
    if git diff --quiet && git diff --cached --quiet; then
        echo "✔️  Sem alterações pendentes em: $repo_dir"
    else
        echo "⚠️  Alterações pendentes em: $repo_dir"
    fi

    cd - > /dev/null || exit
}

# Buscar diretórios contendo .git e verificar o status
find "$BASE_DIR" -type d -name ".git" | while read -r git_dir; do
    repo_dir=$(dirname "$git_dir")
    check_git_status "$repo_dir"
done



