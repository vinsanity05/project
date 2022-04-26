//
//  BuildingsViewModel.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 02/02/2022.
//

import Foundation
import MapKit
import SwiftUI

// This is basically all of the data behind the scenes for our app so we have this view model so all of the data for this screen and all of the other screens is deriving from our view model.

class BuildingsViewModel: ObservableObject {
    
    // All loaded buildings.
    @Published var buildings:  [Building]
    
    // Current location on map.
    @Published var mapBuilding: Building {
        didSet {
            updateMapRegion(building: mapBuilding)
        }
    }
    
    // Current Region on map.
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // Show list of Buildings.
    @Published var showBuildingsList: Bool = false
    
    // Show building detail via sheet.
    @Published var sheetBuilding: Building? = nil
    
    init() {
        // To make it scalable for instance, so if this app was going to be a published app to be put in the app store. So instead of loading these buildings from a file in our code "buildings", we would set the building array equal to a blank array to start with so like:
        //self.buildings = []
        // So then we call the this from our init, so we would say:
        // self.uploadBuildings()
        let buildings = BuildingsDataService.buildings
        self.buildings = buildings
        self.mapBuilding = buildings.first!
        self.updateMapRegion(building: buildings.first!)
    }
    
    // So to add on if we wanted to make it scalable for app store then we have some function here for e.g.
    //    func uploadBuildings() {
    // Then inside here in this func (function). This part will have a function where it will append to the all loaded buildings array part - so potentially this can be downloaded from a server and then we can download the buildings from there however there is no API right now to do so.
    //    }
    
    // Update map region.
    private func updateMapRegion(building: Building) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: building.coordinates,
                span: mapSpan)
        }
    }
    
    // This will toggle whether the user taps the search bar and the building list will show or not.
    func toggleBuildingsList() {
        withAnimation(.easeInOut) {
            showBuildingsList.toggle()
        }
    }
    
    // Show next building.
    func showNextBuilding(building: Building) {
        withAnimation(.easeInOut) {
            mapBuilding = building
            showBuildingsList = false
        }
    }
    
    // Next button tapped.
    func NextButtonPressed() {
        // Get the current index - so the current building.
        guard let currentIndex = buildings.firstIndex(where: {$0 == mapBuilding}) else {
            print("Could not find current Index in buildings array! Should never happen.")
            return
        }
        
        // Check if the next Index is valid.
        let nextIndex = currentIndex + 1
        guard buildings.indices.contains(nextIndex) else {
            // Next item is NOT valid.
            // Restart from 0 - because of first array/ first building.
            guard let firstBuilding = buildings.first else {
                return
            }
            showNextBuilding(building: firstBuilding)
            return
        }
        
        // Next index IS valid.
        let nextBuilding = buildings[nextIndex]
        showNextBuilding(building: nextBuilding)
        
    }
    
}
