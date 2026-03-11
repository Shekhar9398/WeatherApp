# Data Models

## ForecastResponse (Root)
| Field | Type | Notes |
|-------|------|-------|
| `location` | Location | City, coords, timezone |
| `current` | CurrentWeather | Now: temp, wind, humidity, UV |
| `forecast` | Forecast | Multi-day data |

## Location
| Field | Type | Notes |
|-------|------|-------|
| `name` | String | City name (Pune, Mumbai) |
| `region` | String | State/region |
| `country` | String | Country code |
| `lat` | Double | Latitude |
| `lon` | Double | Longitude |
| `tz_id` | String | Timezone ID |
| `localtime_epoch` | Int | Unix timestamp |
| `localtime` | String | Local datetime string |

## CurrentWeather
| Field | Type | Notes |
|-------|------|-------|
| `temp_c` | Double | Temperature (Celsius) |
| `temp_f` | Double | Temperature (Fahrenheit) |
| `is_day` | Int | 1=day, 0=night |
| `condition` | WeatherCondition | Text, icon, code |
| `wind_kph` | Double | Wind speed (km/h) |
| `wind_dir` | String | Cardinal (N, NE, etc.) |
| `humidity` | Int | Percentage (0-100) |
| `feelslike_c` | Double | Feels-like temp (C) |
| `uv` | Double | UV index |
| + 10 more (pressure, dew point, visibility, etc.) | — | See model file |

## Forecast
| Field | Type | Notes |
|-------|------|-------|
| `forecastday` | [ForecastDay] | Array of daily forecasts |

## ForecastDay
| Field | Type | Notes |
|-------|------|-------|
| `date` | String | YYYY-MM-DD |
| `day` | DayWeather | Daily aggregates |
| `hour` | [HourlyWeather] | 24 hourly records |
| `astro` | Astro | Sunrise, sunset, moon data |

## DayWeather
| Field | Type | Notes |
|-------|------|-------|
| `maxtemp_c` | Double | High temperature |
| `mintemp_c` | Double | Low temperature |
| `condition` | WeatherCondition | Daily condition |
| `uv` | Double | UV index |
| + others (precip, snow, humidity, rain chance) | — | See model file |

## WeatherCondition
| Field | Type | Notes |
|-------|------|-------|
| `text` | String | "Clear", "Rainy", etc. |
| `icon` | String | Icon URL |
| `code` | Int | Condition code |

## Astro
| Field | Type | Notes |
|-------|------|-------|
| `sunrise` | String | HH:MM format |
| `sunset` | String | HH:MM format |
| `moonrise` | String | HH:MM format |
| `moonset` | String | HH:MM format |
| `moon_phase` | String | Phase name |
| `moon_illumination` | Int | Percentage |

## HourlyWeather
| Field | Type | Notes |
|-------|------|-------|
| `time` | String | YYYY-MM-DD HH:MM |
| `temp_c` | Double | Hourly temperature |
| `condition` | WeatherCondition | Hourly condition |
| `wind_kph` | Double | Hourly wind |
| `chance_of_rain` | Int | Percentage |
| + 15 more (visibility, humidity, feels-like, etc.) | — | See model file |
