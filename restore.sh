#!/usr/bin/env bash
set -euo pipefail

APP_NAME="rustdesk"
APP_ROOT="${APP_ROOT:-/srv/apps/${APP_NAME}}"
BACKUP_DIR="${1:-}"

if [ -z "${BACKUP_DIR}" ]; then
  echo "usage: ./restore.sh /path/to/backup-dir" >&2
  exit 1
fi

tar -C "${APP_ROOT}" -xzf "${BACKUP_DIR}/data.tar.gz"
cp "${BACKUP_DIR}/docker-compose.yml" "${APP_ROOT}/docker-compose.yml"
echo "restored ${APP_NAME} from ${BACKUP_DIR}"
