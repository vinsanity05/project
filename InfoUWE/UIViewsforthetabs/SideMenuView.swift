//
//  SideMenuView.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 23/02/2022.
//

import SwiftUI

struct SideMenuView: View {
    
    var body: some View {
        // this is the title of the sidemenu and modifers
        VStack {
            Text("Useful Information", comment: "title of the side menu")
                .font(.system(size:28, weight: .bold, design:.rounded))
                .foregroundColor(.white)
            
            Divider()
                .frame(width: 220, height: 2)
                .background(Color.white)
                .padding(.horizontal, 16)
            
            // link to the contact us website and modifers
            VStack {
                Link(destination: URL(string: "https://www.uwe.ac.uk/about/contact-us/how-to-contact-us")!) {
                    Text("Contact Us", comment: "link to contact UWE")
                }
                .font(.system(size:24, weight: .semibold, design:.rounded))
                .foregroundColor(.white)
                .padding()
            }
            // link to the information point website and modifiers
            VStack {
                Link(destination: URL(string: "https://www.uwe.ac.uk/life/campus-and-facilities/information-points")!) {
                    Text("Information Point", comment: "info point link")
                }
                .font(.system(size:24, weight: .semibold, design:.rounded))
                .foregroundColor(.white)
                .padding()
            }
            // link to the student services website and modifers
            VStack {
                Link(destination: URL(string: "https://www.uwe.ac.uk/about/services/student-and-academic-services")!) {
                    Text("Student services", comment: "student service link")
                }
                .font(.system(size:24, weight: .semibold, design:.rounded))
                .foregroundColor(.white)
                .padding()
            }
            // link to the info hub website and modifers
            VStack {
                Link(destination: URL(string: "https://infohub.uwe.ac.uk")!) {
                    Text("Info Hub", comment: "info hub link")
                }
                .font(.system(size:24, weight: .semibold, design:.rounded))
                .foregroundColor(.white)
                .padding()
            }
            // link to the staff directory website and modifers
            VStack {
                Link(destination: URL(string: "https://people.uwe.ac.uk")!) {
                    Text("Staff directory", comment: "staff directory link")
                }
                .font(.system(size:24, weight: .semibold, design:.rounded))
                .foregroundColor(.white)
                .padding()
            }
            //link to the IT services website and modifers
            VStack {
                Link(destination: URL(string: "https://www.uwe.ac.uk/study/it-services")!) {
                    Text("IT services", comment: "IT services link")
                }
                .font(.system(size:24, weight: .semibold, design:.rounded))
                .foregroundColor(.white)
                .padding()
            }
        }
        .padding(32)
        // this is for the colour of the background
        .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.3, green: 0.5, blue: 0.7), Color(red: 0.3, green: 0.7, blue: 0.9)]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.bottom)
    }
    
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}


