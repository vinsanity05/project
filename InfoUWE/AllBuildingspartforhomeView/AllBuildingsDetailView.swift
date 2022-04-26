//
//  AllBuildingsDetailView.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 05/02/2022.
//

import SwiftUI
import AVFoundation
import MapKit

struct AllBuildingsDetailView: View {
    
    //assinging from the model
    var UWEBuilding: AllBuilding
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                imageSection
            }
            Divider()
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    nameBuildingSection
                    buttonSection
                }
            }
            Divider()
            descriptionSection
            // This was initially used however, there were some links that did not work when using this, so i had to make the URL as a string itself instead of just a URL.
            //            Link(destination: UWEBuilding.url) {
            //                Text("Read More on UWE Website")
            //                    .bold()
            //                    .font(.title2)
            //                    .frame(width: 280, height: 50)
            //                    .background(Color(.systemRed))
            //                    .foregroundColor(.white)
            //                    .cornerRadius(10)
            if let url = URL(string:UWEBuilding.url) {
                Link("Read more on UWE Website", destination: url)
                    .font(.headline)
            }
            Divider()
            mapLayer
            directionSection
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.ultraThinMaterial)
    }
}

struct AllBuildingsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AllBuildingsDetailView(UWEBuilding: AllBuildingList.nameofbuildings.first!)
        //french language
        //           AllBuildingsDetailView(UWEBuilding: AllBuildingList.nameofbuildings.first!)
        //                .environment(\.locale, .init(identifier: "fr"))
    }
}

extension AllBuildingsDetailView {
    
    // image of the building
    private var imageSection: some View {
        Image(UWEBuilding.imageName)
            .resizable()
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.width, height: 400)
            .clipped()
            .cornerRadius(2)
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
    }
    // name of the building
    private var nameBuildingSection: some View {
        Text(UWEBuilding.name)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .lineLimit(2)
            .multilineTextAlignment(.center)
            .padding()
    }
    // button for the user to tap to listen for the description
    private var buttonSection: some View {
        Button(action: {
            // let voice = AVSpeechSynthesisVoice(language: "en-UK") - puts the voice in english
            // puts the voice in the preferred language voice.
            let voice = AVSpeechSynthesisVoice(language: "")
            let utterance = AVSpeechUtterance( string: UWEBuilding.description)
            // speed of the voice when talking
            utterance.rate = 0.5
            utterance.voice = voice
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)
        })  {
            //image of what the sound button looks like
            Image(systemName: "speaker.wave.3.fill")
                .font(.system(size: 20))
                .foregroundColor(.primary)
                .padding()
        }
    }
    
    // description of the building
    private var descriptionSection: some View {
        Text(LocalizedStringKey(UWEBuilding.description), comment: "building description")
            .font(.subheadline)
            .foregroundColor(.secondary)
            .padding()
    }
    
    // map of where the building is
    private var mapLayer: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: UWEBuilding.coordinates,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))), annotationItems: [UWEBuilding]) { building in
                MapAnnotation(coordinate: building.coordinates) {
                    BuildingMapAnnotationView()
                        .shadow(radius: 10)
                }
            }
        //disabling the map so they won't fiddle the map
            .allowsHitTesting(false)
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(30)
    }
    
    //button for the direction of the building
    private var directionSection: some View {
        Button(
            "View direction to the building 📍",
            action: {
                //calling the UWEBuilding coordinates
                let latitude = UWEBuilding.coordinates.latitude
                let longitude = UWEBuilding.coordinates.longitude
                let url = URL(string: "maps://?saddr=&daddr=\(latitude),\(longitude)")
                if UIApplication.shared.canOpenURL(url!) {
                    UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                }
            }
        )
    }
}
