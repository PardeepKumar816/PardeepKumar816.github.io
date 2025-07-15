'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "be29e640040d8b4bef2f1df324af842f",
"version.json": "8f5cf3b0f48fbc2d0d5b1799740aa1ea",
"index.html": "f4d881a2ed9399d3ad92aaa3c7b71d9c",
"/": "f4d881a2ed9399d3ad92aaa3c7b71d9c",
"main.dart.js": "405f6b4bb59c8ed977821829b09cf6d6",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "d40c47d1c161f94dbcb13094d37f1f55",
"pardeep.png": "44fd5e8addfd5f21dcb2fe0d5411ecf9",
"assets/AssetManifest.json": "080a88eaef34ff0d3f0d6988b5213ee5",
"assets/loading.gif": "58fb5f753a3f7ea26eed5a44c1b3c56e",
"assets/NOTICES": "f25101bd7baeb644013848be35246d72",
"assets/FontManifest.json": "6d7bf0d7c489d6724ff0c728629cbd1b",
"assets/AssetManifest.bin.json": "8d9462ab9ec9bc16f4aa27502946da75",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a4152f3cdbc41b71ffd1193998a26ddc",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "b5ccecc94516ddc8c07b60203a2e777c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "17ee8e30dde24e349e70ffcdc0073fb0",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "2737e98c70a25128a60afb64758ecdd9",
"assets/fonts/agustina/agustina.otf": "7b9833076716a8d14eec0cf885a3153c",
"assets/fonts/montserrat/montserrat.ttf": "ee6539921d713482b8ccd4d0d23961bb",
"assets/fonts/MaterialIcons-Regular.otf": "a50f0955a932b0a6959ac5b2c13d6e1e",
"assets/fonts/poppins/Poppins-Light.ttf": "f6ea751e936ade6edcd03a26b8153b4a",
"assets/fonts/poppins/Poppins-Medium.ttf": "f61a4eb27371b7453bf5b12ab3648b9e",
"assets/fonts/poppins/Poppins-Regular.ttf": "8b6af8e5e8324edfd77af8b3b35d7f9c",
"assets/fonts/poppins/Poppins-Bold.ttf": "a3e0b5f427803a187c1b62c5919196aa",
"assets/fonts/poppins/Poppins-SemiBold.ttf": "4cdacb8f89d588d69e8570edcbe49507",
"assets/fonts/poppins/Poppins-Italic.ttf": "5e956c44060a7b3c0e39819ae390ab15",
"assets/assets/images/projects/thrillpay/Dashboard.png": "684b21382adf487e31288323d912cdc8",
"assets/assets/images/projects/thrillpay/Wallet.png": "06a6cfca65738810a5f30f3c57a8a89e",
"assets/assets/images/projects/thrillpay/login.png": "8f16139be16e17ef7428b6235a78e084",
"assets/assets/images/projects/thrillpay/review.png": "a4c091eeac3142ce1135d6e25bf069c2",
"assets/assets/images/projects/thrillpay/Account.png": "037d4a979768a7e4ee42b10788b9e4d7",
"assets/assets/images/projects/thrillpay/splash.png": "d5fc8c484c8edcf70c9d444adb0eda0b",
"assets/assets/images/projects/thrillpay/qr.png": "f4db2f4100174483978bab2ba400edc2",
"assets/assets/images/projects/thrillpay/detail.png": "efb66303a30488d07007d7789202edfe",
"assets/assets/images/projects/thrillpay/Categories.png": "3b30b8f54d00bd12406371f5c5be7f6b",
"assets/assets/images/projects/thrillpay/Favorites.png": "f7e77a9fdc8ea7f7ec1481a1f8ab4120",
"assets/assets/images/projects/oceanicview/PaymentMethod.png": "553fd22eeae91e09ae79e6ece230badb",
"assets/assets/images/projects/oceanicview/PayandPost.png": "29c7fc446754c77d53245043657b1f36",
"assets/assets/images/projects/oceanicview/PersonalChat.png": "5f665f994008e5d842017b0caaefe2ff",
"assets/assets/images/projects/oceanicview/Home.png": "feed6b93985263224b0b9a7594fe80cc",
"assets/assets/images/projects/oceanicview/Statistics.png": "1f61fa17062dcc0a38651baad7b9fb76",
"assets/assets/images/projects/oceanicview/Splash.png": "e2867082a8f271c93ee2701547c61eb7",
"assets/assets/images/projects/oceanicview/ProductDetail.png": "d812c0069969732414a699195ee532de",
"assets/assets/images/projects/oceanicview/UploadyourPhotosVideo.png": "02d185d66a126bd1f698d88a23e7d0bb",
"assets/assets/images/projects/oceanicview/HomewithPopup.png": "b06a844932f8915d6c4d57b181fc7ae2",
"assets/assets/images/projects/oceanicview/ChooseLanguage.png": "20c3f72e8f99b4a3267f6ba5f4dbade9",
"assets/assets/images/projects/oceanicview/Home-2.png": "df0c1e672b2bbf1cb3f2c3c9ae0e61e4",
"assets/assets/images/projects/litsports/userprofile.png": "83fffe1f0f469f4d41425a544419ce73",
"assets/assets/images/projects/litsports/goal.png": "a8fa8a8e7626bee8ab106e71e7719a47",
"assets/assets/images/projects/litsports/leaderboard.png": "572e279afa414cbe8ee5d778625aaf15",
"assets/assets/images/projects/litsports/group.png": "fbbba7dc0a4cac9a1249e5c885d1cb16",
"assets/assets/images/projects/litsports/comments.png": "416d6c32d3ea6d5bd5a0284dcbf6e635",
"assets/assets/images/projects/litsports/home.png": "8fb57baef89d70d9464b707d12203b98",
"assets/assets/images/projects/litsports/childprofile.png": "e5fd279f239f1e37cc7a398aa894af4e",
"assets/assets/images/projects/litsports/timer.png": "d059b7b7c93e083d33e15324c73cc706",
"assets/assets/images/projects/litsports/splash.png": "fd7baf999f0c203af1a888fd8efc3d94",
"assets/assets/images/projects/litsports/parent.png": "4369c725057886560be12eee59d3c79d",
"assets/assets/images/projects/litsports/coach.jpg": "1063d6721004dd89d897bc45fe11a424",
"assets/assets/images/projects/litsports/chat.png": "3c6a7321532fe6fe355872c94b712e05",
"assets/assets/images/projects/litsports/quiz.png": "fee9489e6a56701f1e99a6a353d3c277",
"assets/assets/images/projects/checkin/PaymentMethod.png": "c0801c86eff79f201e297266d71813de",
"assets/assets/images/projects/checkin/Payviacard.png": "460eb00aaec279e684cfdec157ef9557",
"assets/assets/images/projects/checkin/MyBill.png": "4a2e4ef42fd25435cfed84ed02b51061",
"assets/assets/images/projects/checkin/cart.png": "9ec44f393b69a093e60cfe44873e913b",
"assets/assets/images/projects/checkin/orderfood.png": "85cde75769d18dc1e3bac1bc321bf370",
"assets/assets/images/projects/checkin/home.png": "1dc1b88cfc296697de9be7d10e0c68ab",
"assets/assets/images/projects/checkin/Laundry.png": "adb58b90323d39cffe2c3ad677d64aec",
"assets/assets/images/projects/checkin/Minibar.png": "6e51381c1e41e65ceaebd63a84aea313",
"assets/assets/images/projects/checkin/checkin.png": "a06858cc8fb1389dcf79f455b1770e96",
"assets/assets/images/projects/checkin/qr.png": "b58220273eda78c1109f4876cb9ffbad",
"assets/assets/images/projects/pelican/login.jpg": "ee33382ad67075c879d3d58363f81aa9",
"assets/assets/images/projects/pelican/Locations.jpg": "76084980f4ce7a67e3310de0578172b8",
"assets/assets/images/projects/pelican/splash.jpg": "4122acc715add4d1a56cb009abe957f9",
"assets/assets/images/projects/pelican/accountSettings.jpg": "bd746e81a2797d57556dd2825123ee2b",
"assets/assets/images/projects/pelican/Form.jpg": "4a6859d856632aabbfa09eb68a89c6f5",
"assets/assets/images/projects/pelican/Draft.jpg": "e9b28bad5295240a00b7e16a0f64c20f",
"assets/assets/images/developer.png": "a1b30fb010a3d15e0dfc916fb6034beb",
"assets/assets/images/pardeep4.jfif": "7dba87ea7d83352725311aaa52ba73bb",
"assets/assets/images/pardeep5.JPG": "991b19c1532321d552743b1fb000c799",
"assets/assets/images/pardeep.png": "44fd5e8addfd5f21dcb2fe0d5411ecf9",
"assets/assets/images/self_image.png": "452d4c1c556175a2fde879891edc08d2",
"assets/assets/images/pardeep2.jfif": "291dbd63eb9855d9778df8138aa2a146",
"assets/assets/images/pardeep3.jfif": "866ad9400ddc5bd3b1c003bfdc9d8393",
"assets/assets/images/g.png": "877fee72718e7cb27556054d66255b12",
"assets/assets/logo/instagram.png": "e5093f23dd7a8186fe5d3131477575b3",
"assets/assets/logo/github.png": "142f99d431654ebe582a636d720d3b5f",
"assets/assets/logo/twitter.png": "d329ea55154f3a2f7e449a8486adc726",
"assets/assets/logo/linkedin.png": "c54b5a6d947077e4151ea658fe90c648",
"assets/assets/logo/github-black.png": "47afb6a7dda23324825f4908d57ca360",
"assets/assets/logo/facebook.png": "3137757a08b3c6d5fbf023c4e8ab644d",
"assets/assets/icons/bootstrap.svg": "c76fa2ef8bce9784bd01defdaca2c725",
"assets/assets/icons/figma.svg": "3b4c426dbbcc25a0095228af9e328322",
"assets/assets/icons/appstore.svg": "ab59aacbe9ff36616a4e3171e2c97c2b",
"assets/assets/icons/mongo.svg": "06dd048e873d49932aa9d0a94b79c972",
"assets/assets/icons/android.svg": "1dd303f6a46bd7311598fad0abe9d009",
"assets/assets/icons/js.svg": "9abf1dd81e0bc48d9c77f840e3410dfb",
"assets/assets/icons/express.svg": "ebd3647e8a8ede235a1a55be4ce72743",
"assets/assets/icons/firebase.svg": "1e6703b786837f2d5b80d7a7bc3dbb84",
"assets/assets/icons/github.svg": "326e390c9c9c9461b44230fd561ce6ae",
"assets/assets/icons/sql.svg": "5433d59214a5d8c71ca6cd96e74eec04",
"assets/assets/icons/postgres.svg": "e98dedb84201406879a9b764fe922e11",
"assets/assets/icons/flutter.svg": "3093fb700a6cb4bcd6e2db3a1ea136bb",
"assets/assets/icons/adobexd.svg": "b8da2ed8570c5aa71d61402e90954300",
"assets/assets/icons/github.png": "ce3b4eb69ebfc35b42c34041024ba781",
"assets/assets/icons/git.svg": "631bfee78570c6e6931d654cc76b89c8",
"assets/assets/icons/notion.svg": "949de186f3eae5ebe208f7f52fa4e55e",
"assets/assets/icons/flask.svg": "e6867ecd77262949f3c22d44c02c46c8",
"assets/assets/icons/jira.svg": "5e9f8380013984d99f07cf3bceba42d3",
"assets/assets/icons/dart.svg": "cb365d2438413170998483cf8785e182",
"assets/assets/icons/css.svg": "ada650097f50fd5c8d21fe6beee3ae9f",
"assets/assets/icons/google_play.svg": "fd5488da1f69d97a6cceab0e97b5f455",
"assets/assets/icons/api.svg": "65c19716cde7fd4c78d62fcb533574de",
"assets/assets/icons/web.svg": "e07725251bf3df3b788a6ace26d0b0da",
"assets/assets/icons/trello.svg": "b2c1c2dd285ee2c88cb1e502e547b8f5",
"assets/assets/icons/dart_frog.svg": "1f51ec4251bb4acb1d5f9df21590cecd",
"assets/assets/icons/html.svg": "9eb69e3b5b90a2b8e93494c2a464200f",
"assets/assets/icons/apple.svg": "8314ab35aed472f5064d867f56b06259",
"assets/assets/icons/node.svg": "2308cb2159cc6e88cd9750c6e1daa734",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
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
