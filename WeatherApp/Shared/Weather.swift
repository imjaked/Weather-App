//
//  Weather.swift
//  Weather
//
//  Created by Jake Deakin on 3/29/21.
//

import Foundation

public struct Weather {
    let city: String
    let temperature: String
    let description: String

    init(response: APIResponse) {
        city = response.name
        temperature = "\(Int(response.main.temp))"
        description = response.weather.first?.description ?? ""
    }
}

