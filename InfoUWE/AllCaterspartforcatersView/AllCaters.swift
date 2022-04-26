//
//  AllCaters.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 05/02/2022.
//

import Foundation
import SwiftUI
import MapKit

struct AllCater: Identifiable {
    let id = UUID() // creating unique id
    let imageName: String // image of the cater
    let name: String // name of the cater
    let description: String // description of the cater
    let url: String // url/link of the cater website
    let coordinates: CLLocationCoordinate2D // coordinates of where the cater is
}

// list of all the caters
struct AllCaterList {
    
    static let nameofcaters = [
        
        AllCater(imageName: "The street 2",
                 name: "Street Cafe",
                 description: "Tasty, quick and exciting street food such as a grab and go service of sandwiches, freshly made baguettes, snacks, pastries, cakes, and hot and cold drinks. Located in S block.",
                 url: "https://www.uwe.ac.uk/life/campus-and-facilities/frenchay-campus/bars-cafes-and-shops#a9ad59644-320c-4470-a5e3-a1467ce82ad1", coordinates: CLLocationCoordinate2D(latitude: 51.49830975056084, longitude: -2.5486254036172107)),
     
        AllCater(imageName: "The grill",
                 name: "The Grill",
                 description: "The enthusiasts of piri piri sauce, serving meals bursting with flavour. Located in B block.",
                 url:  "https://www.uwe.ac.uk/life/campus-and-facilities/frenchay-campus/bars-cafes-and-shops#a9ad59644-320c-4470-a5e3-a1467ce82ad1", coordinates: CLLocationCoordinate2D(latitude: 51.49923736738787, longitude: -2.548136283499418)),
   
        AllCater(imageName: "starbucks",
                 name: "StarBucks",
                 description: "Our drinks range includes a wide range of premium coffees including whole bean and ground coffee, hot chocolate and a range of teas available. Our food range covers breakfast sandwiches/rolls and filled croissants as well as cakes, cookies and pastries to suit everyone’s tastes. Located in E block next to Onezone and library.",
                 url:  "https://www.uwe.ac.uk/life/campus-and-facilities/frenchay-campus/bars-cafes-and-shops#a9ad59644-320c-4470-a5e3-a1467ce82ad1", coordinates: CLLocationCoordinate2D(latitude: 51.500335, longitude: -2.548002)),
     
        AllCater(imageName: "Wafflemeister",
                 name: "Wafflemeister",
                 description: "It’s always brunch-time somewhere in the world and there’s no better place to indulge than at Wafflemeister. Located between blocks E/F/N block.",
                 url:  "https://www.uwe.ac.uk/life/campus-and-facilities/frenchay-campus/bars-cafes-and-shops#a9ad59644-320c-4470-a5e3-a1467ce82ad1", coordinates: CLLocationCoordinate2D(latitude: 51.500839, longitude: -2.547401)),
      
        AllCater(imageName: "The altrium",
                 name: "The Atrium Café",
                 description: "A café with outside seating serving locally sourced food and drink through a full hot a la carte menu, fresh sandwiches, snacks and speciality hot and cold drinks. Located in Bristol Business School Building.",
                 url:  "https://www.uwe.ac.uk/life/campus-and-facilities/frenchay-campus/bars-cafes-and-shops#a9ad59644-320c-4470-a5e3-a1467ce82ad1", coordinates: CLLocationCoordinate2D(latitude: 51.500969, longitude: -2.549901)),
       
        AllCater(imageName: "The student union bar",
                 name: "The Student Union bar",
                 description: "The coffee shop on the upper floor serves Starbucks coffee and fresh sandwiches and panini and the bar serves a wide range of food throughout the day. Located in U block, next to SU building.",
                 url:  "https://www.uwe.ac.uk/life/campus-and-facilities/frenchay-campus/bars-cafes-and-shops#a9ad59644-320c-4470-a5e3-a1467ce82ad1", coordinates: CLLocationCoordinate2D(latitude: 51.500475, longitude: -2.551564)),
     
        AllCater(imageName: "costa coffee",
                 name: "Costa coffee",
                 description: "Whether you want to wake yourself up with one of our short drinks or relax over a tall drink we’ve got a coffee to suit you. A café with outside seating serving a wide selection of sandwiches and snacks to enjoy on the go. Located in R block.",
                 url:  "https://www.uwe.ac.uk/life/campus-and-facilities/frenchay-campus/bars-cafes-and-shops#a9ad59644-320c-4470-a5e3-a1467ce82ad1", coordinates: CLLocationCoordinate2D(latitude: 51.502549, longitude: -2.548453)),
     
        AllCater(imageName: "Onezone 2",
                 name: "Onezone",
                 description: "Serving global cuisine and traditional flavours at unbeatable prices. Located in E block next to the Starbucks and library.",
                 url:  "https://www.uwe.ac.uk/life/campus-and-facilities/frenchay-campus/bars-cafes-and-shops#a9ad59644-320c-4470-a5e3-a1467ce82ad1", coordinates: CLLocationCoordinate2D(latitude: 51.500358645026026, longitude:  -2.547937697763003)),
       
        AllCater(imageName: "Subway 2",
                 name: "Subway",
                 description: "Subway serves subs, salads and snacks. Located in Q block.",
                 url:  "https://www.uwe.ac.uk/life/campus-and-facilities/frenchay-campus/bars-cafes-and-shops#a9ad59644-320c-4470-a5e3-a1467ce82ad1", coordinates: CLLocationCoordinate2D(latitude: 51.501530, longitude: -2.548678)),
       
        AllCater(imageName: "Student union shop",
                 name: "SU shop",
                 description: "Convenience store stocking student essentials including groceries, health and beauty products, stationery and cards and stamps. This is located in the F block and next to SU building.",
                 url:  "https://www.uwe.ac.uk/life/campus-and-facilities/frenchay-campus/bars-cafes-and-shops#a9ad59644-320c-4470-a5e3-a1467ce82ad1", coordinates: CLLocationCoordinate2D(latitude: 51.50032256782138, longitude: -2.5472879986229615)),
  
    ]
}

