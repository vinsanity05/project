//
//  BuildingsView.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 02/02/2022.
//

import SwiftUI
import MapKit


struct BuildingsView: View {
    
    //accessing the view building model for the view.
    @EnvironmentObject private var vm: BuildingsViewModel
    
    var body: some View {
        ZStack {
            // this essentially fills out the whole screen of the Apple map
            mapLayer
                .ignoresSafeArea()
            // this will show most of the buildings when the user taps this search bar
            VStack(spacing: 0) {
                searchbar
                    .padding()
                Spacer()
                buildingsPreviewStack
            }
        }
        // this will produce a sheet of the building and will get the detail of the building.
        .sheet(item: $vm.sheetBuilding, onDismiss: nil) { building in
            BuildingDetailView(building: building)
        }
    }
}

struct BuildingsView_Previews: PreviewProvider {
    static var previews: some View {
        BuildingsView()
            .environmentObject(BuildingsViewModel())
    }
}

// extension for the buildingsview
extension BuildingsView {
    
    // this is mostly the modifiers of the search bar
    private var searchbar: some View {
        VStack {
            //button for the user and shows the list of buildings
            Button(action: vm.toggleBuildingsList) {
                Text(vm.mapBuilding.name)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                // there will be no animation of name of the building
                    .animation(.none, value: vm.mapBuilding)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                        // make the arrow flip when tapped.
                            .rotationEffect(Angle(degrees: vm.showBuildingsList ? 180 : 0))
                    }
            }
            
            if vm.showBuildingsList {
                BuildingsListView()
            }
            
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    private var mapLayer: some View {
        // this is basically getting the coordinates from the model and adding the annotation from the annotation view
        //The ‘$’ basically is used so that SwiftUI will write the value using the property wrapper, which will in turn stash it away and cause the UI to refresh automatically.
        Map(coordinateRegion: $vm.mapRegion, annotationItems: vm.buildings, annotationContent: { building in
            MapAnnotation(coordinate: building.coordinates) {
                BuildingMapAnnotationView()
                    .scaleEffect(vm.mapBuilding == building ? 1 : 0.7)
                    .shadow(radius: 10)
                // when the user taps the next button it will go to the next building from the model
                    .onTapGesture {
                        vm.showNextBuilding(building: building)
                    }
            }
        })
    }
    
    // modifiers for the buildings of the search bar
    private var buildingsPreviewStack: some View {
        ZStack {
            //showing each building
            ForEach(vm.buildings) { building in
                //these are stacked between each other but because of the if statement it's saying only add this preview view if the current building location is this building - that's why we only get one preview view inside the z stack
                if vm.mapBuilding == building {
                    BuildingPreviewView(building: building)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .frame(maxWidth: .infinity)
                    //animation for the preview
                        .transition(.asymmetric(insertion: .move(edge:.trailing), removal: .move(edge: .leading)))
                    // trying animation here to see what it is like .transition(AnyTransition.opacity.animation(.easeInOut))
                    
                }
            }
        }
    }
}
