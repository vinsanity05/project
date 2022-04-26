//
//  BuildingPreviewView.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 03/02/2022.
//

import SwiftUI

struct BuildingPreviewView: View {
    
    // Accessing the view model.
    @EnvironmentObject private var vm: BuildingsViewModel
    
    // Building of the view model.
    let building: Building
    
    var body: some View {
        // This is basically used to put together in HStack (horizontal) and VStack (vertical) and spacing around each other so it won't look clustered.
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            VStack(spacing: 8) {
                learnMoreButton
                NextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y:52)
        )
        .cornerRadius(10)
    }
}

struct BuildingPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                // This is just a preview of what the preview section will look like. So basically this green background won't be added and uses the first building from the array.
                Color.green.ignoresSafeArea()
                BuildingPreviewView(building: BuildingsDataService.buildings.first!)
                    .padding()
            }
            .environmentObject(BuildingsViewModel())
            // French language preview of the building - if the language is changed from the settings or the user's iPhone is set to french.
            ZStack {
                Color.green.ignoresSafeArea()
                BuildingPreviewView(building: BuildingsDataService.buildings.first!)
                    .padding()
            }
            .environmentObject(BuildingsViewModel())
            // French language.
            .environment(\.locale, .init(identifier: "fr"))
        }
    }
}

extension BuildingPreviewView {
    
    // Modifiers for the image section.
    private var imageSection: some View {
        ZStack {
            // Getting the first image of the array in the buildings.
            if let imageName = building.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    // The name of the building and modifiers.
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(building.name)
                .font(.title2)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // The learn button and modifiers.
    private var learnMoreButton: some View {
        Button {
            vm.sheetBuilding = building
        } label: {
            Text("Learn more", comment: "Learn more button")
                .font(.system(size:16, weight: .bold, design:.rounded))
                .frame(width: 125, height: 45)
        }
        .buttonStyle(.borderedProminent)
    }
    // The next button and modfiers.
    private var NextButton: some View {
        Button {
            vm.NextButtonPressed()
        } label: {
            Text("Next", comment: "Next button")
                .font(.system(size:16, weight: .bold, design:.rounded))
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.bordered)
    }
}
