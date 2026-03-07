# Color Themes — Flutter UI

A Flutter application that lets users browse and switch between **14 curated color themes**, each paired with a matching theme image. The UI features animated gradient backgrounds, glassmorphism card design, and smooth transitions throughout — built entirely with Flutter's built-in animation APIs and zero third-party UI dependencies.

---

## Features

### Animated Gradient Background
The entire screen background is a `LinearGradient` that smoothly transitions (600ms, `Curves.easeInOut`) every time a new color theme is selected. The gradient is derived dynamically from the selected theme's color — darkening it toward the corners — creating a fully immersive, color-responsive environment.

### Glassmorphism Image Card
The image preview is rendered inside a frosted-glass card built with `BackdropFilter` + `ImageFilter.blur` (sigma 20). A semi-transparent white overlay and a subtle white border give it depth. The card adapts its inner container color using `AnimatedContainer`, ensuring the glass tint updates in sync with the background.

### Animated Image Switching
When a new theme is selected, the displayed image transitions using `AnimatedSwitcher` with a combined **fade + scale** effect:
- The outgoing image fades and shrinks.
- The incoming image fades in and scales from 0.88 to 1.0 using `Curves.easeOutCubic`.

This produces a polished, app-like feel without any additional animation packages.

### Image Loading State
Because images are loaded from the network, a `CircularProgressIndicator` with real percentage progress is shown while the image loads. This uses Flutter's built-in `loadingBuilder` callback on `Image.network`, which provides `cumulativeBytesLoaded` and `expectedTotalBytes` for an accurate progress value.

### Image Error State
If a network image fails to load (e.g., no internet connection), a graceful error state is shown with a broken-image icon and a descriptive message — no blank screens or uncaught exceptions.

### Animated Color Chip Selector
The 14 color themes are displayed as a horizontally scrollable row of color chips at the bottom of the screen. Each chip has the following behavior:

| State | Behavior |
|---|---|
| **Unselected** | 58×58px, rounded corners (radius 14), faint white border, subtle drop shadow |
| **Selected** | Scales up to 1.18× via `AnimatedScale` (`Curves.easeOutBack`), corner radius animates to 18, white border (2.5px width), colored glow shadow, checkmark icon |

The checkmark icon color (black or white) is computed at runtime using `ThemeData.estimateBrightnessForColor` to ensure legibility on any background color.

### Dynamic Theme Label
Below the image, the current theme's name updates with an `AnimatedSwitcher` transition (keyed by theme name). A small colored dot — matching the active theme color with a matching glow shadow — appears next to the label, and its color animates with a 500ms `AnimatedContainer`.

### Dynamic Avatar Glow
The circular avatar in the header has a `BoxShadow` whose color matches the current theme accent. The entire `AnimatedContainer` decorates with a border and glow that updates every time the theme changes, tying the header visually to the selected palette.

### Transparent Status Bar
On app startup, `SystemChrome.setSystemUIOverlayStyle` sets the status bar to transparent with light icons, so the gradient background bleeds into the system UI for a full-screen, edge-to-edge look.

### Material 3
The app uses `useMaterial3: true` with a `colorSchemeSeed`, keeping the app forward-compatible with Flutter's Material You design system for any future widget additions.

---

## Color Themes

| # | Name | Hex | Swatch |
|---|---|---|---|
| 1 | Mint | `#92E3A9` | ![](https://placehold.co/16x16/92E3A9/92E3A9) |
| 2 | Red | `#C53F3F` | ![](https://placehold.co/16x16/C53F3F/C53F3F) |
| 3 | Coral | `#FF725E` | ![](https://placehold.co/16x16/FF725E/FF725E) |
| 4 | Amber | `#FFC100` | ![](https://placehold.co/16x16/FFC100/FFC100) |
| 5 | Lime | `#C6FF00` | ![](https://placehold.co/16x16/C6FF00/C6FF00) |
| 6 | Sky | `#90CAF9` | ![](https://placehold.co/16x16/90CAF9/90CAF9) |
| 7 | Blue | `#407BFF` | ![](https://placehold.co/16x16/407BFF/407BFF) |
| 8 | Purple | `#7E57C2` | ![](https://placehold.co/16x16/7E57C2/7E57C2) |
| 9 | Lavender | `#BA68C8` | ![](https://placehold.co/16x16/BA68C8/BA68C8) |
| 10 | Pink | `#FF81AE` | ![](https://placehold.co/16x16/FF81AE/FF81AE) |
| 11 | Dark | `#263238` | ![](https://placehold.co/16x16/263238/263238) |
| 12 | Charcoal | `#37474F` | ![](https://placehold.co/16x16/37474F/37474F) |
| 13 | Silver | `#B0BEC5` | ![](https://placehold.co/16x16/B0BEC5/B0BEC5) |
| 14 | White | `#EEEEEE` | ![](https://placehold.co/16x16/EEEEEE/EEEEEE) |

---

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter 3.18+ |
| Language | Dart 3.8+ |
| Design System | Material 3 |
| State Management | `StatefulWidget` + `setState` |
| Animations | `AnimatedContainer`, `AnimatedSwitcher`, `AnimatedScale`, `BackdropFilter` |
| Networking | `Image.network` (built-in) |
| Third-party packages | None (runtime) |

---

## Project Structure

```
lib/
├── main.dart                  # App entry point, MaterialApp, SystemUI config
├── models/
│   └── theme_item.dart        # ThemeItem data class + list of 14 themes
└── screens/
    └── home_screen.dart       # Full UI — header, image card, palette selector
```

### `ThemeItem` model

```dart
class ThemeItem {
  final String name;      // Display name (e.g. "Mint")
  final Color color;      // Accent color used for gradient + glow
  final String imageUrl;  // Remote image URL for this theme
}
```

All 14 theme entries are declared as a top-level `const List<ThemeItem>` for zero runtime allocation cost.

### `HomeScreen` widget tree

```
HomeScreen (StatefulWidget)
└── Scaffold
    └── AnimatedContainer (gradient background)
        └── SafeArea
            └── Column
                ├── _Header
                │   ├── Title + subtitle text
                │   └── _AvatarBadge (AnimatedContainer glow)
                ├── _ImageCard (BackdropFilter glassmorphism)
                │   ├── AnimatedSwitcher (image + loading + error)
                │   └── AnimatedSwitcher (theme name label)
                ├── _PaletteLabel
                └── _Palette
                    └── ListView.separated (horizontal)
                        └── _ColorChip × 14 (AnimatedScale + AnimatedContainer)
```

---

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) **3.18.0** or higher
- Dart SDK **3.8.0** or higher
- An internet connection (images are loaded from the network)

### Installation

```bash
git clone https://github.com/your-username/image-color-switch-app-ui.git
cd image-color-switch-app-ui
flutter pub get
```

### Run

```bash
# Run on connected device or emulator
flutter run

# Run on a specific platform
flutter run -d windows
flutter run -d chrome
flutter run -d android
```

### Build

```bash
flutter build apk          # Android APK
flutter build appbundle    # Android App Bundle
flutter build ios          # iOS (macOS required)
flutter build windows      # Windows desktop
flutter build web          # Web
```

---

## Supported Platforms

| Platform | Status |
|---|---|
| Android | Supported |
| iOS | Supported |
| Windows | Supported |
| macOS | Supported |
| Linux | Supported |
| Web | Supported |

---

## License

This project is open source and available under the [MIT License](LICENSE).
