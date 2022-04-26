//
//  ScrollCaterImageView.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 26/02/2022.
//

import SwiftUI

struct ScrollCaterImageView: View {
    
    // getting all the caters in the allcater model
    var UWEcaters: [AllCater] = AllCaterList.nameofcaters
    
    
    var body: some View {
        // list of the buildings and will be navigated to building itself.
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                // this will limit how many buildings when presenting on the scrollview from the array. So only 3 caters will be shown so it won't let the user keep scrolling.
                ForEach(UWEcaters.prefix(3),id: \.id) { cater in
                    NavigationLink(destination: AllCatersDetailView(UWECater: cater), label: {
                        ScrollImageCaterCell(allCater: cater)
                    })
                    
                }
            }
        }
        
    }
    
}

// getting the name of the caters and the image name
struct ScrollImageCaterCell: View {
    var allCater: AllCater
    var body: some View {
        //image of the cater
        VStack {
            Image(allCater.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 155, height:155)
                .cornerRadius(10)
                .padding(.vertical)
                .padding(.horizontal)
            //name of the cater
            Text(allCater.name)
                .foregroundColor(.secondary)
                .font(.system(size:18, weight: .semibold, design:.rounded))
        }
    }
}


struct ScrollCaterImageView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollCaterImageView()
        
    }
}
