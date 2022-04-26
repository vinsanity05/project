//
//  ViewModel.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 03/03/2022.
//

import Foundation

//data needed by view

class WeatherViewModel: ObservableObject {
    //everytime that these properties get updated, any view holding on to an instance of this view model will go ahead and update the UI
    @Published var temp: String = ""
    @Published var name: String = ""
    @Published var tempMax: String = ""
    
    // this will make the API call.
    init() {
        fetchWeather()
    }
    func fetchWeather() {
        // get the API of the weather in bristol
        guard let url = URL(string:
                                "https://api.openweathermap.org/data/2.5/weather?q=Bristol,uk&appid=32ea389209609e69059711e097cc1f49&units=metric") else {
            fatalError("missing URL")
        }
        // share the URL
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            //convert data to model
            do {
                // this will decode the model
                let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                // this will set the name of the location, the temperature right now and the max temperature of the day.
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

