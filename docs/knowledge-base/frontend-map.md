# Frontend Map

## ContentView → API

| UI Section | Data Source | API Field |
|------------|-------------|-----------|
| **Location** | `foreCastResponse.location.name` | Location.name |
| **Current Temp** | `foreCastResponse.current.temp_c` | CurrentWeather.temp_c |
| **Condition** | `foreCastResponse.current.condition.text` | CurrentWeather.condition.text |
| **Day/Night Animation** | `@State var isDay` (user toggle) | Manual toggle |
| **Wind** | `foreCastResponse.current.wind_kph`, `wind_dir` | CurrentWeather wind_* |
| **Feels Like** | `foreCastResponse.current.feelslike_c` | CurrentWeather.feelslike_c |
| **Humidity** | `foreCastResponse.current.humidity` | CurrentWeather.humidity |
| **UV Index** | `foreCastResponse.current.uv` | CurrentWeather.uv |
| **Forecast Cards** | `foreCastResponse.forecast.forecastday[]` | Forecast.forecastday[*] |
| **Forecast Card — Weekday** | `day.date` → formatted via DateFormatter | ForecastDay.date |
| **Forecast Card — Max/Min** | `day.day.maxtemp_c`, `mintemp_c` | ForecastDay.day.maxtemp_c/c |
| **Forecast Card — Condition** | `day.day.condition.text` | ForecastDay.day.condition.text |

## View Hierarchy
```
WeatherAppApp
└── ContentView
    ├── GeometryReader
    │   └── VStack
    │       ├── ZStack (Current Weather + Lottie Sun/Moon)
    │       │   ├── LottieView(animationName: "sun3D" or "moon3D")
    │       │   └── VStack (Location, Temp, Condition)
    │       ├── VStack (Details: Wind, Feels Like, Humidity, UV)
    │       ├── ZStack (Scrollable Forecast)
    │       │   ├── ScrollView
    │       │   │   └── VStack
    │       │   │       └── ForEach(forecastday)
    │       │   │           └── VStack (Card)
    │       │   └── LinearGradient Mask (fade edges)
    │       └── Spacer
    └── Background Image (DesertNight or StaryNight)
```

## State Management
| State Variable | Type | Source | Used By |
|----------------|------|--------|---------|
| `@StateObject viewModel` | WeatherViewModel | Initialized in ContentView | Binding to foreCastResponse |
| `@State isDay` | Bool | User tap toggle | Background image + animation selection |
| `@Published foreCastResponse` | ForecastResponse? | ViewModel fetch | Bindings in View |

## Interactions
- **Tap to Toggle Day/Night**: Updates `isDay` → changes background image + Lottie animation
- **Scroll Forecast**: ScrollView with `scrollTransition` (scale 0.8 → 1.0) + fade mask
- **Load on Appear**: `ContentView.onAppear` → `viewModel.fetchForecastWeather(city: .pune)`
