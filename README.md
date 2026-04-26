# LifeTrack

A personal life management PWA — Budget, Tasks, Health, Schedule & Reminders — built as a single HTML file with offline support.

## Features

- **Budget** — track income and expenses with recurring support
- **Tasks** — to-dos with due dates and priority
- **Health** — water intake, sleep, habits, weight log
- **Schedule** — daily calendar events
- **Reminders** — timed alerts with push notifications
- **Notes** — journal / freeform notes
- **Offline** — works without internet via Service Worker cache
- **Installable** — add to home screen on Android/iOS

## Setup

### 1. Clone and deploy to GitHub Pages

```bash
git clone https://github.com/YOUR_USERNAME/lifetrack.git
cd lifetrack
```

Enable GitHub Pages in **Settings → Pages → Branch: main → / (root)**.

Your app will be live at:
```
https://YOUR_USERNAME.github.io/lifetrack/index.html
```

### 2. Supabase (optional — for cloud sync)

The app works fully offline without Supabase. To enable cloud sync:

1. Create a free project at [supabase.com](https://supabase.com)
2. Run `lifetrack-schema.sql` in the Supabase SQL editor
3. Open `index.html` and replace the two placeholders near the top:

```js
const SUPABASE_URL = 'https://YOUR_PROJECT.supabase.co';
const SUPABASE_KEY = 'your-anon-public-key';
```

### 3. Push Notifications

On first launch the app requests notification permission. On Android (installed as PWA), notifications fire even when the app is backgrounded via the Service Worker.

## File Structure

```
index.html      ← entire app (HTML + CSS + JS)
lt-sw.js              ← service worker (caching + push notifications)
lt-manifest.json      ← PWA manifest (name, icons, display mode)
lt-icon-192.png       ← app icon 192×192
lt-icon-512.png       ← app icon 512×512
lifetrack-schema.sql  ← Supabase DB schema (optional)
```

## Install as PWA

**Android (Chrome):** Open the URL → browser prompts "Add to Home Screen" → tap Install.  
**iOS (Safari):** Open the URL → Share → Add to Home Screen.

## License

MIT
