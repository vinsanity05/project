//
//  ContentView.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 30/01/2022.
//

import SwiftUI

// This is basically the main view and puts everything together.

struct ContentView: View {
    
    // This essentially validates the current view whenever the observable object changes.
    @EnvironmentObject private var vm: BuildingsViewModel
    @EnvironmentObject private var vm_two: CatersViewModel
    
    // This will show that when a user opens the first time - so this is just going to manage whether the app should show it or hide it.
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    
    var body: some View {
        // Tabs for the user to navigate each view.
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home", comment: "home tab") }
            ExploreView()
                .tabItem {
                    Image(systemName: "safari.fill")
                    Text("Explore", comment: "explore tab") }
            BuildingsView()
            // Added offset here because without it, the ignoresafearea will be filled in the tabs when the user navigates to this page making an unpleasant UI.
                .offset(y:-6)
                .tabItem{
                    Image(systemName: "building.columns.fill")
                    Text("Map of Buildings", comment: "Map of building tab") }
            CatersView()
            // Added offset here because without it, the ignoresafearea will be filled in the tabs when the user navigates to this page unpleasant UI.
                .offset(y:-6)
                .tabItem{
                    Image(systemName: "fork.knife.circle")
                    Text("Map of Caters", comment: "map of cater tab") }
            SettingsView()
                .tabItem{
                    Image(systemName: "gearshape.fill")
                    Text("Settings", comment: "settings tab") }
        }
        
        // Covers the entire screen and show if it's the users first time.
        .fullScreenCover(isPresented: .constant(!hasSeenOnboarding), content: {
            let onboardingContentManager = OCMImplementation()
            OnboardingScreenView(OCManager: onboardingContentManager) {
                // This will show that the user has seen the onboarding screen when tapping the app and if they open it again it will disappear since they have seen the onboarding screen.
                hasSeenOnboarding = true
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(BuildingsViewModel())
            .environmentObject(CatersViewModel())
        // Change to "en" to "fr" for french language.
            .environment(\.locale, .init(identifier: "en"))
    }
}
