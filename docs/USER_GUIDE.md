# 📖 User Guide: Your Private Photo & File Cloud

*No technical knowledge needed. If anything here is confusing, feel free to ask the Administrator*

---

## 1. What is this?

Think of Google Photos, iCloud or Dropbox, but instead of your photos living in a giant company's data centres, they live on **one small computer (a Mac mini in this example, windows and linux can also be used) at your house**, owned and looked after by you.

| What you do | App you will use | Works like |
|---|---|---|
| Back up and browse photos & videos | **Immich** | Google Photos |
| Store and share files and documents | **Nextcloud** | Google Drive / Dropbox |

**What's different?**

- 🔒 Your photos are **not scanned to train AI** or to build an advertising profile of you.
- 💸 There is **no subscription** and no "storage full" pop-up asking for money.
- 🏠 You know **exactly where** your data is and who looks after it.

**What's the catch?** See [What to expect](#9-what-to-expect-honest-version) below. This is a small, volunteer-run service, not a big company.

---

## 2. Before you start: you will need

- [ ] Your **username and temporary password** ("The Administrator"' will give you these in person, never by public message)
- [ ] Your phone (iPhone or Android) or computer
- [ ] About **15 minutes**
- [ ] The **private connection app** (Tailscale) if you want access away from home. "The Administrator" willl help you set it up once.

> **Why a "private connection"?** Instead of leaving the server open to the entire internet, only devices "The Administrator"'ve approved can even *see* it. It's like a private door instead of a public one.

---

## 3. Set up the Photos app (Immich)

1. **Install the app**
   - iPhone: App Store → search **Immich**
   - Android: Play Store → search **Immich**
2. **Open it** and, when asked for the *server URL*, type:
   `https://photos.YOUR-ADDRESS-HERE`
   *("The Administrator" will write this on your handout.)*
3. **Log in** with the username and temporary password "The Administrator" gave you.
4. **Change your password** when asked. Choose something long, like three or four random words ("copper-lantern-river-sleepy"). Don't reuse a password from another site.
5. **Turn on backup:** tap the **cloud icon** (top of the screen) → **Backup** → choose which albums to back up (e.g. *Recents*) → switch on **Backup**.
6. **Be patient the first time.** Your first backup could take hours, or days if you have 10 years of photos. Keep the app open and the phone charging, ideally on Wi-Fi.

✅ **Success looks like:** your photos appear in the Immich app on your phone *and* on the web page.

> ⚠️ **Do not delete photos from your phone yet.** Wait until you've seen them safely in Immich, and until "The Administrator"'ve confirmed the backup copies are working.

---

## 4. Everyday things in Photos

| "The Administrator" want to… | Do this |
|---|---|
| Find a photo | Tap the **search** icon and type what's in it: "beach", "birthday", "dog". Immich understands the picture. |
| Find photos of a person | **Explore → People**. Name a face once and Immich groups them. |
| Make an album | **Albums → New album** → add photos |
| Share with family | Open an album → **Share** → choose a person on the server, or create a **link** |
| See where photos were taken | **Map** tab |
| Remove a photo | Select it → **Delete**. It goes to **Trash** first, so you can undo. |

**About face recognition:** It runs **on the Mac mini only**. Names and faces are not sent to any company. If you'd rather not use it, tell "The Administrator" and "The Administrator" will switch it off for your account.

---

## 5. Set up the Files app (Nextcloud)

1. Install **Nextcloud** from your app store.
2. Choose **Log in** and enter the server address: `https://files.YOUR-ADDRESS-HERE`
3. Your phone will open a web page asking you to log in and **Grant access**. Tap it.
4. Done. Your files appear. Tap **+** to upload.

**On a computer:** download the **Nextcloud Desktop** app from <https://nextcloud.com/install/#install-clients>. It creates a folder that syncs automatically, like Dropbox.

---

## 6. Everyday things in Files

| User wants to… | Do this |
|---|---|
| Upload a file or Folder | Tap **+** → **Upload** |
| Share a file with a person/people | Tap **⋯** on the file → **Share** → type their name |
| Share a link with someone outside | **Share → Share link**. **Set a password and expiry date** ✔ |
| Get back an older version | **⋯ → Versions** |
| Recover a deleted file | **Deleted files** in the sidebar |

---

## 7. Staying safe (golden rules)

1. 🔑 **Never share your password.** Not even with "The Administrator". "The Administrator" can reset it without knowing it.
2. 🔗 **Share links are like keys.** Anyone with the link can see the content. Use passwords and expiry dates for anything private.
3. 📱 **Keep your phone updated** and use a screen lock.
4. 🎣 **Beware of fake messages.** "The Administrator" will never ask for your password by message, email or phone.
5. 💾 **This is a backup, not a magic vault.** Keep important originals in two places. (See [house rules](../templates&service-agreements/house-rules.md).)

---

## 8. Something's not working

| Problem | Try this |
|---|---|
| Can't connect | Check your phone has internet. If you're away from home, open the **Tailscale** app and make sure it's **On**. |
| Photos not backing up | Open Immich and keep it open. Check Wi-Fi, battery saver and "Backup" is switched on. |
| Forgot password | Message "The Administrator". "The Administrator" will reset it. |
| Server seems down | Wait 10 minutes, then message "The Administrator". "The Administrator" will check it. |
| Something looks wrong or suspicious | **Stop and tell "The Administrator"** before clicking anything |

**How to reach "The Administrator":** [phone / chat / email]

---

## 9. What to expect (honest version)

- ⏱ It's run by a volunteer, so **"The Administrator" can't promise 24/7 uptime**. Occasionally it will be offline for updates.
- 💾 "The Administrator" make **backups**, but please don't treat this as your *only* copy of irreplaceable things until we've tested a restore together.
- 👀 As the administrator, "The Administrator" **technically could** access files on the server. "The Administrator" promise not to, and the [house rules](../templates&service-agreements/house-rules.md) explain what "The Administrator" will and won't do. If that doesn't feel right to you, you're free to say no or to leave at any time, and "The Administrator" will help you take your data with you.
- 🚪 **You can leave whenever you like.** "The Administrator" will help you export everything.

---

## 10. Glossary

| Word | Meaning |
|---|---|
| **Server** | A computer that is always on, and which other devices connect to |
| **Self-hosted** | Running a service on your own equipment instead of renting it from a company |
| **Backup** | An extra copy, in case the original is lost |
| **Sync** | Keeping the same files up to date on several devices |
| **Admin** | The person who looks after the server ("The Administrator") |
| **VPN / private connection** | A secure tunnel so only approved devices can reach the server |
| **Encryption** | Scrambling data so only someone with the key can read it |

*Last updated: [2026]*
