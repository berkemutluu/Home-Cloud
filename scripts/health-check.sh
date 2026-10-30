#!/usr/bin/env bash
# Sovereign Home Cloud: quick health check (run manually or on a schedule)
set -uo pipefail

DISKS=("/" "/Volumes/PhotoDrive" "/Volumes/BackupDrive")   # edit
WARN_PERCENT=80

echo "=== Home Cloud health check: $(date) ==="

echo; echo "--- Containers ---"
if command -v docker >/dev/null 2>&1; then
  docker ps --format 'table {{.Names}}\t{{.Status}}'
  echo; echo "Stopped/unhealthy containers:"
  docker ps -a --filter "status=exited" --filter "status=restarting" --format '  ⚠ {{.Names}} ({{.Status}})' || true
else
  echo "docker not found; is the container runtime running?"
fi

echo; echo "--- Disk space ---"
for d in "${DISKS[@]}"; do
  if [[ -d "$d" ]]; then
    used=$(df -P "$d" | awk 'NR==2 {gsub("%","",$5); print $5}')
    flag="✔"; [[ "$used" -ge "$WARN_PERCENT" ]] && flag="⚠"
    echo "$flag $d is ${used}% full"
  else
    echo "✖ $d not mounted"
  fi
done

echo; echo "--- Reminders ---"
echo "• Last backup tested by restore? (every ~3 months)"
echo "• Any updates pending? Read release notes first."
