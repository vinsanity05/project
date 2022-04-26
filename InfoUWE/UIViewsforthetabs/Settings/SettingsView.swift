//
//  SettingsView.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 25/02/2022.
//

import SwiftUI

struct SettingsView: View {
    
    // these text are used when the user taps the toggle button
    let Restarted: LocalizedStringKey = "RESTARTED"
    let tapToRestart: LocalizedStringKey = "TAP TO RESTART"
    
    // this will get the user to see the onboarding screen again if tapped. 
    @AppStorage("hasSeenOnboarding") private var isOnboarding = false
    
    var body: some View {
        
        NavigationView {
            Form {
                urgentSection
                socialSection
                restartSection
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    
    // this is just a section of where all the urgent services is such as the call and email links.
    private var urgentSection: some View {
        Section(header: Text("Urgent assistance - Please call or email and we will assist you, runs 24/7, 365 days a year", comment: "header of urgent assistance text").multilineTextAlignment(.leading)) {
            Link(destination: URL(string: socials.email)!) {
                Label("Email", systemImage: "envelope.badge.fill")
            }
            
            Link(destination: URL(string: socials.phone)!) {
                Label("Call", systemImage: "phone.fill")
                
            }
        }
        .font(.system(size: 16, weight: .semibold))
    }
    
    // this is basically a section of the links of the socials
    private var socialSection: some View {
        Section(header: Text("Follow us on our socials", comment: "header of follow us on socials")) {
            Link(destination: URL(string: socials.twitter)!) {
                Label("Follow us on Twitter", systemImage: "link")
            }
            Link(destination: URL(string: socials.instagram)!) {
                Label("Follow us on Instagram", systemImage: "link")
            }
            Link(destination: URL(string: socials.facebook)!) {
                Label("Follow us on Facebook", systemImage: "link")
            }
            
        }
        .font(.system(size: 16, weight: .semibold))
    }
    
    // this is basically a section where the user can tap the restart button to see the onboarding screens again.
    private var restartSection: some View {
        Section(header: Text("Restart", comment: "restart text header")) {
            GroupBox(
                label: SettingsLabelView(Text: "Onboarding screen?", Image: "restart.circle")
            ) {
                Divider().padding(.vertical, 4)
                Text("If you want, you can tap to see the onboarding screen again.", comment: "onboarding info again text")
                    .frame(minHeight: 60)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                
                // This will essentially restart the app and show the onobarding screen again
                Toggle(isOn: $isOnboarding) {
                    if isOnboarding {
                        Text(Restarted)
                            .fontWeight(.bold)
                            .foregroundColor(Color.green)
                    } else {
                        Text(tapToRestart)
                            .fontWeight(.bold)
                            .foregroundColor(Color.secondary)
                    }
                }
                .padding()
                // this is the background of the restart button
                .background(
                    Color(UIColor.tertiarySystemBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                )
            }
        }
        .font(.system(size: 16, weight: .semibold))
    }
}
