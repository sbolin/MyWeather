//
//  ForecastViewModel.swift
//  Weather
//
//  Created by Scott Bolin on 3/8/21.
//

import Foundation
import CoreLocation
import SwiftUI

class ForecastViewModel: ObservableObject {
    
    struct AppError: Identifiable {
        let id = UUID().uuidString
        let errorString: String
    }
    
    @Published var dailyForecast: [DailyForecastViewModel] = []
    @Published var hourlyForecast: [HourlyForecastViewModel] = []
//    @Published var currentForecast: CurrentForecastViewModel
    var appError: AppError? = nil
    let apiService = APIServiceCombine.shared //  APIService.shared
    @Published var isLoading: Bool = false
    @AppStorage("location") var storageLocation: String = ""
    @Published var location = ""
    @AppStorage("system") var system: Int = 0 {
        didSet {
            for i in 0..<dailyForecast.count {
                dailyForecast[i].system = system
            }
            for j in 0..<hourlyForecast.count {
                hourlyForecast[j].system = system
            }
        }
    }
    
    init() {
        location = storageLocation
        getWeatherForecast()
    }
    
    func getWeatherForecast() {
        print(#function, "has been called for \(location)")
        isLoading = true
        storageLocation = location
        UIApplication.shared.endEditing()
        if location == "" {
            dailyForecast = []
            hourlyForecast = []
            isLoading = false
        } else {
            CLGeocoder().geocodeAddressString(location) { (placemarks, error) in
                if let error = error as? CLError {
                    switch error.code {
                        case .locationUnknown, .geocodeFoundNoResult, .geocodeFoundPartialResult:
                            self.appError = AppError(errorString: NSLocalizedString("Unable to determine location, please check location.", comment: "Location error"))
                        case .network:
                            self.appError = AppError(errorString: NSLocalizedString("Network error, please check connection.", comment: "Network error"))
                        default:
                            self.appError = AppError(errorString: error.localizedDescription)
                    } // switch
                    self.dailyForecast = []
                    self.hourlyForecast = []
                    self.isLoading = false
                    
                } // if let error
                if let lat = placemarks?.first?.location?.coordinate.latitude,
                   let lon = placemarks?.first?.location?.coordinate.longitude {
                    
                    print(#function)
                    print("location found: \(lat) / \(lon)")
                    
                    let weatherURL = "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=minutely,alerts&appid=\(Secrets.apiKey)"
                    
                    self.apiService.getJSON(urlString: weatherURL, dateDecodingStrategy: .secondsSince1970) { (result: Result<Forecast, APIServiceCombine.APIError>) in
                        
                        print(#function)
                        print("back from getJSON with result \(result)")
                        
                        switch result {
                            case .success(let forecast):
                                DispatchQueue.main.async {
                                    self.isLoading = false
                                    self.dailyForecast = forecast.daily.map {
                                        DailyForecastViewModel(dailyForecast: $0, system: self.system) }
                                    self.hourlyForecast = forecast.hourly.map {
                                        HourlyForecastViewModel(hourlyForecast: $0, system: self.system)
                                    }
                                }
                            case .failure(let apiError):
                                DispatchQueue.main.async {
                                    self.isLoading = false
                                }
                                switch apiError {
                                    case .error(let errorString):
                                        self.appError = AppError(errorString: errorString)
                                        print(errorString)
                                } // switch apiError
                        } // switch result
                    } // getJSON closure
                } else { // location is not ok, clear
                    self.dailyForecast = []
                    self.hourlyForecast = []
                    self.isLoading = false
                } // else
            } // CLGeocoder
        } // if/else location
    } // getWeatherForecast
}
