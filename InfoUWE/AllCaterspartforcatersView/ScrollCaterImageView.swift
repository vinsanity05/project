//
//  ScrollCaterImageView.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 26/02/2022.
//

import SwiftUI

struct ScrollCaterImageView: View {
    
    // Getting all the caters in the allcater model.
    var UWEcaters: [AllCater] = AllCaterList.nameofcaters
    
    
    var body: some View {
        // List of the caters and will be navigated to caters itself.
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                // This will limit how many caters when presenting on the scrollview from the array. So only 3 caters will be shown so it won't let the user keep scrolling.
                ForEach(UWEcaters.prefix(3),id: \.id) { cater in
                    NavigationLink(destination: AllCatersDetailView(UWECater: cater), label: {
                        ScrollImageCaterCell(allCater: cater)
                    })
                    
                }
            }
        }
        
    }
    
}

// Getting the name of the caters and the image name.
struct ScrollImageCaterCell: View {
    var allCater: AllCater
    var body: some View {
        // Image of the cater.
        VStack {
            Image(allCater.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 155, height:155)
                .cornerRadius(10)
                .padding(.vertical)
                .padding(.horizontal)
            // Name of the cater.
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
