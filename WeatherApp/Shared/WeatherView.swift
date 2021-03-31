//
//  ContentView.swift
//  Shared
//
//  Created by Jake Deakin on 3/29/21.
//

import SwiftUI

// make some design tweaks 
struct WeatherView: View {

    @ObservedObject var viewModel: WeatherViewModel

    var body: some View {
        VStack {
            Text(viewModel.cityName)
            .font(.largeTitle)
            .padding()
            Text(viewModel.temperature)
            .font(.system(size:70))
            .bold()
            Text(viewModel.weatherIcon)
            .font(.largeTitle)
            .padding()
            Text(viewModel.weatherDescription)
        }   .onAppear(perform: viewModel.refresh)
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            WeatherView(viewModel: WeatherViewModel(weatherService: WeatherService()))
    }
}
