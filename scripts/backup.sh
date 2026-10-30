#!/usr/bin/env bash
# Sovereign Home Cloud: backup TEMPLATE
#
# ⚠️  This is a starting point, not a guarantee. Read it, adapt it, TEST A RESTORE.
# Default mode is a DRY RUN: it shows what would be copied without copying.
# To really run:  ./backup.sh --run
#
# What it does:
#   1. (Optional) puts Nextcloud in maintenance mode
#   2. rsyncs the Immich library and Nextcloud data to a backup drive
#   3. takes Nextcloud out of maintenance mode
#
# Things you must adapt:
#   - the paths below
#   - the Nextcloud database dump (depends on your DB: Postgres/MariaDB/SQLite)
#   - the Immich database backups (Immich makes automatic dumps; make sure they're inside IMMICH_LIBRARY)
#   - an OFFSITE encrypted copy (e.g. restic/borg/rclone-crypt) for the "1" in 3-2-1

set -euo pipefail

# ---------- CONFIG: edit these ----------
IMMICH_LIBRARY="/Volumes/PhotoDrive/immich"          # your UPLOAD_LOCATION
NEXTCLOUD_DATA="/Volumes/PhotoDrive/nextcloud"       # data + config folder(s)
BACKUP_ROOT="/Volumes/BackupDrive/home-cloud-backup"  # destination
NEXTCLOUD_CONTAINER="nextcloud"                       # container name (docker ps)
USE_MAINTENANCE_MODE=true
# ----------------------------------------

DRY_RUN="--dry-run"
if [[ "${1:-}" == "--run" ]]; then
  DRY_RUN=""
  echo "▶ REAL RUN"
else
  echo "▶ DRY RUN (nothing will be copied). Use --run to back up for real."
fi

# Sanity checks
for p in "$IMMICH_LIBRARY" "$NEXTCLOUD_DATA"; do
  [[ -d "$p" ]] || { echo "✖ Source not found: $p"; exit 1; }
done
[[ -d "$(dirname "$BACKUP_ROOT")" ]] || { echo "✖ Backup drive not mounted: $BACKUP_ROOT"; exit 1; }
mkdir -p "$BACKUP_ROOT"/{immich,nextcloud}

maintenance_off() {
  if [[ "$USE_MAINTENANCE_MODE" == true && -z "$DRY_RUN" ]]; then
    docker exec -u www-data "$NEXTCLOUD_CONTAINER" php occ maintenance:mode --off || true
  fi
}
trap maintenance_off EXIT

if [[ "$USE_MAINTENANCE_MODE" == true && -z "$DRY_RUN" ]]; then
  echo "• Nextcloud → maintenance mode"
  docker exec -u www-data "$NEXTCLOUD_CONTAINER" php occ maintenance:mode --on
fi

# --- TODO: dump the Nextcloud database here. Example for a Postgres container named nextcloud-db:
# docker exec nextcloud-db pg_dump -U nextcloud nextcloud > "$BACKUP_ROOT/nextcloud/db-$(date +%F).sql"

echo "• Syncing Immich library…"
rsync -a --delete $DRY_RUN --info=stats1 "$IMMICH_LIBRARY/" "$BACKUP_ROOT/immich/"

echo "• Syncing Nextcloud data…"
rsync -a --delete $DRY_RUN --info=stats1 "$NEXTCLOUD_DATA/" "$BACKUP_ROOT/nextcloud/"

echo "✔ Finished $(date)"
echo "  Reminder: test restoring a few files. Offsite copy still needed."
