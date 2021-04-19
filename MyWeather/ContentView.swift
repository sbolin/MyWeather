//
//  ContentView.swift
//  Weather
//
//  Created by Scott Bolin on 3/8/21.
//

// coordinates: 13.677636, 100.685491

import SwiftUI

struct ContentView: View {
    
    @StateObject var forecastListVM = ForecastListViewModel()
    
    var body: some View {
        ZStack {
            BackgroundView()
//                .blendMode(.plusDarker)
            VStack {
                TitleView()
                
//                PickerView()
                Picker(selection: $forecastListVM.system, label: Text("Units")) {
                    Text("°C").tag(0)
                    Text("°F").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 150)
                .padding(.bottom, 4)
                
                LocationInputView()
                    .padding(.horizontal, 16)
                    .padding(.bottom, 8)
                
                ScrollView {
                    WeatherHourListView()
                    WeatherDailyListView()
                    Spacer()
                } // ScrollView
                .onAppear {
                        forecastListVM.getWeatherForecast()
                }
            } //VStack
            .alert(item: $forecastListVM.appError) { appAlert in
                Alert(
                    title: Text("Error"),
                    message: Text("\(appAlert.errorString)\nPlease try again later.")
                )
            } // alert
//                WeatherLoadingView()
            if forecastListVM.isLoading {
                Color(.white)
                    .opacity(0.5)
                    .ignoresSafeArea()
                ProgressView("Fetching Weather")
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.systemBackground))
                    )
                    .shadow(radius: 6)
            } // forecastListVM.isLoading
        } // Zstack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
