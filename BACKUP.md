# Backup

Backups should be written to `/srv/backupssd/rustdesk/`.

## Backup requirements

- Backup of the RustDesk data directory
- Verification that the backup archive exists and is readable
- Preserve the key material that is stored in the data directory

## Current live backup surface

- `/srv/apps/rustdesk/data`
