//
//  Building.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 02/02/2022.
//

import Foundation
import MapKit

// This will essentially help make the data service
struct Building: Identifiable, Equatable {
    
    
    let id = UUID().uuidString // Creates a unique id
    let name: String // Name of the building
    let description: String // Description of the building
    let imageNames: [String] // Image of the building, [string] incase if there are more than 1 image
    let coordinates: CLLocationCoordinate2D // Coordinates of the building
    let link: String // Link to the website of that specific building
    
    //Equatable - this essentially means if two buildings have the same id then they are the same building.
    static func == (lhs: Building, rhs: Building) -> Bool {
        lhs.id == rhs.id
    }
    
}


