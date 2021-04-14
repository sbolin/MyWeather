//
//  HourlyForecastViewModel.swift
//  Weather
//
//  Created by Scott Bolin on 05-A-21.
//

import Foundation

struct HourlyForecastViewModel {
    let hourlyForecast: Forecast.Hourly
    var system: Int
    let formatter = Formatter()
    
    var hour: String {
        return Formatter.hourlyDateFormatter.string(from: hourlyForecast.dt)
    }
    
    var hourlyOverview: String {
        hourlyForecast.weather[0].description.capitalized // weather
    }
    
    var temp: String {
        return "🌡 \(Formatter.numberFormatter2.string(for: convert(hourlyForecast.temp)) ?? "N/A")°"
    }
    
    var feelsLike: String {
        if let feelsLike = hourlyForecast.feelsLike {
            return "🥵/🥶 \(Formatter.numberFormatter2.string(for: convert(feelsLike)) ?? "N/A")°"
        } else {
            return "N/A"
        }
    }

    var pop: String {
        return "pop \(Formatter.numberFormatter.string(for: hourlyForecast.pop) ?? "0%")"
    }
    
    var clouds: String {
        return "☁️ \(hourlyForecast.clouds)%"
    }
    
    var humidity: String {
        return "💦 \(hourlyForecast.humidity)%"
    }
    
    var rain: String {
        let amount = hourlyForecast.rain?.the1H ?? 0
        return "🌧 \(Formatter.numberFormatter3.string(for: amount) ?? "0.00") mm"
    }
    
    var uvi: String {
        return "🕶 \(Formatter.numberFormatter3.string(for: hourlyForecast.uvi) ?? "0.00")"
    }
    
    var weatherIconURL: URL {
        let urlString = "https://openweathermap.org/img/wn/\(hourlyForecast.weather[0].icon)@2x.png"
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
    
    
    //    var pressure: String {
    //        return "􀍽 \(hourlyForecast.pressure)"
    //    }
    
    //    var dewPoint: String {
    //        return "􀇬􀠑 \(Formatter.numberFormatter2.string(for: formatter.convert(hourlyForecast.dewPoint, system: system)) ?? "N/A")°"
    //    }
    
    //    var visibility: String {
    //        return "􀖆 \(hourlyForecast.visibility)"
    //    }
    
    //    var windSpeed: String {
    //        return "\(Formatter.numberFormatter3.string(for: hourlyForecast.windSpeed) ?? "0.00")m/s"
    //    }
    
    //    var windDirection: String {
    //        return "🧭 \(hourlyForecast.windDeg ?? 0)"
    //    }
    
    //    var windGust: String {
    //        return "􀇧 \(Formatter.numberFormatter3.string(for: hourlyForecast.windGust) ?? "0.00")m/s"
    //    }
}

// http://openweathermap.org/img/wn/10d@2x.png
