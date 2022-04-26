//
//  CatersDataService.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 02/02/2022.
//

import Foundation
import MapKit

class CatersDataService {
    
    //info from the resturant and cafe UWE website
    static let caters: [Cater] = [
        
        Cater(name: "Street cafe", description: "Tasty, quick and exciting street food such as a grab and go service of sandwiches, freshly made baguettes, snacks, pastries, cakes, and hot and cold drinks. Located in S block.", imageNames: ["The street 2"], coordinates: CLLocationCoordinate2D(latitude: 51.49830975056084, longitude: -2.5486254036172107), link: "https://www.uwe.ac.uk/life/campus-and-facilities/frenchay-campus/bars-cafes-and-shops#a9ad59644-320c-4470-a5e3-a1467ce82ad1"),
        Cater(name: "The Grill", description: "The enthusiasts of piri piri sauce, serving meals bursting with flavour. Located in B block.", imageNames: ["The grill"], coordinates: CLLocationCoordinate2D(latitude: 51.49923736738787, longitude: -2.548136283499418), link: "https://www.uwe.ac.uk/life/campus-and-facilities/frenchay-campus/bars-cafes-and-shops#a9ad59644-320c-4470-a5e3-a1467ce82ad1"),
        Cater(name: "Starbucks", description: "Our drinks range includes a wide range of premium coffees including whole bean and ground coffee, hot chocolate and a range of teas available. Our food range covers breakfast sandwiches/rolls and filled croissants as well as cakes, cookies and pastries to suit everyone’s tastes. Located in E block next to Onezone and library.", imageNames: ["starbucks"], coordinates: CLLocationCoordinate2D(latitude: 51.500335, longitude: -2.548002), link: "https://www.uwe.ac.uk/life/campus-and-facilities/frenchay-campus/bars-cafes-and-shops#a9ad59644-320c-4470-a5e3-a1467ce82ad1"),
        Cater(name: "Wafflemeister", description: "It’s always brunch-time somewhere in the world and there’s no better place to indulge than at Wafflemeister. Located between blocks E/F/N block.", imageNames: ["Wafflemeister"], coordinates: CLLocationCoordinate2D(latitude: 51.500839, longitude: -2.547401), link: "https://www.uwe.ac.uk/life/campus-and-facilities/frenchay-campus/bars-cafes-and-shops#a9ad59644-320c-4470-a5e3-a1467ce82ad1"),
        Cater(name: "The Atrium Café", description: "A café with outside seating serving locally sourced food and drink through a full hot a la carte menu, fresh sandwiches, snacks and speciality hot and cold drinks. Located in Bristol Business School Building.", imageNames: ["The altrium"], coordinates: CLLocationCoordinate2D(latitude: 51.500969, longitude: -2.549901), link: "https://www.uwe.ac.uk/life/campus-and-facilities/frenchay-campus/bars-cafes-and-shops#a9ad59644-320c-4470-a5e3-a1467ce82ad1"),
        Cater(name: "The Student Union bar", description: "The coffee shop on the upper floor serves Starbucks coffee and fresh sandwiches and panini and the bar serves a wide range of food throughout the day. Located in U block, next to SU building.", imageNames: ["The student union bar"], coordinates: CLLocationCoordinate2D(latitude: 51.500475, longitude: -2.551564), link: "https://www.uwe.ac.uk/life/campus-and-facilities/frenchay-campus/bars-cafes-and-shops#a9ad59644-320c-4470-a5e3-a1467ce82ad1"),
        Cater(name: "Costa coffee", description: "Whether you want to wake yourself up with one of our short drinks or relax over a tall drink we’ve got a coffee to suit you. A café with outside seating serving a wide selection of sandwiches and snacks to enjoy on the go. Located in R block.", imageNames: ["costa coffee"], coordinates: CLLocationCoordinate2D(latitude: 51.502549, longitude: -2.548453), link: "https://www.uwe.ac.uk/life/campus-and-facilities/frenchay-campus/bars-cafes-and-shops#a9ad59644-320c-4470-a5e3-a1467ce82ad1"),
        Cater(name: "Onezone", description: "Serving global cuisine and traditional flavours at unbeatable prices. Located in E block next to the Starbucks and library.", imageNames: ["Onezone 2"], coordinates: CLLocationCoordinate2D(latitude: 51.500358645026026, longitude:  -2.547937697763003), link: "https://www.uwe.ac.uk/life/campus-and-facilities/frenchay-campus/bars-cafes-and-shops#a9ad59644-320c-4470-a5e3-a1467ce82ad1"),
        Cater(name: "Subway", description: "Subway serves subs, salads and snacks. Located in Q block.", imageNames: ["Subway 2", "Subway 3"], coordinates: CLLocationCoordinate2D(latitude: 51.501530, longitude: -2.548678), link: "https://www.uwe.ac.uk/life/campus-and-facilities/frenchay-campus/bars-cafes-and-shops#a9ad59644-320c-4470-a5e3-a1467ce82ad1"),
        Cater(name: "SU Shop", description: "Convenience store stocking student essentials including groceries, health and beauty products, stationery and cards and stamps. This is located in the F block and next to SU building.", imageNames: ["Student union shop"], coordinates: CLLocationCoordinate2D(latitude: 51.50032256782138, longitude: -2.5472879986229615), link: "https://www.thestudentsunion.co.uk/commercial-services/shopping/shops/")
        
    ]
}
