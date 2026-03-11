# WeatherApp — Overview

## Tech Stack
- **Platform**: iOS 15.0+
- **Language**: Swift
- **Framework**: SwiftUI + UIKit (LottieView)
- **Architecture**: MVVM
- **Networking**: URLSession
- **Animation**: Lottie iOS
- **Custom Font**: Futura

## Project Structure
```
WeatherApp/
├── Main/
│   └── WeatherAppApp.swift          # App entry point
├── View/
│   └── ContentView.swift            # Main weather display UI
├── View Models/
│   └── WeatherViewModel.swift       # State & fetch logic
├── Model/
│   └── ForecastResponse.swift       # API response models
├── NetworkManager/
│   ├── NetworkManager.swift         # Generic HTTP client
│   └── WeatherApiService.swift      # Weather API specifics
├── Helper/
│   ├── LottieView.swift             # Lottie UIViewRepresentable
│   └── MyFont.swift                 # Custom font enum
└── Reference View/
    ├── CardStackView.swift          # (not used in current UI)
    └── WalletScrollView.swift       # (not used in current UI)
```

## Core Features
- **Current Weather Display**: Shows location, temperature, condition with day/night toggle
- **Weather Details**: Wind, feels-like temp, humidity, UV index
- **7-Day Forecast**: Scrollable forecast cards with scroll transitions
- **Day/Night Toggle**: Tap to toggle between day/night backgrounds
- **Lottie Animations**: 3D sun/moon animations for visual interest

## Data Flow
1. `ContentView` → `WeatherViewModel.fetchForecastWeather(city)`
2. `WeatherViewModel` → `WeatherApiService.setUrl()` + `NetworkManager.fetchData()`
3. `NetworkManager` makes URLSession request to WeatherAPI
4. Response decoded to `ForecastResponse` and published via `@Published`
5. UI updates via SwiftUI bindings

## External API
- **Service**: WeatherAPI (weatherapi.com)
- **Endpoints**: `/forecast.json` (7-day) + `/current.json`
- **Auth**: API key (hardcoded in WeatherApiService.swift)
- **Locations**: Pune, Mumbai (hardcoded enums)

## Security Notes
⚠️ **API Key Exposed**: Hardcoded in `WeatherApiService.swift:21` — should move to Info.plist or environment config
