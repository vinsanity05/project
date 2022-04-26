//
//  OnboardingView.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 31/01/2022.
//

import SwiftUI

// so this basically just for our closure, so this is going to return nothing to avoid closure.
typealias OnBoardGSAction = () -> Void

struct OnboardingView: View {
    
    // localizing the button and naming it.
    @State private var buttonTitle = LocalizedStringKey("Get Started")
    
    //dismiss a view manually
    @Environment(\.presentationMode) private var presentationMode
    
    //inject our model into the view
    let item: OnboardingItem
    
    // this is restricting the page
    let max: Int
    // this handles the action when the user taps it
    let handleButton: OnBoardGSAction
    
    @Binding var guideInd: Int
    
    //set our binding varaible
    init(item: OnboardingItem,
         restrictPage: Int,
         guideInd: Binding<Int>,
         // basically leaves the scope that it's passed it to.
         handleB: @escaping OnBoardGSAction) {
        self.item = item
        self.max = restrictPage
        //getting the value and set the index
        self._guideInd = guideInd
        self.handleButton = handleB
    }
    
    var body: some View {
        //vertically hold our items
        VStack {

            //push from the top and start from the bottom
            Spacer()
            
            //return the content for the asset
            item.asset_files?.creatingAsset
            
            // this basically means that if the title is 'nil' then it should be used as an empty string
            Text(item.header ?? "", comment: "big title of the text")
                .font(.system(size: 32, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.bottom,2)
                .foregroundColor(.primary)
            
            Text(item.description ?? "", comment: "little text under the big title")
                .font(.system(size: 12, weight: .semibold))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 50)
                .foregroundColor(.secondary)
            
            //basically this button will either show or hide it if reaches the limit
            Button(action: {
                // this wrapped value will actually dismiss any view that's currently on screen
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
            //setting the opacity to either onee or zero depending on if you've reached the limit. So if you reached the end, then it will show the button. If not then it won't appear
            .opacity(guideInd == max ? 1 : 0)
            .allowsHitTesting(guideInd == max)
            //          .transition(AnyTransition.opacity.animation(.easeInOut))
        }
        .padding(.bottom, 150)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        //dummy data just to see if this works
        OnboardingView(item: OnboardingItem( header: "Welcome To InfoUWE!", smalltext:  "Here you can find information about UWE buildings!"),
                       restrictPage: 0, guideInd: .constant(0)) { }
    }
}
