//
//  OnboardingItem.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 31/01/2022.
//

import Foundation
import SwiftUI

struct OnboardingItem: Identifiable {
    let id = UUID() //uniquely identfiy each onboarding item
    let header: LocalizedStringKey? // header for the screen
    let description: LocalizedStringKey? //text below the screen
    let asset_files: Asset? //defines an asset type whenever we build an onboarding item
    
    // Have to create an intialiser here so that it can basically intialise this with (dummy conent) for our previews
    init(header: LocalizedStringKey? = nil,
         smalltext: LocalizedStringKey? = nil,
         asset: Asset? = nil) {
        self.header = header // property of an instance that holds the instance itself
        self.description = smalltext // property of an instance that holds the instance itself
        self.asset_files = asset //property of an instance that holds the instance itself
    }
    
}
