//
//  HomeView.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 04/02/2022.
//

import SwiftUI

struct HomeView: View {
    // this is used for the user when they tap the toolbar
    @State private var showMenu: Bool = false
    //date built in API to show the current date and month
    @State var dateString = ""
    // this is used for when the user taps the view all buildings/caters
    @State var isViewAllBuildingsTapped = false
    @State var isViewAllCatersTapped = false
    // this is used for the get the weather API
    @StateObject var viewModel = WeatherViewModel()
    // this will use a Foundation API to format the date in any language for the date.
    let locale = Locale(identifier: Locale.current.identifier)
    
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack {
                        SUBuildingimage
                        BuildingSection
                        CaterSection
                    }
                    .onAppear{
                        // this is to format and structure what it will show on the screen of the date. This is used on all languages when changed on iphone settings instead of preview.
                        // so for instance
                        // English - Monday, March 21, 2022
                        // Japanese - 2022年3月21日月曜日
                        dateString = Date.now.formatted(.dateTime.weekday(.wide).month(.wide).day().year().locale(locale))
                    }
                }
                // this will check how much space there is when the user taps the sidemenu and how much it will fill when tapped.
                GeometryReader { _ in
                    HStack {
                        Spacer()
                        SideMenuView()
                            .offset(x: showMenu ? 0 : UIScreen.main.bounds.width)
                            .animation(.easeInOut(duration: 0.4), value: showMenu)
                    }
                }
                .background(Color.black.opacity(showMenu ? 0.5 : 0))
                
            }
            .navigationTitle("Home")
            // this is the side menu when the user taps the tool bar
            .toolbar {
                Button {
                    self.showMenu.toggle()
                } label: {
                    if showMenu {
                        Image(systemName: "xmark")
                            .font(.title)
                            .foregroundColor(.primary)
                        
                    } else {
                        Image(systemName: "text.justify")
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                    
                }
            }
        }
    }
}

// this is just previewing all the different languages
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        //english language
        HomeView()
            .environment(\.locale, .init(identifier: "en"))
        //french language
        HomeView()
            .environment(\.locale, .init(identifier: "fr"))
        //japanese language
        HomeView()
            .environment(\.locale, .init(identifier: "ja"))
    }
}

extension HomeView {
    
    //image of the SU building and real time date and time
    private var SUBuildingimage: some View {
        Image("SU building for homepage")
            .resizable()
            .scaledToFill()
            .clipped()
            .frame(width: 395, height: 400)
            .opacity(0.7)
            .shadow(color: .black, radius: 5)
        // Text of the today's date and modififers such as the size
            .overlay(Text((dateString))
                .font(.system(size:14, weight: .semibold, design:.rounded))
                .foregroundColor(.white)
                .offset(x:20,y:105),
                     alignment: .leading
            )
        //text greeting
            .overlay(Text("Welcome!", comment: "greetings")
                .font(.system(size:40, weight: .bold, design:.rounded))
                .foregroundColor(.white)
                .offset(x: 20, y:135),
                     alignment: .leading)
        
        // Weather information - real time
            .overlay(Text("It's currently \(viewModel.temp) at UWE \(viewModel.name), with a high of \(viewModel.tempMax) today.", comment: "weather info")
                .font(.system(size:12.5, weight: .bold, design:.rounded))
                .foregroundColor(.white)
                .offset(x:20,y:175),
                     alignment: .leading
            )
        
    }
    
    // building section part for the user to look at each building and when the user taps 'all buildings', it will be navigated for them to the page.
    private var BuildingSection: some View {
        VStack {
            HStack {
                Text("Buildings", comment: "Title of buildings")
                    .font(.system(size:28, weight: .bold, design:.rounded))
                    .foregroundColor(.primary)
                    .font(.title)
                    .padding(.leading)
                Spacer()
                Text("View all buildings ➡️ ", comment: " view all buildings navigation link when tapped")
                    .font(.system(size:14, weight: .semibold, design:.rounded))
                    .foregroundColor(.secondary)
                    .padding()
                    .onTapGesture {
                        //add code to fire off NavigationLink
                        isViewAllBuildingsTapped.toggle()
                    }
            }
            NavigationLink("", destination: AllBuildingsView(), isActive: $isViewAllBuildingsTapped)
            
            // horizontal scrollview for the user.
            BuildingImageScrollSection
        }
    }
    
    // scrollview for the user to scroll left and right of the buildings
    private var BuildingImageScrollSection: some View {
        // this is previous what i did, but because there is no function when the user taps this, it only shows the image.
        //        ScrollView(.horizontal) {
        //            HStack(spacing: 30) {
        //                VStack {
        //                    Image("Student union")
        //                        .resizable()
        //                        .scaledToFill()
        //                        .frame(width: 150, height: 150)
        //                        .cornerRadius(36)
        //                    Text("Student Union")
        //                        .foregroundColor(.secondary)
        //                        .font(.system(size:14, weight: .semibold, design:.rounded))
        //                }
        //                VStack {
        //                    Image("Bristol Business School")
        //                        .resizable()
        //                        .scaledToFill()
        //                        .frame(width: 150, height: 150)
        //                        .cornerRadius(36)
        //                    Text("Bristol Business School")
        //                        .foregroundColor(.secondary)
        //                        .font(.system(size:14, weight: .semibold, design:.rounded))
        //
        //                }
        //
        //                VStack {
        //                    Image("Bristol Robotics Lab")
        //                        .resizable()
        //                        .scaledToFill()
        //                        .frame(width: 150, height: 150)
        //                        .cornerRadius(36)
        //                    Text("Bristol Robotics Lab")
        //                        .foregroundColor(.secondary)
        //                        .font(.system(size:14, weight: .semibold, design:.rounded))
        //                }
        
        //        }
        //    }
        
        // so what I did is call this, so that the user can tap the building
        ScrollBuildingImageView()
        
        
    }
    
    
    //cater section for the user to view what UWE offers of the different caters with images. User can also tap view all caters.
    private var CaterSection: some View {
        VStack {
            HStack {
                Text("Caters", comment: "caters title")
                    .font(.system(size:28, weight: .bold, design:.rounded))
                    .foregroundColor(.primary)
                    .font(.title)
                    .padding(.leading)
                Spacer()
                Text("View all caters ➡️", comment: "view all caters navigation link when tapped")
                    .font(.system(size:14, weight: .semibold, design:.rounded))
                    .foregroundColor(.secondary)
                    .padding()
                    .onTapGesture {
                        //add code to fire off NavigationLink
                        isViewAllCatersTapped.toggle()
                    }
            }
            
            NavigationLink("", destination: AllCatersView(), isActive: $isViewAllCatersTapped)
            
            caterImageScrollSection
            
        }
    }
    
    //scrollview for the user to scroll left and right to view the different caters.
    private var caterImageScrollSection: some View {
        //        ScrollView(.horizontal) {
        //            HStack(spacing: 30) {
        //                VStack {
        //                    Image("costa coffee")
        //                        .resizable()
        //                        .scaledToFill()
        //                        .frame(width: 150, height: 150)
        //                        .cornerRadius(36)
        //                    Text("Costa Coffee")
        //                        .foregroundColor(.secondary)
        //                        .font(.system(size:14, weight: .semibold, design:.rounded))
        //                }
        //
        //                VStack {
        //                    Image("Subway 2")
        //                        .resizable()
        //                        .scaledToFill()
        //                        .frame(width: 150, height: 150)
        //                        .cornerRadius(36)
        //                    Text("Subway")
        //                        .foregroundColor(.secondary)
        //                        .font(.system(size:14, weight: .semibold, design:.rounded))
        //                }
        //
        //                VStack {
        //                    Image("The altrium")
        //                        .resizable()
        //                        .scaledToFill()
        //                        .frame(width: 150, height: 150)
        //                        .cornerRadius(36)
        //                    Text("The Altrium")
        //                        .foregroundColor(.secondary)
        //                        .font(.system(size:14, weight: .semibold, design:.rounded))
        //                }
        //
        //    }
        //
        //}
        ScrollCaterImageView()
    }
}




