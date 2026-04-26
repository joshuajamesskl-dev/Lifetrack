# LifeTrack

Personal life management app — Budget, Tasks, Health, Schedule & Reminders.

Hosted on GitHub Pages as a PWA. Built as a native Android APK via GitHub Actions.

---

## How to get the Android APK (with real alarms)

### Step 1 — Fork or push this repo to GitHub

If you haven't already:
```
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/YOUR_USERNAME/lifetrack.git
git push -u origin main
```

### Step 2 — Enable GitHub Actions

1. Go to your repo on GitHub
2. Click the **Actions** tab
3. If prompted, click **"I understand my workflows, go ahead and enable them"**

### Step 3 — Trigger your first build

GitHub Actions will automatically build when you push to `main`.

Or trigger it manually:
1. Go to **Actions** tab
2. Click **"Build LifeTrack APK"** in the left sidebar
3. Click **"Run workflow"** → **"Run workflow"**
4. Wait ~10 minutes

### Step 4 — Download the APK

1. When the build finishes, go to the **Releases** tab on your repo
2. Download `app-debug.apk`
3. Transfer it to your Android phone (email it, Google Drive, direct download)

### Step 5 — Install on Android

1. Open the APK on your phone
2. If it says "Install blocked" → go to **Settings → Security → Unknown sources** and allow it
3. Tap Install
4. Open LifeTrack

### Step 6 — Grant alarm permissions

On Android 12+:
1. Open LifeTrack
2. When prompted, allow **Notifications**
3. Go to phone **Settings → Apps → LifeTrack → Permissions** and allow **Alarms & Reminders**

---

## What works in native APK vs browser

| Feature | Browser PWA | Native APK |
|---|---|---|
| Push notifications | ✅ (app minimized) | ✅ (app fully closed) |
| Alarm sound | ✅ (foreground only) | ✅ (always) |
| Vibration | ✅ Android only | ✅ always |
| Background alarms | ❌ | ✅ |
| Works offline | ✅ | ✅ |

---

## Web version (GitHub Pages)

Enable GitHub Pages:
**Settings → Pages → Branch: main → / (root) → Save**

URL: `https://YOUR_USERNAME.github.io/lifetrack/`

---

## Supabase cloud sync (optional)

1. Create free project at supabase.com
2. Run `lifetrack-schema.sql` in the SQL editor
3. Replace in `index.html`:
```js
const SUPABASE_URL = 'https://YOUR_PROJECT.supabase.co';
const SUPABASE_KEY = 'your-anon-key';
```

---

## File structure

```
index.html              ← entire app
lt-sw.js                ← service worker
lt-manifest.json        ← PWA manifest
lt-icon-192.png         ← app icon
lt-icon-512.png         ← app icon
capacitor.config.json   ← Capacitor config
package.json            ← dependencies
lifetrack-schema.sql    ← Supabase schema
.github/
  workflows/
    build-apk.yml       ← GitHub Actions build
```
