//
//  CatersListView.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 03/02/2022.
//

import SwiftUI

// All of this is essentially used to give a list of caters for the user so when they tap on it. The preview will pop up of the chosen selection.
struct CatersListView: View {
    
    @EnvironmentObject private var vm_two: CatersViewModel
    
    
    var body: some View {
        // List of the caters and a button to direct to the cater when tapped.
        List {
            ForEach(vm_two.caters) { cater in
                Button {
                    vm_two.showNextCater(cater: cater)
                } label: {
                    listRowView(cater: cater)
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct CatersListView_Previews: PreviewProvider {
    static var previews: some View {
        CatersListView()
            .environmentObject(CatersViewModel())
    }
}

extension CatersListView {
    
    // Basically making sure that the cater is unique and it will present the image and name of the cater when user taps a cater from the list.
    
    private func listRowView(cater: Cater) -> some View {
        HStack{
            if let imageName = cater.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            // Aligning it to the left and present the name of the cater.
            VStack(alignment: .leading) {
                Text(cater.name)
                    .font(.headline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
}
