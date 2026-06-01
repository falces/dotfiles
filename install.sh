#!/usr/bin/env bash

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SOURCE="${REPO_DIR}/claude-skills"
SKILLS_TARGET="${HOME}/.claude/skills"

if [ ! -d "${SKILLS_SOURCE}" ]; then
  echo "Error: no se encontró la carpeta '${SKILLS_SOURCE}'" >&2
  exit 1
fi

mkdir -p "${HOME}/.claude"

if [ -L "${SKILLS_TARGET}" ]; then
  echo "Ya existe un enlace simbólico en ${SKILLS_TARGET}, se reemplazará."
  rm "${SKILLS_TARGET}"
elif [ -e "${SKILLS_TARGET}" ]; then
  echo "Error: '${SKILLS_TARGET}' ya existe y no es un enlace simbólico. Elimínalo manualmente." >&2
  exit 1
fi

ln -s "${SKILLS_SOURCE}" "${SKILLS_TARGET}"
echo "Enlace simbólico creado: ${SKILLS_TARGET} -> ${SKILLS_SOURCE}"
