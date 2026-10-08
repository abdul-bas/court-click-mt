# court_click

A Netflix-style streaming app UI built with Flutter, using the TMDB API, `flutter_bloc` and clean folder separation.

## Screens (7)

| # | Screen | Folder | Data |
|---|--------|--------|------|
| 1 | Splash | `screens/splash_screen` | Static |
| 2 | Username / Profiles | `screens/user_name_screen` | Static |
| 3 | Home | `screens/home_screen` | TMDB: now playing, popular, trending, top 10, African, Hollywood, Originals, thrillers, US TV |
| 4 | Search | `screens/search_screen` | TMDB `/search/multi`, 400 ms debounce, Top Searches |
| 5 | Coming Soon | `screens/coming_soon_screen` | TMDB `/movie/upcoming` |
| 6 | Downloads | `screens/dowload_screen` | Static |
| 7 | More | `screens/more_screen` | Static |

`screens/main_screen` is the shell that holds tabs 3 to 7 behind the bottom navigation bar (`IndexedStack`, so each tab keeps its state).

## Project structure

```
lib/
├── core/
│   ├── constants/      api_key, genres, bottom_navigation_bar_items, ...
│   ├── network/        dio_client.dart
│   ├── routes/         app_router, app_routes
│   ├── theme/          app_colors, app_theme, text_styles
│   └── utils/          date_utils, handlers, helpers
├── data/
│   ├── data_sources/   movie_remote_data_source, search_data_source,
│   │                   commin_soon_data_sorces
│   ├── model/          movie_model, charecter_model
│   └── repositories/   home_repository, search_repository,
│                       coming_soon_repository
├── presentation/
│   ├── bloc/           home/, search/, coming_soon/
│   ├── controllers/    navigation_controller, home_controllers,
│   │                   search_controller, comming_soon_controller
│   ├── screens/        (the 7 screens above + main_screen)
│   └── widgets/        avatar_widgets.dart
└── main.dart
```

## State management

- **Bloc** fetches data (`HomeBloc`, `SearchBloc`, `ComingSoonBloc`).
- **Controllers** (`ChangeNotifier`) cache results and drive the UI, and are created once in `MainScreen` so data survives tab switches.
- Providers for all blocs live in `main.dart`, above `MainScreen`.

## Setup

```bash
flutter pub get
flutter run
```

Dependencies: `flutter_bloc`, `bloc_concurrency`, `dio`, `carousel_slider`.

Add your TMDB key in `lib/core/constants/api_key.dart`.
Do not commit a real key. Rotate it if it was ever shared publicly.

## Build the app bundle (to download / upload to Play Store)

### 1. Create a signing key (once)

```bash
keytool -genkey -v -keystore %USERPROFILE%\upload-keystore.jks ^
  -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

### 2. Create `android/key.properties`

```properties
storePassword=YOUR_PASSWORD
keyPassword=YOUR_PASSWORD
keyAlias=upload
storeFile=C:/Users/YOUR_NAME/upload-keystore.jks
```

Add `key.properties` and `*.jks` to `.gitignore`.

### 3. Build

```bash
flutter clean
flutter pub get
flutter build appbundle --release
```

Output:

```
build/app/outputs/bundle/release/app-release.aab
```

### Need a file you can install directly on a phone?

An `.aab` is for the Play Store and can't be installed by tapping it. For a downloadable install file, build an APK:

```bash
flutter build apk --release --split-per-abi
```

Output (use the `arm64-v8a` one for most phones):

```
build/app/outputs/flutter-apk/app-arm64-v8a-release.apk
```

## Download

Upload the `.aab` / `.apk` to a GitHub Release or Google Drive and put the link here:

- Android app bundle: _add link_
- Android APK: _add link_

## Notes

- "My List" and "Watch It Again" use placeholder TMDB data until a real user store exists.
- Remind Me on Coming Soon is stored in memory only.
- Internet permission must be in `android/app/src/main/AndroidManifest.xml`:
  `<uses-permission android:name="android.permission.INTERNET"/>`
