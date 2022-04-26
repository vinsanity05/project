//
//  OnboardingView.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 31/01/2022.
//

import SwiftUI

// So this is going to return nothing to avoid closure.
typealias OnBoardGSAction = () -> Void

struct OnboardingView: View {
    
    // Localizing the button and naming it.
    @State private var buttonTitle = LocalizedStringKey("Get Started")
    
    // This will dismiss the view.
    @Environment(\.presentationMode) private var presentationMode
    
    // Inject our model into the view.
    let item: OnboardingItem
    
    // This is restricting the page.
    let max: Int
    // This handles the action when the user taps it.
    let handleButton: OnBoardGSAction
    
    // Setting our binding to an int. So it will connect a property to a source of truth stored elsewhere, instead of storing data directly.
    @Binding var guideInd: Int
    
    // Set our binding varaible
    init(item: OnboardingItem,
         restrictPage: Int,
         guideInd: Binding<Int>,
         // Basically leaves the scope that it's passed it to.
         handleB: @escaping OnBoardGSAction) {
        self.item = item
        self.max = restrictPage
        // Getting the value and set the index.
        self._guideInd = guideInd
        self.handleButton = handleB
    }
    
    var body: some View {
        // Vertically hold our items.
        VStack {
            
            // Push from the top and start from the bottom.
            Spacer()
            
            // Return the content for the asset.
            item.asset_files?.creatingAsset
            
            // This basically means that if the title is 'nil' then it should be used as an empty string.
            Text(item.header ?? "", comment: "big title of the text")
                .font(.system(size: 32, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.bottom,2)
                .foregroundColor(.primary)
            
            // This is the little text under the big title with the modifiers.
            Text(item.description ?? "", comment: "little text under the big title")
                .font(.system(size: 12, weight: .semibold))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 50)
                .foregroundColor(.secondary)
            
            // Basically this button will either show or hide it if reaches the limit.
            Button(action: {
                // This wrapped value will actually dismiss the view that's currently on screen.
                presentationMode.wrappedValue.dismiss()
                handleButton()
            }, label: {
                Text(buttonTitle, comment: "button for onboarding")
            })
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(.white)
            .padding(.horizontal,25)
            .padding(.vertical,10)
            .background(Color.red)
            .clipShape(Capsule())
            .padding(.top, 50)
            // Setting the opacity to either one or zero depending on if you've reached the limit. So if they reached the end, then it will show the button. If not then it won't appear.
            .opacity(guideInd == max ? 1 : 0)
            .allowsHitTesting(guideInd == max)
            // Trying out to see if any animations can work for the button.
            //          .transition(AnyTransition.opacity.animation(.easeInOut))
        }
        .padding(.bottom, 150)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        // Dummy data just to see if this works.
        OnboardingView(item: OnboardingItem( header: "Welcome To InfoUWE!", smalltext:  "Here you can find information about UWE buildings!"),
                       restrictPage: 0, guideInd: .constant(0)) { }
    }
}
