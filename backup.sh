#!/usr/bin/env bash
set -euo pipefail

APP_NAME="rustdesk"
APP_ROOT="${APP_ROOT:-/srv/apps/${APP_NAME}}"
BACKUP_ROOT="${BACKUP_ROOT:-/srv/backupssd/${APP_NAME}}"
STAMP="$(date -u +%Y%m%dT%H%M%SZ)"
TARGET_DIR="${BACKUP_ROOT}/${STAMP}"

mkdir -p "${TARGET_DIR}"
cat > "${TARGET_DIR}/MANIFEST.txt" <<EOF
app=${APP_NAME}
source=${APP_ROOT}
created_utc=${STAMP}
EOF

tar -C "${APP_ROOT}" -czf "${TARGET_DIR}/data.tar.gz" data
cp "${APP_ROOT}/docker-compose.yml" "${TARGET_DIR}/docker-compose.yml"
sha256sum "${TARGET_DIR}/data.tar.gz" "${TARGET_DIR}/docker-compose.yml" > "${TARGET_DIR}/SHA256SUMS"
echo "${TARGET_DIR}"
