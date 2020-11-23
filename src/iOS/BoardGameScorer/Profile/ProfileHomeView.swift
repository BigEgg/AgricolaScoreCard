//
//  ProfileView.swift
//  BoardGameScorer
//
//  Created by Jianming Xiao on 11/22/20.
//

import SwiftUI

struct ProfileHomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section {
                        SettingsRow(destinationView: LocalPlayersView(), caption: "Local Players", image: Image.init(systemName: "person.3"))
                    }
                    Section {
                        SettingsRow(destinationView: SettingView(), caption: "Settings", image: Image.init(systemName: "gearshape"))
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarTitle("Profile")
        }
    }
}

struct SettingsRow<Destination>: View where Destination : View {
    var destinationView: Destination
    var caption: String
    var image: Image
    
    var body: some View {
        NavigationLink(destination: destinationView) {
            VStack {
                HStack {
                    image
                        .foregroundColor(Color(UIColor.systemBlue))
                        .frame(width: 40, height: 40)
                    Text(caption)
                    Spacer()
                }
            }
        }
    }
}

struct ProfileHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabView() {
            ProfileHomeView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(TabType.Profile)
        }
    }
}
