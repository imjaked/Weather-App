//
//  ContentView.swift
//  Shared
//
//  Created by Jake Deakin on 3/29/21.
//

import SwiftUI

struct WeatherView: View {

    @ObservedObject var viewModel: WeatherViewModel

    var body: some View {
        VStack(alignment: .center) {
            VStack {
                Text("Current Weather")
                    .font(.callout)
                    .foregroundColor(Color.gray)
                    .padding(5)
                Text(viewModel.cityName)
                    .font(.title2)
                    .fontWeight(.bold)
            }.padding(.top).frame(maxHeight: .infinity, alignment: .top)
            VStack {
                Text(viewModel.temperature)
                    .font(.system(size:148))
                    .bold()
                    .padding(5)
                Text(viewModel.weatherDescription)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
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
