'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "888483df48293866f9f41d3d9274a779",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"manifest.json": "a310d35c80074683becfa83e27661ae0",
"index.html": "438fac8813bdf0cdbbd568dab504954f",
"/": "438fac8813bdf0cdbbd568dab504954f",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "b06a3ea08838a0d21685f688a7b2210b",
"assets/assets/curriculo_linykeer_almeida.pdf": "5d21b2d1472655bdad86ba3d7fc6e462",
"assets/assets/clinicapp/logo.jpeg": "ad7eb0246cdfa5d7c334d5b10a665d05",
"assets/assets/colabSocial/3.png": "748e66b8ad6ea105082525e968a3f6be",
"assets/assets/colabSocial/1.png": "d71eec56f5dc2021886eac47d9c854c9",
"assets/assets/colabSocial/2.png": "619cb8028718d370cd2935c703c142d1",
"assets/assets/colabSocial/icon.png": "fd64a43dd80f132a9411e4c5e9580bda",
"assets/assets/colabSocial/0.png": "02050324f3baaa89702f75e675759239",
"assets/assets/colabSocial/4.png": "8e2137ab4e5ff37b9246ee9483c65f9a",
"assets/assets/colabSocial/6.png": "3a0f256a137d2b108a2312d0bdfc23e9",
"assets/assets/colabSocial/5.png": "453a016d6ddbe6135642416b4993cbef",
"assets/assets/colab_social/3.png": "748e66b8ad6ea105082525e968a3f6be",
"assets/assets/colab_social/1.png": "d71eec56f5dc2021886eac47d9c854c9",
"assets/assets/colab_social/2.png": "619cb8028718d370cd2935c703c142d1",
"assets/assets/colab_social/icon.png": "fd64a43dd80f132a9411e4c5e9580bda",
"assets/assets/colab_social/0.png": "02050324f3baaa89702f75e675759239",
"assets/assets/colab_social/4.png": "8e2137ab4e5ff37b9246ee9483c65f9a",
"assets/assets/colab_social/6.png": "3a0f256a137d2b108a2312d0bdfc23e9",
"assets/assets/colab_social/5.png": "453a016d6ddbe6135642416b4993cbef",
"assets/assets/image.png": "9956ca4b6be7c40d5f5fe142c2bbe55b",
"assets/assets/colab_campo/3.png": "9e98913ebd1794258cc5e73c9d3b3e37",
"assets/assets/colab_campo/1.png": "afe87fe77f7b4a99db780f8e127b306c",
"assets/assets/colab_campo/2.png": "de361908796315e36311e388aeb814d1",
"assets/assets/colab_campo/icon.png": "ba5532d3de24da3ff679b40f0666a747",
"assets/assets/colab_campo/0.png": "1ab706b6f0d30a2133bd9045a0d00137",
"assets/assets/colab_campo/4.png": "4105bc1c06ab3c0b2d0dc13916114f46",
"assets/assets/colab_campo/7.png": "e2d4dc6125b042faf78ecf616fb0c563",
"assets/assets/colab_campo/6.png": "4cbb78a0c3e99bf8eb4fbb10e44239d1",
"assets/assets/colab_campo/5.png": "3c86f9da343b5ff4a49e9a852b3f93fa",
"assets/assets/colabCampo/3.png": "9e98913ebd1794258cc5e73c9d3b3e37",
"assets/assets/colabCampo/1.png": "afe87fe77f7b4a99db780f8e127b306c",
"assets/assets/colabCampo/2.png": "de361908796315e36311e388aeb814d1",
"assets/assets/colabCampo/icon.png": "ba5532d3de24da3ff679b40f0666a747",
"assets/assets/colabCampo/0.png": "1ab706b6f0d30a2133bd9045a0d00137",
"assets/assets/colabCampo/4.png": "4105bc1c06ab3c0b2d0dc13916114f46",
"assets/assets/colabCampo/7.png": "e2d4dc6125b042faf78ecf616fb0c563",
"assets/assets/colabCampo/6.png": "4cbb78a0c3e99bf8eb4fbb10e44239d1",
"assets/assets/colabCampo/5.png": "3c86f9da343b5ff4a49e9a852b3f93fa",
"assets/assets/epoh/3.png": "3b2bc19ce821daf6b89261612d858c9e",
"assets/assets/epoh/1.png": "c0e372a102260ea4540ab3dc9cceeeb7",
"assets/assets/epoh/2.png": "f670670caac272f983cc858a71360b68",
"assets/assets/epoh/icon.png": "11d6971e78fb3baf9e3080f35c6c1aa9",
"assets/assets/epoh/0.png": "b24d7e29d5103c6ca4a0e1f33acf98e1",
"assets/assets/epoh/4.png": "ffb029a6d4f582ad31686f178f665025",
"assets/assets/epoh/6.png": "b157ab67ac84eaf8cf08c557bcccbd08",
"assets/assets/epoh/5.png": "a8efb3d980315040ecbda6d4de488416",
"assets/fonts/MaterialIcons-Regular.otf": "e78049e7e2d66aa0240dfeb34d217fa8",
"assets/NOTICES": "726843febb9e91150ae33bd55693f05d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Solid-900.otf": "5b8d20acec3e57711717f61417c1be44",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Brands-Regular-400.otf": "b7a225eb557dd600e4834771a6b0d16a",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Regular-400.otf": "b2703f18eee8303425a5342dba6958db",
"assets/packages/lucide_icons/assets/lucide.ttf": "03f254a55085ec6fe9a7ae1861fda9fd",
"assets/FontManifest.json": "16a0801af3879515a80efe8c668d46fe",
"assets/AssetManifest.bin": "801261cf7d23cbd1a06a5ba395ea24be",
"assets/AssetManifest.json": "d313a9e8be461365144f8331dc66f8aa",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"favicon.png": "da54f969a612b3ba89154f5ec9350d3b",
"flutter_bootstrap.js": "2fdf57c80116e6e284c0498be38acf42",
"version.json": "d2c5b08fc8550ce8ce89a895811483d0",
"main.dart.js": "3cd372f1b5bc58aa6408b5fc1a3f103d"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
