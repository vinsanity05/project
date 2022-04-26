//
//  BuildingDetailView.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 03/02/2022.
//

import SwiftUI
import MapKit
import AVFoundation

struct BuildingDetailView: View {
    
    //accessing the view model
    @EnvironmentObject private var vm: BuildingsViewModel
    
    // building from the building model
    let building: Building
    
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

struct BuildingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        //preview of what the detail view looks like on the first array / first building
        BuildingDetailView(building: BuildingsDataService.buildings.first!)
            .environmentObject(BuildingsViewModel())
    }
}

extension BuildingDetailView {
    
    // image of the building
    private var imageSection: some View {
        //tab view and getting all the image names, so if there are more than 1 image, it will let the user scroll from left to right
        TabView {
            ForEach(building.imageNames, id: \.self) {
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
    // name of the building
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(building.name)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Spacer()
                // this button will make the user tap this symbol so the description can be read out loud.
                soundButton
            }
        }
    }
    
    // description of the building and facts about it. All of the descriptions will be changed from a different language depending on the user's ethnicity.
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(LocalizedStringKey(building.description),comment: "information and facts text")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            // link of the buildings website if they want to find out more about it.
            if let url = URL(string: building.link) {
                Link("Read more on UWE Website", destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
        }
    }
    
    // map of where the building is
    private var mapLayer: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: building.coordinates,
            //making sure that this can be shown clearly or where exactly the building is and be annotated pinned
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))), annotationItems: [building]) { building in
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
    
    // back button for the user to tap when they want to close it
    private var backButton: some View {
        Button {
            vm.sheetBuilding = nil
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
    
    // a button that will launch to apple maps and display where the building is.
    private var mapDirection: some View {
        Button(
            "View direction to the building 📍",
            action: {
                //calling the building coordinates
                let latitude = building.coordinates.latitude
                let longitude = building.coordinates.longitude
                //saddr (starting address) daddr(destination address)
                let url = URL(string: "maps://?saddr=&daddr=\(latitude),\(longitude)")
                if UIApplication.shared.canOpenURL(url!) {
                    UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                }
            }
        )
    }
    
    // a button for the user to tap so the user can listen to it instead of reading it. It will  help for people who struggle in reading.
    private var soundButton: some View {
        Button(action: {
            // let voice = AVSpeechSynthesisVoice(language: "en-UK") - puts the voice in english
            // puts the voice in the preferred language voice - when testing on different languages, sometimes it reads it english still but has an origins accent to it.
            let voice = AVSpeechSynthesisVoice(language: "")
            let utterance = AVSpeechUtterance( string: building.description)
            // speed of the voice when talking
            utterance.rate = 0.5
            utterance.voice = voice
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)
        })
        {
            //image of what the sound button looks like
            Image(systemName: "speaker.wave.3.fill")
                .font(.system(size: 32))
                .foregroundColor(.primary)
                .padding()
        }
    }
    
}
