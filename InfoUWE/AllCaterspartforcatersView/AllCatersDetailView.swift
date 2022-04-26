//
//  AlCatersDetailView.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 05/02/2022.
//

import SwiftUI
import AVFoundation
import MapKit

struct AllCatersDetailView: View {
    
    // Assigning from the model.
    var UWECater: AllCater
    
    var body: some View {
        // Scrollview so that the user can scroll up and down of the section.
        ScrollView {
            VStack(spacing: 20) {
                imageSection
            }
            Divider()
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    nameCaterSection
                    buttonSection
                }
            }
            Divider()
            descriptionSection
            // Link of the website.
            if let url = URL(string:UWECater.url) {
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

struct AllCatersDetailView_Previews: PreviewProvider {
    // Preview of the first cater.
    static var previews: some View {
        AllCatersDetailView(UWECater: AllCaterList.nameofcaters.first!)
    }
}

extension AllCatersDetailView {
    
    // Image of the caters.
    private var imageSection: some View {
        Image(UWECater.imageName)
            .resizable()
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.width, height: 400)
            .clipped()
            .cornerRadius(2)
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
    }
    // Name of the cater.
    private var nameCaterSection: some View {
        Text(UWECater.name)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .lineLimit(2)
            .multilineTextAlignment(.center)
            .padding()
    }
    // Button for the user to tap to listen for the description.
    private var buttonSection: some View {
        Button(action: {
            // let voice = AVSpeechSynthesisVoice(language: "en-UK") - puts the voice in english
            // Puts the voice in the preferred language voice.
            let voice = AVSpeechSynthesisVoice(language: "")
            let utterance = AVSpeechUtterance( string: UWECater.description)
            // Speed of the voice when talking.
            utterance.rate = 0.5
            utterance.voice = voice
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)
        })  {
            // Image of what the sound button looks like.
            Image(systemName: "speaker.wave.3.fill")
                .font(.system(size: 20))
                .foregroundColor(.primary)
                .padding()
        }
    }
    
    // Description of the cater.
    private var descriptionSection: some View {
        Text(LocalizedStringKey(UWECater.description), comment: "Cater description")
            .font(.subheadline)
            .foregroundColor(.secondary)
            .padding()
    }
    
    // Map of where the cater is.
    private var mapLayer: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: UWECater.coordinates,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))), annotationItems: [UWECater]) { cater in
                MapAnnotation(coordinate: cater.coordinates) {
                    CaterMapAnnotationView()
                        .shadow(radius: 10)
                }
            }
        // Disabling the map so they won't fiddle the map.
            .allowsHitTesting(false)
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(30)
    }
    
    // Button for the direction of the cater.
    private var directionSection: some View {
        Button(
            "View direction to the cater 📍",
            action: {
                // Calling the UWECater coordinates.
                let latitude = UWECater.coordinates.latitude
                let longitude = UWECater.coordinates.longitude
                let url = URL(string: "maps://?saddr=&daddr=\(latitude),\(longitude)")
                if UIApplication.shared.canOpenURL(url!) {
                    UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                }
            }
        )
    }
}
