//
//  InfoUWEApp.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 30/01/2022.
//

import SwiftUI

@main
struct InfoUWEApp: App {
    
    //view models
    @StateObject private var vm = BuildingsViewModel()
    @StateObject private var vm_two = CatersViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            //basically all of this will be shared and accessed from every view from the view models of the building and caters
                .environmentObject(vm)
                .environmentObject(vm_two)
        }
    }
}
