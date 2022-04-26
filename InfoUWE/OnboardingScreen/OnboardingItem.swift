//
//  OnboardingItem.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 31/01/2022.
//

import Foundation
import SwiftUI

struct OnboardingItem: Identifiable {
    let id = UUID() // Uniquely identfiy each onboarding item.
    let header: LocalizedStringKey? // Header for the screen.
    let description: LocalizedStringKey? //Text below the screen.
    let asset_files: Asset? //Defines an asset type whenever we build an onboarding item.
    
    // Have to create an intialiser here so it can basically intialise this with (dummy content) for our previews.
    init(header: LocalizedStringKey? = nil,
         smalltext: LocalizedStringKey? = nil,
         asset: Asset? = nil) {
        self.header = header // Property of an instance that holds the instance itself.
        self.description = smalltext // Property of an instance that holds the instance itself.
        self.asset_files = asset //Property of an instance that holds the instance itself.
    }
    
}
