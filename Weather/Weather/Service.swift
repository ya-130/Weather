//
//  Service.swift
//  Weather
//
//  Created by Егор Яковин on 23.05.2021.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

class WeatherService: ObservableObject {
    
    func getweather(city: String, completion: @escaping (Result<Weather?, NetworkError>) -> Void) {
        guard let url = URL.urlWeather(city) else {
            return print(NetworkError.badURL)
        }
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard let data = data, error == nil else {
                return print(NetworkError.noData)
            }
            let weather = try? JSONDecoder().decode(Weather.self, from: data)
            if let weather = weather {
                completion(.success(weather))
            } else {
                print("JSON decode error")
            }
        }.resume()
    }
}

