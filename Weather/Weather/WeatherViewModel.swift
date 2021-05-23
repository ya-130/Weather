//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Егор Яковин on 23.05.2021.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    @Published private var weather: Weather?
    
    var temperature: Int {
        guard let temperature = weather?.current?.temperature else {
            return 0
        }
        return temperature
    }
    var humidity: Int {
        guard let humidity = weather?.current?.humidity else {
            return 0
        }
        return humidity
    }
    var feelslike: Int {
        guard let feelslike = weather?.current?.feelslike else {
            return 0
        }
        return feelslike
    }
    
    func fetchweather(city: String) {
        WeatherService().getweather(city: city) { result in
            switch result {
            case .success(let weather):
                DispatchQueue.main.async {
                    self.weather = weather
                }
            case .failure(_):
                print("Error")
            }
        }
    }
}
