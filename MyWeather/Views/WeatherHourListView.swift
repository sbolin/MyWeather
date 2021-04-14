//
//  WeatherHourListView.swift
//  Weather
//
//  Created by Scott Bolin on 06-A-21.
//

import SwiftUI

struct WeatherHourListView: View {
//    @StateObject var forecastListVM = ForecastListViewModel()
    @ObservedObject var forecastListVM = ForecastListViewModel()
    @ObservedObject var imageLoader = ImageLoader()
    
    private var columns: [GridItem] = [
        GridItem(.flexible(minimum: 100, maximum: 125), spacing: 0),
        GridItem(.flexible(minimum: 100, maximum: 125), spacing: 0)
//        GridItem(.fixed(120), spacing: 0),
//        GridItem(.fixed(120), spacing: 0)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Hourly Weather")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(forecastListVM.hourlyForecast, id: \.hour) { hour in
                        ZStack {
                            Rectangle()
                                .fill(Color.white.opacity(0.5))
                            VStack(alignment: .leading) {
                                Text(hour.hour).font(.title)
                                Text(hour.hourlyOverview).font(.title2)
                                
                                HStack(alignment: .center) {
                                    WeatherIconView(imageLoader: imageLoader, imageURL: hour.weatherIconURL)
                                    
                                    LazyVGrid(columns: columns, alignment: .leading, spacing: 6) {
                                        Text(hour.temp)
                                        Text(hour.feelsLike)
                                        Text(hour.clouds)
                                        Text(hour.pop)
                                        Text(hour.humidity)
                                        Text(hour.rain)
                                        Text(hour.uvi)
                                    } // VStack/LazyVGrid
                                } // HStack
                            } // VStack
                            .padding(6)
                        } // ZStack
                        .cornerRadius(6)
                    } // ForEach
                } // HStack
                .padding()
            } // Scrollview
        } // VStack
    } // View
}

struct WeatherHourListView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherHourListView()
    }
}
