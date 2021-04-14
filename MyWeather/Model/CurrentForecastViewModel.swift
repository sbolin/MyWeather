//
//  CurrentForecastViewModel.swift
//  Weather
//
//  Created by Scott Bolin on 05-A-21.
//

import Foundation
/*
struct CurrentForecastViewModel {
    let currentForecast: Current //Forecast.Current
    var system: Int
    let formatter: Formatter

    
    var day: String {
        return Formatter.dailyDateFormatter.string(from: currentForecast.dt)
    }
    
    var sunRise: String {
        return "􀆱\(Formatter.dailyDateFormatter.string(from: currentForecast.sunrise))"
    }

    var sunSet: String {
        return "􀆳\(Formatter.dailyDateFormatter.string(from: currentForecast.sunset))"
    }
    
    var dailyOverview: String {
        currentForecast.weather[0].description.capitalized // weather
    }
    
    var temp: String {
        return "􀇬: \(Formatter.numberFormatter2.string(for: formatter.convert(currentForecast.temp, system: system)) ?? "N/A")°"
    }
    
    var feelsLike: String {
        return "Feels like\(Formatter.numberFormatter2.string(for: formatter.convert(currentForecast.temp, system: system)) ?? "N/A")°"
    }
    
    var pressure: String {
        return "􀍽 \(currentForecast.pressure)"
    }
    
    var clouds: String {
        return "􀇂 \(currentForecast.clouds)%"
    }
    
    var humidity: String {
        return "􀠑% \(currentForecast.humidity)%"
    }
    
    var rain: String {
        return "􀇈 \(Formatter.numberFormatter3.string(for: currentForecast.rain) ?? "0.00")mm"
    }
    
    var dewPoint: String {
        return "􀇬􀠑 \(Formatter.numberFormatter2.string(for: formatter.convert(currentForecast.dewPoint, system: system)) ?? "N/A")°"
    }
    
    var visibility: String {
        return "􀖆 \(currentForecast.visibility)"
    }
    
    var uvi: String {
        return "UVI \(Formatter.numberFormatter3.string(for: currentForecast.uvi) ?? "0.00")"
    }
    
    var windSpeed: String {
        return "􀇤 \(Formatter.numberFormatter3.string(for: currentForecast.windSpeed) ?? "0.00")mm"
    }
    
    var windDirection: String {
        return "🧭 \(currentForecast.windDeg)"
    }
    
    // simple method
    var weatherIconURL: URL {
        // http://openweathermap.org/img/wn/10d@2x.png
        let urlString = "https://openweathermap.org/img/wn/\(currentForecast.weather[0].icon)@2x.png"
        return URL(string: urlString)!
    }
    
    
    // more involved method, getting day/night icons
    func iconString(iconName: String) -> (String, String) {
        var dayString: String = ""
        var nightString: String = ""
        if currentForecast.weather[0].icon.contains("d") {
            dayString = currentForecast.weather[0].icon
            nightString = currentForecast.weather[0].icon.replacingOccurrences(of: "d", with: "n")
        } else {
            nightString = currentForecast.weather[0].icon
            dayString = currentForecast.weather[0].icon.replacingOccurrences(of: "n", with: "d")
        }
        return (dayString, nightString)
    }
    
    var weatherIconURLDay: URL {
        let string = iconString(iconName: currentForecast.weather[0].icon)
        let urlString = "https://openweathermap.org/img/wn/\(string.0)@2x.png"
        return URL(string: urlString)! // not great, should check first and provide replacement if nil
        
    }
    var weatherIconURLNite: URL {
        let string = iconString(iconName: currentForecast.weather[0].icon)
        let urlString = "https://openweathermap.org/img/wn/\(string.1)@2x.png"
        return URL(string: urlString)! // not great, should check first and provide replacement if nil
    }
}
*/
