//
//  OnboardingScreenView.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 31/01/2022.
//

import SwiftUI

struct OnboardingScreenView: View {
    
    // Inject our manager into this view, so our onboarding content manager and get started action.
    let OCM: OnboardingContentManager
    let getStartH: OnBoardGSAction
    
    // Track what screen you have selected (current view the users on).
    @State private var trackScreenPicked = 0
    
    // Initialising
    internal init(OCManager: OnboardingContentManager, hand: @escaping OnBoardGSAction) {
        self.OCM = OCManager
        self.getStartH = hand
    }
    
    var body: some View {
        TabView(selection: $trackScreenPicked) {
            // Uniquely loop in our array of onboarding items because they are identifiable - so going to get the items array and restrict how much there is.
            ForEach(OCM.numberOfScreens.indices, id:\.self) {
                index in OnboardingView(item: OCM.numberOfScreens[index],
                                        restrictPage: OCM.restrict,
                                        guideInd: $trackScreenPicked,
                                        handleB: getStartH)
            }
        }
        // Uses the backgroundimage from the assets folder to display the background.
        .background(Image("backgroundimage")
            .ignoresSafeArea())
        .tabViewStyle(PageTabViewStyle())
        // This basically checks which page the user is on.
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct OnboardingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreenView(OCManager: OCMImplementation()) {}
    }
}
