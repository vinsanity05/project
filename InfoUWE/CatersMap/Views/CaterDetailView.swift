//
//  CaterDetailView.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 03/02/2022.
//

import SwiftUI
import MapKit
import AVFoundation

// This is basically used to give out a detail view about the cater.

struct CaterDetailView: View {
    
    //accessing the view model
    @EnvironmentObject private var vm_two: CatersViewModel
    
    // cater from the cater  model
    let cater: Cater
    
    var body: some View {
        // scrollview for the user can essentially scroll down and view all the other sections
        ScrollView {
            VStack {
                imageSection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                //aligning all of it to the left
                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                    Divider()
                    mapDirection
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        //aligns the backbutton at the top left
        .overlay(backButton, alignment: .topLeading)
    }
}

struct CaterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        //preview of what the detail view looks like on the first array / first cater
        CaterDetailView(cater: CatersDataService.caters.first!)
            .environmentObject(CatersViewModel())
    }
}

extension CaterDetailView {
    
    // image of the cater and modififers
    private var imageSection: some View {
        TabView {
            // this will give out a tab view and display the number of images there are in the model.
            ForEach(cater.imageNames, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    // name of the cater
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(cater.name)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Spacer()
                // this button will make the user tap this symbol so the description can be read out loud.
                soundButton
                
            }
        }
    }
    
    //description and link of the cater
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(LocalizedStringKey(cater.description), comment: "Text of caters")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            // link of the cater websitte
            if let url = URL(string: cater.link) {
                Link("Read more on UWE Website", destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
            
        }
    }
    
    // map of where the cater is
    private var mapLayer: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: cater.coordinates,
            //making sure that this can be shown clearly or where exactly the building is and be annotated pinned
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))), annotationItems: [cater]) { cater in
                MapAnnotation(coordinate: cater.coordinates) {
                    CaterMapAnnotationView()
                        .shadow(radius: 10)
                }
            }
        //disabling the map so they won't fiddle the map
            .allowsHitTesting(false)
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(30)
    }
    // back button for the user to dismiss when tapped.
    private var backButton: some View {
        Button {
            vm_two.sheetCater = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }
        
    }
    
    // a button of the direction of that cater place and launch to apple maps.
    private var mapDirection: some View {
        Button(
            "View direction to the cater 📍",
            action: {
                //calling the cater coordinates
                let latitude = cater.coordinates.latitude
                let longitude = cater.coordinates.longitude
                let url = URL(string: "maps://?saddr=&daddr=\(latitude),\(longitude)")
                if UIApplication.shared.canOpenURL(url!) {
                    UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                }
            }
        )
    }
    
    // button for the user to tap and listen without having to read the description.
    private var soundButton: some View {
        Button(action: {
            // let voice = AVSpeechSynthesisVoice(language: "en-UK") - puts the voice in english
            // puts the voice in the preferred language voice.
            let voice = AVSpeechSynthesisVoice(language: "")
            let utterance = AVSpeechUtterance( string: cater.description)
            // speed of the voice when talking
            utterance.rate = 0.5
            utterance.voice = voice
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)
        })  {
            //image of what the sound button looks like
            Image(systemName: "speaker.wave.3.fill")
                .font(.system(size: 32))
                .foregroundColor(.primary)
                .padding()
        }
    }
    
}
