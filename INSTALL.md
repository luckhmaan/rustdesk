# Install

## Prerequisites

- Ubuntu Server
- Docker Engine
- Docker Compose plugin
- Data restored to `/srv/apps/rustdesk/data`
- Host network ports remain available for `hbbs` and `hbbr`

## Install steps

1. Clone the repository into `/srv/apps/rustdesk`.
2. Restore `/srv/apps/rustdesk/data`.
3. Start the `hbbs` and `hbbr` containers.
4. Confirm the ports used by RustDesk remain reachable.
5. Run `healthcheck.sh`.
