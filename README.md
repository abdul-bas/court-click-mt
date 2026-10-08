# court_click

A Netflix-style movie discovery app built with Flutter for the CourtClick Flutter Developer machine test. It follows the supplied Figma design (7 screens) and uses live data from TheMovieDB (TMDB) for three of them.

## Screens

| # | Screen | Data source | Notes |
|---|--------|-------------|-------|
| 1 | Splash | Mock | Static |
| 2 | User name / profiles | Mock | Static |
| 3 | Home (Dashboard) | **API** | Hero carousel, Previews, Continue Watching and horizontal rails |
| 4 | Search | **API** | Debounced (400 ms) live search, Top Searches when empty |
| 5 | Coming Soon | **API** | Upcoming movies with release dates and artwork |
| 6 | Downloads | Mock | Static, matches design |
| 7 | More | Mock | Static, matches design |

`main_screen` is the shell for tabs 3 to 7. It uses an `IndexedStack`, so each tab keeps its state when switching.

### API-driven rails on Home

| Rail | Endpoint |
|------|----------|
| Hero / Previews / Continue Watching | `GET /movie/now_playing` |
| Popular on Netflix | `GET /movie/popular` |
| Trending Now | `GET /trending/all/week` |
| Top 10 in Nigeria Today | `GET /discover/movie?region=NG` |
| African Movies, Hollywood Movies & TV | `GET /discover/movie` (origin country filters) |
| Netflix Originals, TV Thrillers, US TV Shows | `GET /discover/tv` |
| Watch It Again | `GET /tv/top_rated` (placeholder) |
| My List | `GET /movie/top_rated` (placeholder) |
| New Releases | `GET /movie/upcoming` |

Search uses `GET /search/multi?query={q}` and Top Searches uses the trending endpoint. Coming Soon uses `GET /movie/upcoming`.

## Setup

1. Get a free TMDB API key (v3) from https://www.themoviedb.org/settings/api
2. Clone the repo and install packages:
   ```bash
   git clone <repo-url>
   cd court_click
   flutter pub get
   ```
3. Run the app and pass the key at run time. The key is **not** stored in the source code:
   ```bash
   flutter run --dart-define=TMDB_API_KEY=your_key_here
   ```

   Or keep it in a file that git ignores. Create `env.json` in the project root:
   ```json
   { "TMDB_API_KEY": "your_key_here" }
   ```
   then run:
   ```bash
   flutter run --dart-define-from-file=env.json
   ```
   `env.json` is listed in `.gitignore`.

## Build the APK

```bash
flutter build apk --release --split-per-abi --dart-define-from-file=env.json
```

Output: `build/app/outputs/flutter-apk/app-arm64-v8a-release.apk`

The key must be passed to the release build as well, otherwise the app has no data.

For the Play Store bundle:
```bash
flutter build appbundle --release --dart-define-from-file=env.json
```

## Architecture

```
lib/
├── core/
│   ├── constants/      api_key (config), genres, bottom nav items
│   ├── network/        dio_client (single Dio instance)
│   ├── routes/         app_router, app_routes
│   ├── theme/          app_colors, app_theme, text_styles
│   └── utils/          date_utils, handlers, helpers
├── data/
│   ├── data_sources/   remote data sources (Dio calls only)
│   ├── model/          typed models with fromJson
│   └── repositories/   turn responses into bloc states
├── presentation/
│   ├── bloc/           home, search, coming_soon
│   ├── controllers/    ChangeNotifier caches and navigation
│   ├── screens/        one folder per screen, with its own widgets
│   └── widgets/        shared widgets
└── main.dart
```

Data flow for the API screens:

```
Screen -> Bloc event -> Repository -> Data source (Dio) -> TMDB
Screen <- Bloc state <- Repository (typed models)
```

- **Data source**: only makes the HTTP call.
- **Repository**: parses JSON into `MovieModel`, handles `DioException` and returns a state (`Loaded`, `Empty` or `Error`).
- **Bloc**: one event per request, emits `Loading` then the repository result.
- **UI**: no raw `Map` access. Screens only use typed models.

## State management

`flutter_bloc` is used for all API screens. Each flow emits distinct states:

`Initial -> Loading -> Loaded | Empty | Error`

- **Search** uses `bloc_concurrency`'s `restartable()` with a 400 ms delay, so only the latest keystroke triggers a request.
- Each API screen shows a loading spinner, an error message with a **Try again** button, and an empty state ("No results").
- Small `ChangeNotifier` controllers hold UI state (selected tab, cached rail data, reminders) so data survives tab switches.

## Networking

A single `Dio` instance (`core/network/dio_client.dart`) with:
- Base URL, 15 s connect and receive timeouts
- Default `api_key` and `language` query parameters
- A logging interceptor in debug builds only
- Errors caught in repositories and mapped to error states

## Packages

| Package | Use |
|---------|-----|
| `flutter_bloc` | State management |
| `dio` | HTTP client |
| `cached_network_image` | Cached posters with placeholder and fallback |
| `carousel_slider` | Home hero carousel |

## Assumptions

- The design names screens by tab, so I treated Splash, User name, Home, Search, Coming Soon, Downloads and More as the 7 screens.
- "Top 10 in Nigeria", "My List" and "Watch It Again" have no matching TMDB endpoint. Top 10 uses the Nigerian region filter, and the other two use top-rated placeholders.
- The Coming Soon design shows "Season 1" text. `/movie/upcoming` returns movies, so cards show "Coming <date>" instead.
- Reminders and Share on Coming Soon are UI only. Reminders are kept in memory.
- Models live in `data/model` and are used directly by the presentation layer.

## Not done / known limitations

- No pagination or infinite scroll yet.
- No unit or bloc tests yet.
- Share and Remind Me are not connected to the system.

## Download

- APK: _add GitHub Releases or Drive link_
