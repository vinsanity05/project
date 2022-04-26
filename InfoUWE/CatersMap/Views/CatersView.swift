//
//  CatersView.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 03/02/2022.
//

import SwiftUI
import MapKit


struct CatersView: View {
    
    // Accessing view model for the view.
    @EnvironmentObject private var vm_two: CatersViewModel
    
    var body: some View {
        ZStack {
            // This essentially fills out the whole screen of the Apple Maps.
            mapLayer
                .ignoresSafeArea()
            // This will show most of the caters when the user taps this search bar.
            VStack(spacing: 0) {
                searchbar
                    .padding()
                Spacer()
                catersPreviewStack
            }
        }
        // This will produce a sheet of the caters.
        .sheet(item: $vm_two.sheetCater, onDismiss: nil) { cater in
            CaterDetailView(cater: cater)
        }
    }
}

struct CatersView_Previews: PreviewProvider {
    static var previews: some View {
        CatersView()
            .environmentObject(CatersViewModel())
    }
}

// Extension for the catersview.
extension CatersView {
    
    // Modifiers for the search bar.
    private var searchbar: some View {
        VStack {
            // Button for the user and shows the list of caters.
            Button(action: vm_two.toggleCatersList) {
                Text(vm_two.mapCater.name)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                // There will be no animation of name of the caters since it will disrupt how the UI would look.
                    .animation(.none, value: vm_two.mapCater)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                        // Make the arrow flip when tapped.
                            .rotationEffect(Angle(degrees: vm_two.showCatersList ? 180 : 0))
                    }
            }
            // This will present the list if tapped.
            if vm_two.showCatersList {
                CatersListView()
            }
            
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    // Map of the caters
    private var mapLayer: some View {
        // This is basically getting the coordinates from the model and adding the annotation from the annotation view.
        // The ‘$’ basically is used so that SwiftUI will write the value using the property wrapper, which will in turn stash it away and cause the UI to refresh automatically.
        Map(coordinateRegion: $vm_two.mapRegion, annotationItems: vm_two.caters, annotationContent: { cater in
            MapAnnotation(coordinate: cater.coordinates) {
                CaterMapAnnotationView()
                    .scaleEffect(vm_two.mapCater == cater ? 1 : 0.7)
                    .shadow(radius: 10)
                // When the user taps the next button it will go to the next cater from the model.
                    .onTapGesture {
                        vm_two.showNextCater(cater: cater)
                    }
            }
        })
    }
    
    // List of the caters when the user taps the search bar.
    private var catersPreviewStack: some View {
        ZStack {
            
            ForEach(vm_two.caters) { cater in
                // These are stacked between each other but because of the if statement it's saying only add this preview view if the current cater location is this cater - that's why we only get one preview view inside the ZStack and its not piled on.
                if vm_two.mapCater == cater {
                    CaterPreviewView(cater: cater)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .frame(maxWidth: .infinity)
                    // Animation for the preview.
                        .transition(.asymmetric(insertion: .move(edge:.trailing), removal: .move(edge: .leading)))
                }
            }
        }
    }
    
}


