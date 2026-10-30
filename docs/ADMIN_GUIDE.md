# Admin Guide: Running Immich + Nextcloud on a Mac mini

> This guide covers the **operational and security side**. For installation steps, follow the official docs (they change between versions):
> - Immich: <https://immich.app/docs/overview/quick-start>
> - Nextcloud: <https://docs.nextcloud.com/server/latest/admin_manual/>

## 1. My setup 

| Machine | Mac mini M2 Pro with 16gb ram |
| macOS version | Big Sur |
| Container runtime | [Docker Desktop / OrbStack / Colima] |
| Immich version | [3.0.1] |
| Nextcloud version | [25 Autumn] |
| Photo library location | `[/Volumes/…/immich]` |
| Nextcloud data location | `[/Volumes/…/nextcloud]` |
| Remote access method | [Tailscale / Cloudflare Tunnel] |
| Backup drive | [990 PRO, 2TB] |

## 2. Mac mini hardening and reliability

- [ ] **FileVault on** (System Settings → Privacy & Security). Note: after a reboot the Mac may wait for a password before services start; decide how you'll handle that. I would recommend to turn auto-login on.
- [ ] **Automatic login/startup:** decide deliberately. Convenience (auto-start after power cut) vs. security (disk stays locked until you log in).
- [ ] **Prevent sleep:** System Settings → Energy → *Prevent automatic sleeping when the display is off* ✔
- [ ] **Start up automatically after a power failure** ✔
- [ ] **Container runtime starts at login** and containers use `restart: unless-stopped`
- [ ] **macOS firewall on**, and automatic security updates on
- [ ] **Strong admin password**, separate from any user account
- [ ] **Static local IP or DHCP reservation** for the Mac mini on your router
- [ ] Consider a small **UPS** (battery backup) to protect drives from sudden power loss
- [ ] Keep photo/library data on a drive with **plenty of free space** (aim to stay below ~80% full)

## 3. Remote access without opening your router

The safest simple approach for a small community: **don't expose the services to the public internet.** Use a private mesh VPN such as [Tailscale](https://tailscale.com) (or an equivalent you trust).

1. Install Tailscale on the Mac mini and on each user's device.
2. Use the Mac's Tailscale name (MagicDNS) or the Tailscale HTTPS certificate feature to give clean addresses (see Tailscale docs).
3. Share the Mac mini with other people's tailnets if they don't want to join yours (see Tailscale's *node sharing*).
4. **Avoid router port-forwarding** unless you fully understand the risk and have a reverse proxy, TLS, strong auth and a patching routine.

> Trade-off: Tailscale is a third-party coordination service. Data goes device-to-device encrypted, but you still rely on a company for the control plane. Open-source alternatives exist (e.g. Headscale).

## 4. Security checklist

- [ ] Unique, long **passwords** for every account (use a password manager, e.g. Bitwarden/Vaultwarden)
- [ ] **Two-factor authentication** on the admin accounts (Nextcloud supports TOTP; check Immich's current options)
- [ ] **Separate admin and personal accounts** (don't browse photos as admin)
- [ ] **Registration closed**: users are created by the admin only
- [ ] Database ports **not published** to the host/network unless needed
- [ ] `.env` and secrets are **outside the git repo** (or git-ignored)
- [ ] **Pin versions** in compose files; read release notes before updating (Immich in particular can have breaking changes between releases)
- [ ] Review each app's **external connections** (map tiles, update checks, notifications, telemetry) and disable what you don't want. Record what you changed in your notes.
- [ ] Share links: encourage **passwords + expiry**
- [ ] Log of who has an account, and when it was last reviewed

## 5. Updating safely

1. Read release notes for the new version (**especially "breaking changes"**).
2. **Run a backup first** (`scripts/backup.sh`).
3. Update one service at a time.
4. Check that it starts, you can log in, and a photo/file opens.
5. Note the date and version in your log.

Rule of thumb: update **regularly but not instantly**. Wait a few days after a big release, unless it's a security fix.

## 6. Backups: the 3-2-1 rule

> **3** copies of your data, on **2** different types of storage, with **1** offsite.

| Copy | Where | Notes |
|---|---|---|
| 1. Live data | Mac mini internal/external drive | The working copy |
| 2. Local backup | Separate external drive | Automated, e.g. nightly |
| 3. Offsite | Encrypted copy at another location or provider | **Encrypt before it leaves**; you should hold the key |

What to back up (check current official docs for each app):

- **Immich:** the upload/library location (originals), plus the database. Immich creates automatic database dumps; confirm where they're stored and that they're included in your backup. See the official *Backup and restore* docs.
- **Nextcloud:** the data directory, `config`, and the database. For a consistent copy, use **maintenance mode** while copying.
- **Your compose files and `.env`** (stored securely, *not* in public GitHub).

The included [`scripts/backup.sh`](../scripts/backup.sh) is a **starting template**. It defaults to a dry run. Adapt and test it.

### ⚠️ A backup you haven't restored is a hope, not a backup

Schedule a **restore test** every few months:

- [ ] Restore a few photos and files to a different folder/machine
- [ ] Confirm they open and dates/albums are intact
- [ ] Write down how long it took and what went wrong

## 7. Adding a new user (onboarding)

1. Have the person read and agree to the [house rules](../templates&service-agreements&service-agreements/house-rules.md).
2. Create their accounts in Immich and Nextcloud with **temporary passwords**.
3. Give them the [onboarding handout](../templates&service-agreements&service-agreements/family-onboarding-handout.md) *in person*.
4. Sit with them for the first setup (15 minutes).
5. Check their first backup is running, and that they've changed the password.
6. Note the date in your user log (name, date joined, consent recorded, **not** passwords).

## 8. Offboarding a user

1. Export their photos and files and hand them over.
2. Confirm they have their data.
3. Delete their accounts and data (also from backups when practical; note your retention period in the house rules).
4. Record the date.

## 9. Monitoring (keep it simple)

- Run [`scripts/health-check.sh`](../scripts/health-check.sh) manually or on a schedule.
- Check disk space monthly.
- Optionally use a self-hosted uptime tool (e.g. Uptime Kuma) or a simple phone reminder.

## 10. Troubleshooting

| Symptom | First things to check |
|---|---|
| Can't reach services | Is the Mac awake? Is the container runtime running? Is Tailscale connected? |
| Containers restarting | `docker ps -a`, then `docker logs <container> --tail 100` |
| Slow face recognition/search | Machine-learning job running? Check job queue in Immich admin |
| Disk filling up | `du -sh` on library, thumbnails, Nextcloud trash/versions |
| Mobile backup stuck | Phone battery saver, background app refresh, Wi-Fi-only setting, app updated? |

## 11. Succession plan

Self-hosted services need a *human* plan. Write down:

- Who gets the keys if I'm unavailable? (a sealed envelope, a password manager emergency kit)
- How much notice will users get if the service ends? [e.g. 60 days]
- How will data be returned to them?

Add it to the FAQ so users know too.
