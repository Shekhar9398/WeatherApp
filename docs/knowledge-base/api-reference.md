# API Reference

## External APIs
| Endpoint | Method | Purpose | Auth |
|----------|--------|---------|------|
| `https://api.weatherapi.com/v1/forecast.json` | GET | 7-day forecast + current | API Key |
| `https://api.weatherapi.com/v1/current.json` | GET | Current weather only | API Key |

**Query Parameters**:
- `key` — API key (hardcoded)
- `q` — Location (Pune, Mumbai)
- `days` — Forecast days (5 or 7)

## NetworkManager

### fetchData<T: Decodable>()
```swift
func fetchData<T: Decodable>(urlString: String,
                             completion: @escaping (Result<T, Error>) -> Void)
```
Generic method to fetch and decode JSON. Uses URLSession with completion handler.

**Parameters**:
- `urlString` — Full URL string
- `completion` — Result<T, Error> callback (main thread dispatch in caller)

**Error Handling**: Returns URLError or JSONDecoder error

## WeatherViewModel

### fetchForecastWeather(city:)
```swift
func fetchForecastWeather(city: Cities)
```
Fetches 7-day forecast for a city. Publishes result to `@Published var foreCastResponse`.

**Parameters**:
- `city` — Cities enum (Pune, Mumbai)

**Side Effects**: Updates `foreCastResponse`, prints debug logs

## Enums

| Enum | Cases | Usage |
|------|-------|-------|
| `Endpoint` | `.current`, `.forecast` | API path selection |
| `Days` | `.fiveDays`, `.sevenDays` | Forecast duration |
| `Cities` | `.pune`, `.mumbai` | Location selection |
