//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Jake Deakin on 3/29/21.
//

import Foundation

public class WeatherViewModel: ObservableObject {
    @Published var cityName: String = "Checking Weather..."
    @Published var temperature: String = ""
    @Published var weatherDescription: String = ""

public let weatherService: WeatherService

public init(weatherService: WeatherService) {
    self.weatherService = weatherService
}

public func refresh() {
    weatherService.loadWeatherData { weather in
        DispatchQueue.main.async {
            self.cityName = weather.city.capitalized
            self.temperature = "\(weather.temperature)°"
            self.weatherDescription = weather.description.capitalized
            }
        }
    }
}
