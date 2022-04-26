//
//  ExploreView.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 05/02/2022.
//

import SwiftUI

struct ExploreView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    newsImage
                }
                Spacer()
                
                // this is the layout for the getting around things
                VStack {
                    HStack {
                        Text("Getting Around", comment: "get around text")
                            .font(.system(size:28, weight: .bold, design:.rounded))
                            .foregroundColor(.primary)
                            .font(.title)
                            .padding(.leading)
                        Spacer()
                    }
                    // this is so the user can scroll from the images and press out of the 3 to find what information they want to look for.
                    ScrollView(.horizontal) {
                        HStack(spacing: 30) {
                            campusMapSection
                            campusParkingSection
                            transportSection
                            
                        }
                    }
                }
                
                // this is another section for the user to find important resources such as their health, safety info and access apps for home
                VStack {
                    HStack {
                        Text("Helpful Resources", comment: "helpful resources text")
                            .font(.system(size:28, weight: .bold, design:.rounded))
                            .foregroundColor(.primary)
                            .font(.title)
                            .padding(.leading)
                        Spacer()
                    }
                    // scrollview of the 3 types of helpful resources
                    ScrollView(.horizontal) {
                        HStack(spacing: 30) {
                            emergencySection
                            wellbeingSection
                            moreAppsSection
                        }
                    }
                }
                
                VStack{
                    //showcase
                    showcaseSection
                    // link for events to UWE website
                    eventSection
                }
                
                // this is another section for the user to explore things such as shops and student's experience at UWE
                VStack {
                    HStack {
                        Text("More to explore", comment: "more to explore text")
                            .font(.system(size:28, weight: .bold, design:.rounded))
                            .foregroundColor(.primary)
                            .font(.title)
                            .padding(.leading)
                        Spacer()
                    }
                    // scrollview of 2 sources to explore
                    ScrollView(.horizontal) {
                        HStack(spacing: 30) {
                            shopSection
                            blogSection
                            
                        }
                    }
                }
            }
            //title
            .navigationTitle("Explore")
        }
    }
}

// preview of different languages, english, spanish and hindi
struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ExploreView()
            //english language
                .environment(\.locale, .init(identifier: "en"))
            //spanish language
            ExploreView()
                .environment(\.locale, .init(identifier: "es"))
            //hindi language
            ExploreView()
                .environment(\.locale, .init(identifier: "hi"))
        }
    }
}

extension ExploreView {
    
    // news image and modifiers
    private var newsImage: some View {
        Link(destination: URL(string: "https://www.uwe.ac.uk/news")!) {
            Image("news-latest-saatchi-exhibition")
                .resizable()
                .cornerRadius(45)
                .frame(width: 350, height: 300)
                .shadow(radius: 8)
                .contrast(0.5)
                .background()
                .clipped()
                .overlay(Text("Stay In The Know", comment: "top header of news image")
                    .font(.system(size:16, weight: .semibold, design:.rounded))
                    .foregroundColor(.white)
                    .offset(x: 20, y: -105),
                         alignment: .leading)
                .padding()
                .overlay(Text("News", comment: "News text of news image")
                    .font(.system(size:40, weight: .bold, design:.rounded))
                    .foregroundColor(.white)
                    .offset(x: 32, y: -75),
                         alignment: .leading)
                .overlay(Text("Check out the latest news about UWE", comment: "footer of the News image")
                    .font(.system(size:9.5, weight: .bold, design:.rounded))
                    .foregroundColor(.white)
                    .offset(x: 32, y: -45),
                         alignment: .leading)
        }
        
    }
    
    // campus map section with modifiers
    private var campusMapSection: some View {
        VStack {
            Link(destination: URL(string: "https://www.uwe.ac.uk/life/campus-and-facilities/frenchay-campus/frenchay-campus-map")!) {
                Image("frenchay-campus-map-image-840x470")
                    .resizable()
                    .cornerRadius(45)
                    .frame(width: 250, height: 150)
                    .shadow(radius: 3)
                    .contrast(0.5)
                    .background()
                    .clipped()
                    .overlay(Text("Campus Map", comment: "campus map text")
                        .font(.system(size:16, weight: .bold, design:.rounded))
                        .foregroundColor(.white)
                        .offset(x: 15, y: 30),
                             alignment: .leading)
                    .overlay(Text("Searchable UWE map", comment: "footer of campus map")
                        .font(.system(size:8.5, weight: .bold, design:.rounded))
                        .foregroundColor(.white)
                        .offset(x: 20, y: 55),
                             alignment: .leading)
            }
        }
    }
    
    //campus parking section with modifiers
    private var campusParkingSection: some View {
        VStack {
            Link(destination: URL(string: "https://www.uwe.ac.uk/life/campus-and-facilities/car-parking")!) {
                Image("parking image")
                    .resizable()
                    .cornerRadius(45)
                    .frame(width: 250, height: 150)
                    .shadow(radius: 3)
                    .contrast(0.5)
                    .background()
                    .clipped()
                    .overlay(Text("Campus Parking", comment: "campus parking text")
                        .font(.system(size:16, weight: .bold, design:.rounded))
                        .foregroundColor(.white)
                        .offset(x: 15, y: 30),
                             alignment: .leading)
                    .overlay(Text("Access UWE parking areas", comment: "footer of parking")
                        .font(.system(size:8.5, weight: .bold, design:.rounded))
                        .foregroundColor(.white)
                        .offset(x: 20, y: 55),
                             alignment: .leading)
            }
        }
    }
    
    // transport section with modifiers
    private var transportSection: some View {
        VStack {
            Link(destination: URL(string: "https://www.uwe.ac.uk/life/campus-and-facilities/getting-to-and-from-uwe#section-5")!) {
                Image("transport")
                    .resizable()
                    .cornerRadius(45)
                    .frame(width: 250, height: 150)
                    .shadow(radius: 3)
                    .contrast(0.5)
                    .background()
                    .clipped()
                    .overlay(Text("Transport", comment: "transport text")
                        .font(.system(size:16, weight: .bold, design:.rounded))
                        .foregroundColor(.white)
                        .offset(x: 15, y: 30),
                             alignment: .leading)
                    .overlay(Text("Information about transport", comment: "footer of transport image")
                        .font(.system(size:8.5, weight: .bold, design:.rounded))
                        .foregroundColor(.white)
                        .offset(x: 20, y: 55),
                             alignment: .leading)
            }
        }
    }
    
    // emergenecy section with modifiers.
    private var emergencySection: some View {
        VStack {
            Link(destination: URL(string: "https://www.uwe.ac.uk/life/health-and-wellbeing/staying-safe-on-and-off-campus")!) {
                Image("emergency")
                    .resizable()
                    .cornerRadius(45)
                    .frame(width: 250, height: 150)
                    .shadow(radius: 3)
                    .contrast(0.5)
                    .background()
                    .clipped()
                    .overlay(Text("Safety info", comment: "safety info text")
                        .font(.system(size:16, weight: .bold, design:.rounded))
                        .foregroundColor(.white)
                        .offset(x: 15, y: 30),
                             alignment: .leading)
                    .overlay(Text("Quickly access important resources", comment: "footer of important resources")
                        .font(.system(size:8.5, weight: .bold, design:.rounded))
                        .foregroundColor(.white)
                        .offset(x: 20, y: 55),
                             alignment: .leading)
            }
        }
    }
    
    //wellbeing section with modifiers
    private var wellbeingSection: some View {
        VStack {
            Link(destination: URL(string: "https://www.uwe.ac.uk/life/health-and-wellbeing/get-wellbeing-support/wellbeing-service")!) {
                Image("well being")
                    .resizable()
                    .cornerRadius(45)
                    .frame(width: 250, height: 150)
                    .shadow(radius: 3)
                    .contrast(0.5)
                    .background()
                    .clipped()
                    .overlay(Text("Well-being", comment: "Well being text")
                        .font(.system(size:16, weight: .bold, design:.rounded))
                        .foregroundColor(.white)
                        .offset(x: 15, y: 30),
                             alignment: .leading)
                    .overlay(Text("Help support services", comment: "footer of help services")
                        .font(.system(size:8.5, weight: .bold, design:.rounded))
                        .foregroundColor(.white)
                        .offset(x: 20, y: 55),
                             alignment: .leading)
            }
        }
    }
    
    // more apps section with modifiers.
    private var moreAppsSection: some View {
        VStack {
            Link(destination: URL(string: "https://www.uwe.ac.uk/study/it-services/software")!) {
                Image("more apps")
                    .resizable()
                    .cornerRadius(45)
                    .frame(width: 250, height: 150)
                    .shadow(radius: 3)
                    .contrast(0.5)
                    .background()
                    .clipped()
                    .overlay(Text("More apps", comment: "more apps text")
                        .font(.system(size:16, weight: .bold, design:.rounded))
                        .foregroundColor(.white)
                        .offset(x: 15, y: 30),
                             alignment: .leading)
                    .overlay(Text("Apps access", comment: "Apps access footer")
                        .font(.system(size:8.5, weight: .bold, design:.rounded))
                        .foregroundColor(.white)
                        .offset(x: 20, y: 55),
                             alignment: .leading)
            }
        }
        
    }
    
    // showcase section with modifiers.
    private var showcaseSection: some View {
        Link(destination: URL(string: "https://showcase.uwe.ac.uk")!) {
            Image("showcase")
                .resizable()
                .cornerRadius(45)
                .frame(width: 350, height: 300)
                .shadow(radius: 8)
                .contrast(0.5)
                .clipped()
                .padding()
                .overlay(Text("Featured", comment: "header of the showcase text")
                    .font(.system(size:16, weight: .semibold, design:.rounded))
                    .foregroundColor(.white)
                    .offset(x: 30, y: -95),
                         alignment: .leading)
        }
        .overlay(Text("Showcase", comment: "showcase text")
            .font(.system(size:40, weight: .bold, design:.rounded))
            .foregroundColor(.white)
            .offset(x: 30, y: -65),
                 alignment: .leading)
        .overlay(Text("Check out the latest work from student graduates", comment: "footer of the showcase image")
            .font(.system(size:9.5, weight: .bold, design:.rounded))
            .foregroundColor(.white)
            .offset(x: 30, y: -35),
                 alignment: .leading)
    }
    // event section with modifiers.
    private var eventSection: some View {
        Link(destination: URL(string: "https://info.uwe.ac.uk/events/eventlisting.aspx")!) {
            Image("events")
                .resizable()
                .cornerRadius(45)
                .frame(width: 350, height: 300)
                .shadow(radius: 8)
                .contrast(0.5)
                .clipped()
                .padding()
                .overlay(Text("What's Happening", comment: "header of the events image")
                    .font(.system(size:16, weight: .semibold, design:.rounded))
                    .foregroundColor(.white)
                    .offset(x: 30, y: -95),
                         alignment: .leading)
        }
        .overlay(Text("Events", comment: "event text")
            .font(.system(size:40, weight: .bold, design:.rounded))
            .foregroundColor(.white)
            .offset(x: 30, y: -65),
                 alignment: .leading)
        .overlay(Text("Explore upcoming events and things to do around UWE", comment: "footer of the event text")
            .multilineTextAlignment(.leading)
            .font(.system(size: 9.5, weight: .bold, design:.rounded))
            .foregroundColor(.white)
            .offset(x: 30, y: -35),
                 alignment: .leading)
    }
    // shop section with modifiers.
    private var shopSection: some View {
        VStack {
            Link(destination: URL(string: "https://www.uwe.ac.uk/life/discover-bristol/bristol-shopping")!) {
                Image("shopping")
                    .resizable()
                    .cornerRadius(45)
                    .frame(width: 250, height: 150)
                    .shadow(radius: 3)
                    .contrast(0.5)
                    .background()
                    .clipped()
                    .overlay(Text("Shops", comment: "shop title")
                        .font(.system(size:16, weight: .bold, design:.rounded))
                        .foregroundColor(.white)
                        .offset(x: 15, y: 30),
                             alignment: .leading)
                    .overlay(Text("Browse shopping spots", comment: "footer of the shop image")
                        .font(.system(size:8.5, weight: .bold, design:.rounded))
                        .foregroundColor(.white)
                        .offset(x: 20, y: 55),
                             alignment: .leading)
            }
        }
    }
    // blog section with modifiers.
    private var blogSection: some View {
        Link(destination: URL(string: "https://blogs.uwe.ac.uk/student-views/")!) {
            Image("student blog")
                .resizable()
                .cornerRadius(45)
                .frame(width: 250, height: 150)
                .shadow(radius: 3)
                .contrast(0.5)
                .background()
                .clipped()
                .overlay(Text("Student blogs", comment:"blog title")
                    .font(.system(size:16, weight: .bold, design:.rounded))
                    .foregroundColor(.white)
                    .offset(x: 15, y: 30),
                         alignment: .leading)
                .overlay(Text("Students experience at UWE", comment: "footer of the title")
                    .multilineTextAlignment(.leading)
                    .font(.system(size:8.5, weight: .bold, design:.rounded))
                    .foregroundColor(.white)
                    .offset(x: 20, y: 55),
                         alignment: .leading)
        }
    }
}
