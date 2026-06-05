#!/usr/bin/env bash
set -euo pipefail

docker inspect rustdesk_hbbs >/dev/null
docker inspect rustdesk_hbbr >/dev/null

for c in rustdesk_hbbs rustdesk_hbbr; do
  running="$(docker inspect -f '{{.State.Running}}' "${c}")"
  [ "${running}" = "true" ] || {
    echo "${c} is not running" >&2
    exit 1
  }
done

ss -ltn | grep -Eq ':(21115|21116|21117|21118|21119)\b'
echo "rustdesk healthcheck passed"
