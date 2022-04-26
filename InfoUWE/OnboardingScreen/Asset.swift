//
//  Asset.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 08/02/2022.
//



import Foundation
import SwiftUI

// This is holding the name of the asset and the type of the asset, so for instance they can configure what type it is that you want to set.

enum Types {
    // SF symbols.
    case sfSymbol
    // Names in the assets folder.
    case xcasset
}

// Defines the name of the type and assets.

struct Asset  {
    let assetName: String
    let astType: Types
}

// Computer property which essentially gives us the right content.

extension Asset {
    
    // Using a ViewBuilder to make sure that the computer property can accept one or more views.
    @ViewBuilder
    var creatingAsset: some View {
        
        // If the type is an SF symbol then we want to basically use an image and we are going to use the name to get the SF symbol.
        switch astType {
            
        case.sfSymbol:
            Image(systemName: assetName)
                .padding(.bottom, 50)
                .font(.system(size: 150, weight: .bold))

            // If the type is an asset then these modifiers will help make sure it is positioned correctly and looks okay.
        case .xcasset:
            VStack {
                Spacer()
                Image(assetName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 150, alignment: .bottom)
                    .padding(.bottom,50)
            }
        }
    }
}
