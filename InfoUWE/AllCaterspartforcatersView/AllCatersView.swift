//
//  AllCatersView.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 05/02/2022.
//

import SwiftUI


// As mentioned on the building not sure where the bug is coming from to view the preview properly - but works fine in simulator. 

struct AllCatersView: View {
    
    var UWEcaters: [AllCater] = AllCaterList.nameofcaters
    
    @State private var searchText = ""
    
    var body: some View {
        // list of the caters and when tapped, it will navigate to the detail view of that section.
        List(UWEcaters.filter({
            searchText.isEmpty ? true: $0.name.localizedStandardContains(searchText)
        }),id: \.id) { cater in
            NavigationLink(destination: AllCatersDetailView(UWECater: cater), label: {
                AllCaterCell(allCater: cater)
            })
            
        }
        // this basically used for the search part and when the user starts typing it will give suggestions on the caters.
        .searchable(text: $searchText, prompt: "Search for caters", suggestions: {
            if !searchText.isEmpty{
                ForEach(UWEcaters.filter({
                    searchText.isEmpty ? true : $0.name.localizedStandardContains(searchText)
                })) {
                    suggestion in Text(suggestion.name)
                        .searchCompletion(suggestion.name)
                    
                }
            }
        })
        .navigationTitle("All Caters")
        
    }
    
}

// this is made for when the user views the screen and see the names of the building and what the cater looks like.
struct AllCaterCell: View {
    var allCater: AllCater
    var body: some View {
        HStack {
            Image(allCater.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 75, height:75)
                .cornerRadius(10)
                .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 5){
                Text(allCater.name)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
            }
        }
    }
}

struct AllCatersView_Previews: PreviewProvider {
    static var previews: some View {
        AllCatersView()
    }
}
