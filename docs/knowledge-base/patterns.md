# Coding Patterns & Conventions

## Architecture Pattern: MVVM
- **Model**: `ForecastResponse` (Codable structs)
- **View**: `ContentView` (SwiftUI)
- **ViewModel**: `WeatherViewModel` (ObservableObject with @Published)

## Networking Pattern
1. **API Service Enum** (`WeatherApiService`): Builds URLs with endpoint, location, days
2. **Generic NetworkManager** (`NetworkManager`): Singleton, generic `fetchData<T>()` with Result type
3. **View Model Fetch** (`fetchForecastWeather`): Calls service, publishes result

## State Management
- `@StateObject` for ViewModel initialization
- `@Published` for reactive data binding
- `@State` for local UI state (isDay toggle)
- Main thread dispatch in DispatchQueue.main.async

## Custom Components
- **LottieView**: UIViewRepresentable wrapper for Lottie animations
- **MyFont**: Enum-based font factory (custom Futura font)

## UI Patterns
- **GeometryReader**: Responsive layout calculations
- **ZStack**: Layering (background + foreground animation)
- **ScrollView with ScrollTransition**: Scale + offset effects on scroll
- **LinearGradient Mask**: Fade effect at scroll boundaries
- **withAnimation**: Explicit animation for state changes

## Error Handling
- URLError, JSONDecoder errors printed to console
- No UI error state (loads forever if fails)

## Naming Conventions
- CamelCase for variables, functions
- MARK: comments for method organization
- snake_case for API fields (from API response)
- Abbreviated words (temp, kph, feelslike)

## Debug Practices
- `print()` statements for fetch URL, success count, errors
- No logging framework (raw print to console)

## Code Style
- Custom enum rawValue for API path construction
- Functional array iteration (ForEach with Identifiable id)
- Safe force unwraps (guards in NetworkManager)
