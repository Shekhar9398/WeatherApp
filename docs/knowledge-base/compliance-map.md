# Security & Compliance Map

## Security Issues (Current)

| Issue | Severity | Location | Details |
|-------|----------|----------|---------|
| Exposed API Key | **HIGH** | WeatherApiService.swift:21 | API key hardcoded in source: `16e05ecc5d6645829d561707252104` |
| No HTTPS Validation | Medium | NetworkManager.swift | Standard URLSession (may allow MITM in dev) |
| No Input Validation | Medium | WeatherViewModel.swift | City enum prevents injection, but no general validation |
| Debug Prints in Prod | Low | WeatherViewModel.swift:10,13,20,24 | Logs URLs, data counts, errors (info disclosure) |

## Privacy Considerations
- ✓ No user data collection (weather API call with public location only)
- ✓ No tracking or analytics
- ✓ No persistent storage of fetched data
- ⚠ Geo-location hardcoded (Pune) — not user-configurable

## Recommendations
1. **Move API Key**: Use Info.plist, environment variables, or backend proxy
2. **Disable Debug Logs**: Remove print() statements or wrap in DEBUG macro
3. **Add Error UI**: Show user-facing errors instead of silent failures
4. **Use Async/Await**: Modernize from completion handlers to async/await (iOS 13+)
5. **Add Input Validation**: For any future user location input
