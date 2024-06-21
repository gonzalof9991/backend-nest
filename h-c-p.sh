#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <mensaje-del-commit>"
    exit 1
fi

COMMIT_MSG=$1

BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)

if [ -z "$BRANCH_NAME" ]; then
    echo "No se pudo determinar la rama actual."
    exit 1
fi

echo "Rama actual: $BRANCH_NAME"

git add .

git commit -m "$COMMIT_MSG"

git push origin "$BRANCH_NAME"
