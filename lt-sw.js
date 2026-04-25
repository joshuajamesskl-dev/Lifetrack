const CACHE = 'lifetrack-v2';
const SHELL = [
  './lifetrack-1.html',
  './lt-manifest.json',
  './lt-icon-192.png',
  './lt-icon-512.png'
];

self.addEventListener('install', e => {
  e.waitUntil(
    caches.open(CACHE)
      .then(c => c.addAll(SHELL))
      .then(() => self.skipWaiting())
  );
});

self.addEventListener('activate', e => {
  e.waitUntil(
    caches.keys()
      .then(keys => Promise.all(keys.filter(k => k !== CACHE).map(k => caches.delete(k))))
      .then(() => self.clients.claim())
  );
});

self.addEventListener('fetch', e => {
  if (e.request.method !== 'GET') return;
  const url = new URL(e.request.url);
  if (url.hostname.includes('supabase.co') || url.hostname.includes('fonts.g') || url.hostname.includes('jsdelivr')) {
    e.respondWith(fetch(e.request).catch(() => caches.match(e.request)));
    return;
  }
  e.respondWith(
    caches.match(e.request).then(cached => {
      if (cached) return cached;
      return fetch(e.request).then(res => {
        if (url.origin === self.location.origin && res.status === 200) {
          caches.open(CACHE).then(c => c.put(e.request, res.clone()));
        }
        return res;
      }).catch(() => {
        if (e.request.mode === 'navigate') return caches.match('./lifetrack-1.html');
      });
    })
  );
});

self.addEventListener('message', e => {
  if (e.data === 'skipWaiting') { self.skipWaiting(); return; }
  if (e.data && e.data.type === 'NOTIFY') {
    const { title, body, tag, icon } = e.data;
    self.registration.showNotification(title, {
      body,
      icon: icon || './lt-icon-192.png',
      badge: './lt-icon-192.png',
      tag: tag || 'lifetrack',
      renotify: true,
      vibrate: [200, 100, 200],
      requireInteraction: false,
      data: { url: self.registration.scope }
    });
  }
});

self.addEventListener('notificationclick', e => {
  e.notification.close();
  e.waitUntil(
    self.clients.matchAll({ type: 'window', includeUncontrolled: true }).then(clients => {
      for (const client of clients) {
        if (client.url.includes('lifetrack') && 'focus' in client) return client.focus();
      }
      return self.clients.openWindow(e.notification.data?.url || './lifetrack-1.html');
    })
  );
});
