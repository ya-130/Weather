//
//  URL.swift
//  Weather
//
//  Created by Егор Яковин on 23.05.2021.
//

import Foundation

extension URL {
    static func urlWeather(_ city: String) -> URL? {
        guard let url = URL(string: "http://api.weatherstack.com/current?access_key=62803b5614af50d8f0c05b17c901b77d&query=\(city)") else {
            return nil }
        return url
    }
}
