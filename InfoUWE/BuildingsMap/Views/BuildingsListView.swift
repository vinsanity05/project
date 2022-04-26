//
//  BuildingsListView.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 03/02/2022.
//

import SwiftUI


// This is presenting a list of all the buildings from the view model and essentially will have a button when the user taps one of the buildings out of from the list and it will present the building.

struct BuildingsListView: View {
    
    @EnvironmentObject private var vm: BuildingsViewModel
    
    var body: some View {
        // List of buildings and show the next following building.
        List {
            ForEach(vm.buildings) { building in
                Button {
                    vm.showNextBuilding(building: building)
                } label: {
                    listRowView(building: building)
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct BuildingsListView_Previews: PreviewProvider {
    static var previews: some View {
        BuildingsListView()
            .environmentObject(BuildingsViewModel())
    }
}

extension BuildingsListView {
    
    // Basically making sure that the building is unique and it will present the image and name of the building when the user taps one of the buildings list.
    private func listRowView(building: Building) -> some View {
        HStack{
            if let imageName = building.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            // Aligning it to the left and present the name of the building.
            VStack(alignment: .leading) {
                Text(building.name)
                    .font(.headline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
}
