import Foundation

class WeatherViewModel: ObservableObject {
    @Published var foreCastResponse: ForecastResponse?
    @Published var errorMessage: String?
    @Published var selectedCity: Cities = .pune

    let service = WeatherApiService()

    func fetchForecastWeather(city: Cities) {
        selectedCity = city
        errorMessage = nil
        service.setUrl(endpoint: .forecast, location: city, days: .sevenDays)

        NetworkManager.shared.fetchData(urlString: service.url) { [weak self] (result: Result<ForecastResponse, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let weather):
                    self?.foreCastResponse = weather
                    self?.errorMessage = nil
                case .failure(let error):
                    self?.errorMessage = "Failed to load weather: \(error.localizedDescription)"
                    self?.foreCastResponse = nil
                }
            }
        }
    }
}
