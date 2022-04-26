//
//  ScrollBuildingImageView.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 26/02/2022.
//

import SwiftUI

struct ScrollBuildingImageView: View {
    
    // getting all the buildings in the allbuildings model
    var UWEbuildings: [AllBuilding] = AllBuildingList.nameofbuildings
    
    
    var body: some View {
        // list of the buildings and will be navigated to building itself.
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                // this will limit how many buildings when presenting on the scrollview from the array. So only 3 buildings will be shown so it won't let the user keep scrolling.
                ForEach(UWEbuildings.prefix(3),id: \.id) { building in
                    NavigationLink(destination: AllBuildingsDetailView(UWEBuilding: building), label: {
                        ScrollImageBuildingCell(allBuilding: building)
                    })
                    
                }
            }
        }
        
    }
    
}

// getting the name of the building and the image name 
struct ScrollImageBuildingCell: View {
    var allBuilding: AllBuilding
    var body: some View {
        //image of the building
        VStack {
            Image(allBuilding.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 155, height:155)
                .cornerRadius(10)
                .padding(.vertical)
                .padding(.horizontal)
            Text(allBuilding.name)
                .foregroundColor(.secondary)
                .font(.system(size:18, weight: .semibold, design:.rounded))
        }
    }
}


struct ScrollBuildingImageView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollBuildingImageView()
        
    }
}
