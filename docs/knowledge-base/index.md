# Knowledge Base Index

## Documentation Files

| File | Purpose | Key Topics |
|------|---------|-----------|
| **overview.md** | Project summary | Tech stack, structure, features, data flow, external API |
| **api-reference.md** | API contracts | Endpoints, NetworkManager, WeatherViewModel methods, enums |
| **data-models.md** | Data structures | ForecastResponse, Location, CurrentWeather, Forecast, etc. |
| **frontend-map.md** | UI bindings | View → API mapping, view hierarchy, state, interactions |
| **patterns.md** | Code conventions | MVVM, networking, state management, UI patterns, naming |
| **compliance-map.md** | Security notes | Issues, privacy, recommendations |

## File Structure
```
WeatherApp/
├── docs/knowledge-base/          [KB]
├── Pods/                          [Dependencies]
├── Podfile                        [Dependency config]
└── WeatherApp/
    ├── Main/WeatherAppApp.swift
    ├── View/ContentView.swift
    ├── View Models/WeatherViewModel.swift
    ├── Model/ForecastResponse.swift
    ├── NetworkManager/NetworkManager.swift
    ├── NetworkManager/WeatherApiService.swift
    ├── Helper/LottieView.swift
    ├── Helper/MyFont.swift
    └── Reference View/ (unused)
```

## Key Classes & Structures
- **WeatherAppApp**: App entry point
- **ContentView**: Main UI (weather display + forecast)
- **WeatherViewModel**: MVVM view model
- **ForecastResponse**: API response root model
- **NetworkManager**: Generic HTTP client (singleton)
- **WeatherApiService**: Weather API endpoint builder
- **LottieView**: UIViewRepresentable wrapper
- **MyFont**: Custom font enum

## External Dependencies
- **lottie-ios**: Lottie animation framework
- **iOS 15.0+**: Minimum deployment target

## Quick Links
- **API**: WeatherAPI.com — /forecast.json endpoint
- **Cities**: Pune, Mumbai (hardcoded)
- **Auth**: API key in WeatherApiService.swift (⚠️ exposed)
