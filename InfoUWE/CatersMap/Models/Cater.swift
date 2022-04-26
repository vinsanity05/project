//
//  Cater.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 02/02/2022.
//

import Foundation
import MapKit

struct Cater: Identifiable, Equatable {
    
    let id = UUID().uuidString // Creates a unique ID.
    let name: String // Name of the cater.
    let description: String // Description of the cater.
    let imageNames: [String] // Array of the image names.
    let coordinates: CLLocationCoordinate2D // Location of the cater.
    let link: String // Link of the website to find out more about the cater.
    
    // Equatable - this essentially means if two caters have the same id then they are the same caters.
    static func == (lhs: Cater, rhs: Cater) -> Bool {
        lhs.id == rhs.id
    }
}

