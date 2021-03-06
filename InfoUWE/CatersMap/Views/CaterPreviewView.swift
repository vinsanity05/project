//
//  CaterPreviewView.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 03/02/2022.
//

import SwiftUI

struct CaterPreviewView: View {
    
    // Access the caters view model.
    @EnvironmentObject private var vm_two: CatersViewModel
    
    // Cater of the view model.
    let cater: Cater
    
    var body: some View {
        // This is basically used to put together in HStack (horizontal) and VStack (vertical) and spacing around each other so it will look clear.
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

struct CaterPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            // Using the first cater.
            CaterPreviewView(cater: CatersDataService.caters.first!)
                .padding()
        }
        .environmentObject(CatersViewModel())
    }
}

extension CaterPreviewView {
    
    // Image of the cater and modifiers.
    private var imageSection: some View {
        ZStack {
            // Getting the first image of the first caters in the array.
            if let imageName = cater.imageNames.first {
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
    // Name of the cater and modifiers.
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(cater.name)
                .font(.title2)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    // Learn button for the user to learn more about the cater.
    private var learnMoreButton: some View {
        Button {
            vm_two.sheetCater = cater
        } label: {
            Text("Learn more", comment: "Learn more button")
                .font(.system(size:16, weight: .bold, design:.rounded))
                .frame(width: 125, height: 45)
        }
        .buttonStyle(.borderedProminent)
    }
    // Next button for the user to tap the next cater.
    private var NextButton: some View {
        Button {
            vm_two.NextButtonPressed()
        } label: {
            Text("Next", comment: "Next button")
                .font(.system(size:16, weight: .bold, design:.rounded))
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.bordered)
    }
}

