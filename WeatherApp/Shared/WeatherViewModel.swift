//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Jake Deakin on 3/29/21.
//

import Foundation

private let defaultIcon = "❓"

private let iconMap = [
    "Thunderstorm" : "⛈",
    "Drizzle" : "🌦",
    "Rain" : "🌧",
    "Snow" : "🌨",
    "Mist" : "🌨",
    "Smoke" : "🌨",
    "Haze" : "🌨",
    "Dust" : "🌨",
    "Fog" : "🌫",
    "Sand" : "🌨",
    "Ash" : "🌨",
    "Squall" : "🌨",
    "Tornado" : "🌨",
    "Clear" : "☀️",
    "Clouds" : "🌥",
]

public class WeatherViewModel: ObservableObject {
    @Published var cityName: String = "Checking weather..."
    @Published var temperature: String = "103°F"
    @Published var weatherDescription: String = "nice description"
    @Published var weatherIcon: String = defaultIcon

public let weatherService: WeatherService

public init(weatherService: WeatherService) {
    self.weatherService = weatherService
}

public func refresh() {
    weatherService.loadWeatherData { weather in
        DispatchQueue.main.async {
            self.cityName = weather.city
            self.temperature = "\(weather.temperature)°F"
            self.weatherDescription = weather.description.capitalized
            self.weatherIcon = iconMap[weather.iconName] ?? defaultIcon
            }
        }
    }
}
