//
//  Forecast.swift
//  Weather
//
//  Created by Scott Bolin on 3/30/21.
//

import Foundation

// MARK: - Forecast
struct Forecast: Decodable {
//    let current: Current
    let hourly: [Hourly]
    let daily: [Daily]
    
    // MARK: - Hourly
    struct Hourly: Decodable {
        
        let dt: Date
        let temp: Double
        let feelsLike: Double?
        let humidity: Int
        let weather: [Weather]
        let clouds: Int
        let pop: Double?
        let rain: Rain?
        let uvi: Double?
//        let windSpeed: Double?
//        let windDeg: Int?
        
        // MARK: - CurrentWeather
        struct Weather: Decodable {
            let id: Int
            let description: String
            let icon: String
        }
        
        // MARK: - Rain
        struct Rain: Decodable {
            let the1H: Double
            
            enum CodingKeys: String, CodingKey {
                case the1H = "1h"
            }
        }
    }
    
    // MARK: - Daily
    struct Daily: Decodable {
        let dt: Date
//        let sunrise: Int
//        let sunset: Int
        let temp: Temp
        let humidity: Int
        let weather: [Weather]
        let clouds: Int
        let pop: Double?
        let rain: Double?
        let uvi: Double?
        
        // MARK: - Temp
        struct Temp: Decodable {
            let min: Double
            let max: Double
        }
        
        //MARK: - Daily Weather
        struct Weather: Decodable {
            let id: Int // weather condition codes
            let description: String // weather
            let icon: String
        }
    }
/*
    // MARK: - Current
    struct Current: Decodable {
        let dt: Date
        let sunrise: Date
        let sunset: Date
        let temp: Double
        let feelsLike: Double
        let pressure: Int
        let humidity: Int
        let dewPoint: Double
        let uvi: Double
        let clouds: Int
        let visibility: Int
        let windSpeed: Double
        let windDeg: Int
        let weather: [Weather]
        let rain: Rain?
        
        // MARK: - CurrentWeather
        struct Weather: Decodable {
            let id: Int
            let description: String
            let icon: String
        }
        
        // MARK: - Rain
        struct Rain: Decodable {
            let the1H: Double
            
            enum CodingKeys: String, CodingKey {
                case the1H = "1h"
            }
        }
    }
*/
}



// api call: https://api.openweathermap.org/data/2.5/onecall?lat=13.677636&lon=100.685491&exclude=minutely,alerts&appid=fd938577e5e50f270dcb8457a8b1fbe1
