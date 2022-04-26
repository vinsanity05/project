//
//  BuildingMapAnnotationView.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 03/02/2022.
//

import SwiftUI

// This view essentially makes a custom annotation icon for the user to see from the SF symbols.
struct BuildingMapAnnotationView: View {
    
    // Accent colour from the assets folder.
    let accentColor = Color("AccentColor")
    
    var body: some View {
        VStack(spacing: 0) {
            // Uses the SF symbols.
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(accentColor)
                .cornerRadius(36)
            
            // Uses the SF symbols.
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 40)
        }
    }
}

struct BuildingMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            BuildingMapAnnotationView()
        }
    }
}
