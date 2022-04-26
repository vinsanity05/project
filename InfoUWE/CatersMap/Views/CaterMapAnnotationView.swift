//
//  CaterMapAnnotationView.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 03/02/2022.
//

import SwiftUI

// creating a custom annotation than just the SF symbols.  Same principle as the buildings map annotaton view

struct CaterMapAnnotationView: View {
    
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(.brown)
                .cornerRadius(36)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.brown)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 40)
        }
    }
}

struct CaterMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            CaterMapAnnotationView()
        }
    }
}

