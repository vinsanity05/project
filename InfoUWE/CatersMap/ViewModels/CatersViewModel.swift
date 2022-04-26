//
//  CatersViewModel.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 03/02/2022.
//

import Foundation
import MapKit
import SwiftUI

//this is basically all of the data behind the scenes for our app so we have this view model so all of the data for this screen and all of the other screens is deriving from our view model

class CatersViewModel: ObservableObject {
    
    // All loaded caters
    @Published var caters:  [Cater]
    
    // Current location on map
    @Published var mapCater: Cater {
        didSet {
            updateMapRegion(cater: mapCater)
        }
    }
    
    //Current Region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    //Show list of Caters
    @Published var showCatersList: Bool = false
    
    //Show location detial via sheet
    @Published var sheetCater: Cater? = nil
    
    init() {
        // To make it scalable for instance, so if this app was an actual app going to be put in the app store. so instead of loading these caters from a file in our code "caters", we would set the caters array equal to a blank array to start with so like:
        //self.caters = []
        // so then we call the this from our init, so we would say:
        // self.uploadCaters()
        let caters = CatersDataService.caters
        self.caters = caters
        self.mapCater = caters.first!
        self.updateMapRegion(cater: caters.first!)
    }
    // so to add on if we wanted to make it scalable for app store then we have some function here for e.g.
    //    func uploadCaters() {
    //     then inside this function. This part will have a function where it will append to the all loaded caters array part - so potentially this can be downloaded from a server and then we can download the caters from there however ther is no API right now to do so.
    //    }
    
    // this will basically update the coordinates on the coordinates specified.
    private func updateMapRegion(cater: Cater) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: cater.coordinates,
                span: mapSpan)
        }
    }
    
    // this is essentially make the list open and close with the animation.
    func toggleCatersList() {
        withAnimation(.easeInOut) {
            showCatersList.toggle()
        }
    }
    
    // show the next cater with animation.
    func showNextCater(cater: Cater) {
        withAnimation(.easeInOut) {
            mapCater = cater
            showCatersList = false
        }
    }
    
    // this is the functions for the user when it is tapped.
    func NextButtonPressed() {
        
        //Get the current index - so the current cater
        guard let currentIndex = caters.firstIndex(where: {$0 == mapCater}) else {
            print("Could not find current Index in caters array! Should never happen.")
            return
        }
        
        //check if the next Index is valid
        let nextIndex = currentIndex + 1
        guard caters.indices.contains(nextIndex) else {
            // next item is NOT valid
            //restart from 0 - restart again and begin with the first cater from the array
            guard let firstCater = caters.first else {
                return
            }
            showNextCater(cater: firstCater)
            return
        }
        
        // Next index IS valid
        let nextCater = caters[nextIndex]
        showNextCater(cater: nextCater)
        
    }
    
}
