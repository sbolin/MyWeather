//
//  LocationInputView.swift
//  Weather
//
//  Created by Scott Bolin on 05-A-21.
//

import SwiftUI

struct LocationInputView: View {
    @StateObject var forecastListVM = ForecastViewModel()
    
    var body: some View {
        HStack {
            TextField("Enter Location", text: $forecastListVM.location, onCommit: {
                forecastListVM.getWeatherForecast()
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .overlay (
                Button(action: {
                    forecastListVM.location = ""
                    forecastListVM.dailyForecast = []
                    forecastListVM.hourlyForecast = []
                    forecastListVM.getWeatherForecast()
                }) {
                    Image(systemName: "xmark.circle")
                        .foregroundColor(.gray)
                        .frame(width: 24, height: 24)
                }
                .padding(.horizontal, 8),
                alignment: .trailing
            )
            Button {
                forecastListVM.getWeatherForecast()
            } label: {
                Image(systemName: "magnifyingglass.circle.fill")
                    .font(.title2)
                    .foregroundColor(Color(.blue))
            } // Button/Label
        } // HStack
    } // View
}

struct LocationInputView_Previews: PreviewProvider {
    static var previews: some View {
        LocationInputView()
    }
}
