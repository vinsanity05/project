//
//  ViewModel.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 03/03/2022.
//

import Foundation

// Data needed by view.

class WeatherViewModel: ObservableObject {
    // Everytime that these properties gets updated, any view holding on to an instance of this view model will go ahead and update the UI.
    @Published var temp: String = ""
    @Published var name: String = ""
    @Published var tempMax: String = ""
    
    // This will make the API call.
    init() {
        fetchWeather()
    }
    func fetchWeather() {
        // Get the API of the weather in Bristol.
        guard let url = URL(string:
                                "https://api.openweathermap.org/data/2.5/weather?q=Bristol,uk&appid=32ea389209609e69059711e097cc1f49&units=metric") else {
            fatalError("missing URL")
        }
        // Share the URL.
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            // Convert data to model.
            do {
                // This will decode the model.
                let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                // This will set the name of the location, the temperature right now in real time and the max temperature of the day.
                DispatchQueue.main.async {
                    self.name = model.name
                    self.temp = "\(model.main.temp.roundDouble())°C"
                    self.tempMax = "\(model.main.temp_max.roundDouble())°C"
                }
            }
            catch {
                print("failed")
            }
        }
        task.resume()
    }
}

