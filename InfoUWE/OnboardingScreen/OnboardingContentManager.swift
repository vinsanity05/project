//
//  OnboardingContentManager.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 31/01/2022.
//

import Foundation

protocol OnboardingContentManager {
    // don't want to allow someone to change this value from outside of its scope and just allows  to get the value
    var restrict: Int { get }
    var numberOfScreens: [OnboardingItem] { get }
}

// no other class can subclass this class
final class OCMImplementation: OnboardingContentManager {
    
    //get the number of items in the array and it subtracts it by one
    var restrict: Int {
        numberOfScreens.count - 1
    }
    // hold our items
    let numberOfScreens: [OnboardingItem] = [
        OnboardingItem(header: "Welcome To InfoUWE!", smalltext: "Here you can find information about UWE buildings!",  asset: Asset(assetName: "building.columns.fill", astType: .sfSymbol)),
        OnboardingItem(header: "Find your way!", smalltext: "You can also be navigated to the selected building!",  asset: Asset(assetName: "map.circle.fill", astType: .sfSymbol)),
        OnboardingItem(header: "Explore!", smalltext: "And view other information such as Restaurants & Cafes!",  asset: Asset(assetName: "binoculars.fill", astType: .sfSymbol)),
        //For the code below - this can be scalable if we will use any assets image for the onboarding screen
        //        OnboardingItem(header: "Emergencies", smalltext: "Can View any content such as Emergencies",  asset: Asset(assetName: "emergency", astType: .xcasset))
    ]
    
}
