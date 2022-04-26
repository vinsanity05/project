//
//  SettingsLabelView.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 25/02/2022.
//

import SwiftUI

struct SettingsLabelView: View {
    // Makes a variable and assigned it to a string.
    var Text: LocalizedStringKey
    var Image: String
    
    var body: some View {
        // HStack and calls the text and image.
        HStack {
            SwiftUI.Text(Text, comment: "restart app text").font(.system(size: 16, weight: .bold))
            Spacer()
            SwiftUI.Image(systemName: Image)
        }
        
    }
}

// Preview on what the text and image will say if called.
struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(Text: "Restart app", Image: "restart.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
