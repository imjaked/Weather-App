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
        VStack(alignment: .center) {
            VStack {
                Text("Current weather")
                    .font(.callout)
                    .foregroundColor(Color.gray)
                    .padding()
                Text(viewModel.cityName)
                    .font(.title2)
                    .fontWeight(.bold)
            }.padding(.top).frame(maxHeight: .infinity, alignment: .top)
            VStack {
                Text(viewModel.weatherIcon)
                .font(.largeTitle)
                .padding()
                Text(viewModel.temperature)
                .font(.system(size:96))
                .bold()
                Text(viewModel.weatherDescription)
                    .font(.title2)
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
                    .padding()
            }
            VStack {
              //centering
            }.frame(maxHeight: .infinity, alignment: .bottom)
        }.onAppear(perform:viewModel.refresh)
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            WeatherView(viewModel: WeatherViewModel(weatherService: WeatherService()))
    }
}
