# Restore

## Restore requirements

- Work on a fresh server or fresh compose stack
- Restore the data directory before starting the containers
- Validate the app with `healthcheck.sh`

## Restore flow

1. Restore `/srv/apps/rustdesk/data`.
2. Start `hbbs` and `hbbr`.
3. Confirm the expected ports are listening.
