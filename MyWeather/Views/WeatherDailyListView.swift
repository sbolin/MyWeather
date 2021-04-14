//
//  WeatherDailyListView.swift
//  Weather
//
//  Created by Scott Bolin on 05-A-21.
//

import SwiftUI

struct WeatherDailyListView: View {
//    @StateObject var forecastListVM = ForecastListViewModel()
    @ObservedObject var forecastListVM = ForecastListViewModel()
    @ObservedObject var imageLoader = ImageLoader()
    
    private var columns: [GridItem] = [
        GridItem(.flexible(minimum: 100, maximum: 125), spacing: 0),
        GridItem(.flexible(minimum: 100, maximum: 125), spacing: 0)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text("Daily Weather")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                Spacer()
            } // HStack
            
//            ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                ForEach(forecastListVM.dailyForecast, id: \.day) { day in
                    ZStack {
                        Rectangle()
                            .fill(Color.white.opacity(0.5))
                        VStack(alignment: .leading) {
                            Text(day.day).font(.title)
                            Text(day.dailyOverview).font(.title2)
                            
                            HStack(alignment: .center) {
                                WeatherIconView(imageLoader: imageLoader, imageURL: day.weatherIconURL)
                                
                                LazyVGrid(columns: columns, alignment: .leading, spacing: 6) {
                                    Text(day.low)
                                    Text(day.high)
                                    Text(day.clouds)
                                    Text(day.pop)
                                    Text(day.humidity)
                                    Text(day.rain)
                                    Text(day.uvi)
                                } // VStack/LazyVGrid
                            } // HStack
                        } // VStack
                        .padding(6)
                    } // ZStack
                    .cornerRadius(6)
                } // ForEach
            } // VStack
            .padding()
//        } // Scrollview
        } // VStack
    } // View
}

struct WeatherDailyListView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDailyListView()
    }
}

