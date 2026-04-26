# LifeTrack — Complete Setup Guide

## Sign Up & Push to GitHub

### 1. Create a GitHub account (if you don't have one)
- Go to [github.com/signup](https://github.com/signup)
- Fill in username, email, password
- Verify your email

### 2. Create a new repository
- Go to [github.com/new](https://github.com/new)
- **Repository name:** `lifetrack` (or any name you prefer)
- **Description:** "Personal life management app"
- **Visibility:** Public (free tier requires public for Pages)
- Click **Create repository**

### 3. Clone the repo to your computer

Open Terminal/Command Prompt and run:
```bash
git clone https://github.com/YOUR_USERNAME/lifetrack.git
cd lifetrack
```

Replace `YOUR_USERNAME` with your actual GitHub username.

### 4. Download all the files from this page

Download these files and place them in your `lifetrack` folder:
- `index.html`
- `lt-sw.js`
- `lt-manifest.json`
- `lt-icon-192.png`
- `lt-icon-512.png`
- `package.json`
- `capacitor.config.json`
- `lifetrack-schema.sql`
- `README.md`

Also create a folder structure:
```
.github/
  workflows/
    build-apk.yml
```

(You'll find `build-apk.yml` in the outputs too)

### 5. Push everything to GitHub

In Terminal/Command Prompt (in the `lifetrack` folder):
```bash
git add .
git commit -m "Initial commit: LifeTrack with Capacitor"
git push origin main
```

If you see an error about `main` branch, run:
```bash
git branch -M main
git push -u origin main
```

---

## Enable GitHub Pages (for web version)

1. Go to your repo on GitHub → **Settings** tab
2. Scroll down to **Pages** (on the left)
3. Under "Build and deployment":
   - Source: **Deploy from a branch**
   - Branch: **main** | folder: **/ (root)**
4. Click **Save**

Wait 1 minute. Your app is now at:
```
https://YOUR_USERNAME.github.io/lifetrack/
```

Visit this URL to use the web version (alarms work in foreground only).

---

## Build the Android APK (with real background alarms)

### Step 1 — Enable GitHub Actions

1. Go to your repo → **Actions** tab
2. If you see a message about enabling workflows, click **"I understand... enable them"**

### Step 2 — Trigger the build

**Automatic:** Every time you `git push`, it builds automatically.

**Manual trigger:**
1. Go to **Actions** tab
2. Click **"Build LifeTrack APK"** in the left sidebar
3. Click **"Run workflow"** button (top right)
4. Click **"Run workflow"** in the dropdown
5. Wait 10-15 minutes

### Step 3 — Download the APK

When the build finishes:
1. Go to **Releases** tab on your repo
2. Find the latest release (top of the list)
3. Click and download `app-debug.apk`

You can also download from **Actions** → the finished workflow run → **Artifacts** section.

### Step 4 — Install on Android phone

**Option A: Direct download on phone**
1. Click the APK download link on your phone's browser
2. Open the downloaded file
3. If prompted "Install blocked" → tap **Settings** → **Security** → toggle **"Install from unknown sources"**
4. Go back and open the APK again
5. Tap **Install**

**Option B: Transfer via computer**
1. Download APK to your computer
2. Plug in Android phone via USB
3. Copy `app-debug.apk` to your phone's Downloads folder
4. On phone: open Files app → Downloads → tap the APK → Install

### Step 5 — Grant alarm permissions on Android 12+

When you first open LifeTrack:
1. **Tap "Allow"** when asked for Notification permission
2. Go to phone **Settings → Apps → LifeTrack → Permissions**
3. Turn on: **Alarms and Reminders** (if available)
4. Turn on: **Notifications**

---

## What happens now

### Web version (browser)
- ✅ Full app functionality
- ✅ All features work
- ✅ Alarms only fire when app is open/minimized
- ✅ Available at `https://YOUR_USERNAME.github.io/lifetrack/`

### Native APK (installed on phone)
- ✅ Full app functionality  
- ✅ **Alarms fire even when app is fully closed**
- ✅ Vibration works perfectly
- ✅ Sound plays automatically
- ✅ Works offline
- ✅ Faster than browser version

---

## Make changes & rebuild

Whenever you want to update the app:

1. Edit files locally (on your computer)
2. Push to GitHub:
```bash
git add .
git commit -m "Your change description"
git push origin main
```

3. GitHub Actions automatically rebuilds the APK (~10 min)
4. Download the new APK from Releases
5. Install on your phone (overrides old version)

---

## Enable Supabase (optional — for cloud sync)

Skip this if you only want offline local storage.

### 1. Create Supabase project
- Go to [supabase.com](https://supabase.com)
- Sign up free
- Click **"New Project"**
- Fill in project name, choose region
- Wait for it to initialize

### 2. Get your credentials
- Go to **Settings → API** (on the left)
- Copy `Project URL` and `anon public key`

### 3. Add to index.html
Open `index.html` in a text editor. Near the top, find:
```js
const SUPABASE_URL = 'https://YOUR_PROJECT.supabase.co';
const SUPABASE_KEY = 'YOUR_ANON_PUBLIC_KEY';
```

Paste your credentials there.

### 4. Run the database schema
- In Supabase, go to **SQL Editor**
- Click **"New Query"**
- Open `lifetrack-schema.sql` from your computer
- Copy all the SQL
- Paste into Supabase SQL editor
- Click **"Run"**

### 5. Push the change
```bash
git add index.html
git commit -m "Add Supabase sync"
git push origin main
```

Wait for the APK to rebuild, then install the new version. Now your data syncs to the cloud.

---

## Troubleshooting

**"Install blocked" error on Android**
- Go to **Settings → Security/Safety → Unknown sources** and turn it ON
- Try installing again

**APK won't build (check Actions tab)**
- Make sure `.github/workflows/build-apk.yml` exists with exact spelling
- Make sure all files are in the root folder (not in subfolders)
- Check the Actions log for the specific error

**Alarms don't work on web**
- This is normal — web version only supports foreground alarms
- Use the native APK for background alarms

**Alarms don't work on APK**
- Check you granted **Alarms and Reminders** permission
- Check **Settings → Apps → LifeTrack → Notifications** is ON
- Restart the phone

**Can't see Releases on GitHub**
- Make sure the build finished successfully (check Actions tab)
- Refresh the page
- Try rebuilding manually

---

## What to do next

1. **Set a reminder** — go to Reminders → + → set a due time → Save
2. **Close the app completely**
3. **Wait for the alarm time** — notification pops up even when app is closed
4. **Mark tasks** — add tasks, set due dates, get daily alerts
5. **Track health** — log water, sleep, weight
6. **Budget** — add expenses/income, track spending

All data saves locally. With Supabase enabled, it syncs to the cloud.

---

## Need help?

- Check the README.md in your repo
- Review the app's built-in **Settings → Help** (if added)
- Visit your GitHub repo Issues tab to ask questions

Good luck! 🚀
