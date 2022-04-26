//
//  AllBuildingsView.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 05/02/2022.
//

import SwiftUI

// not sure where the bug is coming from to view the preview properly - but works fine in simulator. This view is mainly for the user to be navigated to the detailed view and for the user to search and give suggestions.

struct AllBuildingsView: View {
    
    // getting all the buildings in the allbuildings model
    var UWEbuildings: [AllBuilding] = AllBuildingList.nameofbuildings
    
    //search text of the building
    @State private var searchText = ""
    
    var body: some View {
        // list of the buildings and will be navigated to building itself.
        // this is essentially filtering when the user wants to look for a specific building instead of scrolling down.
        List(UWEbuildings.filter({
            searchText.isEmpty ? true: $0.name.localizedStandardContains(searchText)
        }),id: \.id) { building in
            NavigationLink(destination: AllBuildingsDetailView(UWEBuilding: building), label: {
                AllBuildingCell(allBuilding: building)
            })
            
        }
        // this basically used for the search part and when the user starts typing it will give suggestions on the building.
        .searchable(text: $searchText, prompt: "Search for buildings", suggestions: {
            if !searchText.isEmpty{
                ForEach(UWEbuildings.filter({
                    searchText.isEmpty ? true : $0.name.localizedStandardContains(searchText)
                })) {
                    suggestion in Text(suggestion.name)
                        .searchCompletion(suggestion.name)
                }
            }
        })
        //title of the building
        .navigationTitle("All Buildings")
        
    }
    
}

// this is made for when the user views the screen and see the names of the building and what the building looks like.
struct AllBuildingCell: View {
    var allBuilding: AllBuilding
    var body: some View {
        //image of the building
        HStack {
            Image(allBuilding.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 75, height:75)
                .cornerRadius(10)
                .padding(.vertical)
            // name of the building
            VStack(alignment: .leading, spacing: 5){
                Text(allBuilding.name)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
            }
        }
    }
}

struct AllBuildingsView_Previews: PreviewProvider {
    static var previews: some View {
        AllBuildingsView()
        
    }
}
