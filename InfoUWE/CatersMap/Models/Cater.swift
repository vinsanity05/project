//
//  Cater.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 02/02/2022.
//

import Foundation
import MapKit

struct Cater: Identifiable, Equatable {
    
    let id = UUID().uuidString // creates a unique ID
    let name: String // name of the cater
    let description: String // description of the cater
    let imageNames: [String] // array of the image names
    let coordinates: CLLocationCoordinate2D // location of the cater
    let link: String // link of the website to find out more about the cater.
    
    //Equatable - this essentially means if two caters have the same id then they are the same caters.
    static func == (lhs: Cater, rhs: Cater) -> Bool {
        lhs.id == rhs.id
    }
}

