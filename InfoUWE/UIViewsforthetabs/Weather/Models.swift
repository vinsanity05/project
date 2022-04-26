//
//  Models.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 03/03/2022.
//

import Foundation

// This is the model data for the weather.

// Codable is used to convert json data directly into structs.
struct WeatherModel: Codable {
    let name: String
    let main: getweatherInfo
}

// Setting the temperature to double since its a float.
struct getweatherInfo: Codable {
    let temp: Double
    let temp_max: Double
}
