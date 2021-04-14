//
//  DailyForecastViewModel.swift
//  Weather
//
//  Created by Scott Bolin on 3/8/21.
//

import Foundation

struct DailyForecastViewModel {
    let dailyForecast: Forecast.Daily
    var system: Int
    let formatter = Formatter()

    var day: String {
        return Formatter.dailyDateFormatter.string(from: dailyForecast.dt)
    }
    
    var dailyOverview: String {
        dailyForecast.weather[0].description.capitalized // weather
    }
    
    var high: String {
        return "🥵: \(Formatter.numberFormatter2.string(for: convert(dailyForecast.temp.max)) ?? "N/A")°"
    }
    
    var low: String {
        return "🥶: \(Formatter.numberFormatter2.string(for: convert(dailyForecast.temp.min)) ?? "N/A")°"
    }
    
    var pop: String {
        return "pop \(Formatter.numberFormatter.string(for: dailyForecast.pop) ?? "0%")"
    }
    
    var clouds: String {
        return "☁️ \(dailyForecast.clouds)%"
    }
    
    var humidity: String {
        return "💦% \(dailyForecast.humidity)%"
    }
    
    var rain: String {
        let amount = dailyForecast.rain ?? 0
        return "🌧 \(Formatter.numberFormatter3.string(for: amount) ?? "0.00") mm"
    }
    
    var uvi: String {
        return "🕶 \(Formatter.numberFormatter3.string(for: dailyForecast.uvi) ?? "0.00")"
    }
    
    var weatherIconURL: URL {
        let urlString = "https://openweathermap.org/img/wn/\(dailyForecast.weather[0].icon)@2x.png"
        return URL(string: urlString)!
    }
    
    func convert(_ temp: Double) -> Double {
        let celcius = temp - 273.5
        if system == 0 {
            return celcius
        } else {
            return celcius * 9 / 5 + 32
        }
    }
    
    
    // more involved method, getting day/night icons
    func iconString(iconName: String) -> (String, String) {
        var dayString: String = ""
        var nightString: String = ""
        if dailyForecast.weather[0].icon.contains("d") {
            dayString = dailyForecast.weather[0].icon
            nightString = dailyForecast.weather[0].icon.replacingOccurrences(of: "d", with: "n")
        } else {
            nightString = dailyForecast.weather[0].icon
            dayString = dailyForecast.weather[0].icon.replacingOccurrences(of: "n", with: "d")
        }
        return (dayString, nightString)
    }
    
    var weatherIconURLDay: URL {
        let string = iconString(iconName: dailyForecast.weather[0].icon)
        let urlString = "https://openweathermap.org/img/wn/\(string.0)@2x.png"
        return URL(string: urlString)! // not great, should check first and provide replacement if nil
        
    }
    var weatherIconURLNite: URL {
        let string = iconString(iconName: dailyForecast.weather[0].icon)
        let urlString = "https://openweathermap.org/img/wn/\(string.1)@2x.png"
        return URL(string: urlString)! // not great, should check first and provide replacement if nil
    }
}

// http://openweathermap.org/img/wn/10d@2x.png
