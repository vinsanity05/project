//
//  Models.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 03/03/2022.
//

import Foundation

// Data

// codable is used to convert json data directly into structs
struct WeatherModel: Codable {
    let name: String
    let main: getweatherInfo
}

struct getweatherInfo: Codable {
    let temp: Double
    let temp_max: Double
}
